<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
 <!ENTITY % general-entities SYSTEM "FAKEDIR/general.ent">
  %general-entities;
]>

<!-- $Id: clfs.xsl 3799 2014-05-31 06:57:41Z pierre $ -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl"
    version="1.0">

<!-- XSLT stylesheet to create shell scripts from CLFS books. -->

  <!-- Build method used -->
  <xsl:param name="method" select="chroot"/>

  <!-- Run test suites?
       0 = none
       1 = only Glibc, GCC and Binutils testsuites
       2 = all testsuites
       3 = alias to 2
  -->
  <xsl:param name="testsuite" select="1"/>

  <!-- Bomb on test suites failures?
       n = no, I want to build the full system and review the logs
       y = yes, bomb at the first test suite failure to can review the build dir
  -->
  <xsl:param name="bomb-testsuite" select="n"/>

  <!-- Install vim-lang package? OBSOLETE should always be 'n'-->
  <xsl:param name="vim-lang" select="n"/>

  <!-- Time zone -->
  <xsl:param name="timezone" select="GMT"/>

  <!-- Page size -->
  <xsl:param name="page" select="letter"/>

  <!-- Locale settings -->
  <xsl:param name="lang" select="C"/>

  <!-- Sparc64 processor type -->
  <xsl:param name="sparc" select="none"/>

  <!-- x86 32 bit target triplet -->
  <xsl:param name="x86" select="i686-pc-linux-gnu"/>

  <!-- mips target triplet -->
  <xsl:param name="mips" select="mips-unknown-linux-gnu"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//sect1"/>
  </xsl:template>

  <xsl:template match="sect1">
    <xsl:choose>
      <xsl:when test="../@id='chapter-partitioning' or
                      ../@id='chapter-getting-materials'"/>
      <xsl:when test="../@id='chapter-testsuite-tools' and $testsuite='0'"/>
      <xsl:when test="../@id='chapter-boot' and $method='chroot'"/>
      <xsl:when test="../@id='chapter-chroot' and $method='boot'"/>
      <xsl:otherwise>
        <xsl:if test="count(descendant::screen/userinput) &gt; 0 and
                      count(descendant::screen/userinput) &gt;
                      count(descendant::screen[@role='nodump'])">
            <!-- The dirs names -->
          <xsl:variable name="pi-dir" select="../processing-instruction('dbhtml')"/>
          <xsl:variable name="pi-dir-value" select="substring-after($pi-dir,'dir=')"/>
          <xsl:variable name="quote-dir" select="substring($pi-dir-value,1,1)"/>
          <xsl:variable name="dirname" select="substring-before(substring($pi-dir-value,2),$quote-dir)"/>
            <!-- The file names -->
          <xsl:variable name="pi-file" select="processing-instruction('dbhtml')"/>
          <xsl:variable name="pi-file-value" select="substring-after($pi-file,'filename=')"/>
          <xsl:variable name="filename" select="substring-before(substring($pi-file-value,2),'.html')"/>
            <!-- The build order -->
          <xsl:variable name="position" select="position()"/>
          <xsl:variable name="order">
            <xsl:choose>
              <xsl:when test="string-length($position) = 1">
                <xsl:text>00</xsl:text>
                <xsl:value-of select="$position"/>
              </xsl:when>
              <xsl:when test="string-length($position) = 2">
                <xsl:text>0</xsl:text>
                <xsl:value-of select="$position"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$position"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
            <!-- Creating dirs and files -->
          <exsl:document href="{$dirname}/{$order}-{$filename}" method="text">
            <xsl:choose>
              <xsl:when test="@id='ch-chroot-changingowner' or
                        @id='ch-chroot-creatingdirs' or
                        @id='ch-chroot-createfiles' or
                        @id='ch-system-stripping'">
                <xsl:text>#!/tools/bin/bash&#xA;set +h&#xA;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>#!/bin/bash&#xA;set +h&#xA;</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="not(@id='ch-system-stripping')">
              <xsl:text>set -e</xsl:text>
            </xsl:if>
            <xsl:text>&#xA;</xsl:text>
            <xsl:if test="sect2[@role='installation'] and
                          not(@id='ch-system-multiarch-wrapper')">
              <xsl:text>cd $PKGDIR&#xA;</xsl:text>
              <xsl:if test="@id='ch-system-vim' and $vim-lang = 'y'">
                <xsl:text>tar -xvf ../vim-&vim-version;-lang.* --strip-components=1&#xA;</xsl:text>
              </xsl:if>
            </xsl:if>
            <xsl:apply-templates select=".//para/userinput | .//screen"/>
            <xsl:if test="not(@id='ch-chroot-chroot')">
              <xsl:text>echo -e "\n\nTotalseconds: $SECONDS\n"&#xA;</xsl:text>
            </xsl:if>
            <xsl:text>exit</xsl:text>
          </exsl:document>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="screen">
    <xsl:if test="child::* = userinput and not(@role = 'nodump')">
      <xsl:apply-templates select="userinput" mode="screen"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="para/userinput">
    <xsl:if test="(contains(string(),'test') or
            contains(string(),'check')) and
            ($testsuite = '2' or $testsuite = '3')">
      <xsl:choose>
        <xsl:when test="$bomb-testsuite = 'n'">
          <xsl:value-of select="substring-before(string(),'make')"/>
          <xsl:text>make -k</xsl:text>
          <xsl:value-of select="substring-after(string(),'make')"/>
          <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
          <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1</xsl:text>
          <xsl:if test="contains(string(),' -k ')">
            <xsl:text> || true</xsl:text>
          </xsl:if>
          <xsl:text>&#xA;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template match="userinput" mode="screen">
    <xsl:choose>
      <!-- Estandarized package formats -->
      <xsl:when test="contains(string(),'tar.gz')">
        <xsl:value-of select="substring-before(string(),'tar.gz')"/>
        <xsl:text>tar.*</xsl:text>
        <xsl:value-of select="substring-after(string(),'tar.gz')"/>
        <xsl:text>&#xA;</xsl:text>
      </xsl:when>
      <!-- Setting $LANG for /etc/profile -->
      <xsl:when test="ancestor::sect1[@id='ch-scripts-profile'] and
                contains(string(),'export LANG=')">
        <xsl:value-of select="substring-before(string(),'export LANG=')"/>
        <xsl:text>export LANG=</xsl:text>
        <xsl:value-of select="$lang"/>
        <xsl:value-of select="substring-after(string(),'charmap]')"/>
        <xsl:text>&#xA;</xsl:text>
      </xsl:when>
      <!-- Compile the keymap into the kernel has been disabled for 1.0 -->
      <xsl:when test="contains(string(),'defkeymap')"/>
      <!-- Copying the kernel config file -->
      <xsl:when test="string() = 'make mrproper'">
        <xsl:text>make mrproper&#xA;</xsl:text>
        <xsl:if test="ancestor::sect1[@id='ch-boot-kernel']">
          <xsl:text>cp -v ../bootkernel-config .config&#xA;</xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::sect1[@id='ch-bootable-kernel']">
          <xsl:text>cp -v ../kernel-config .config&#xA;</xsl:text>
        </xsl:if>
      </xsl:when>
      <!-- No interactive commands are needed if the .config file is the proper one -->
      <xsl:when test="contains(string(),'menuconfig')"/>
<!-- test instructions -->
       <xsl:when test="@remap = 'test'">
        <xsl:choose>
          <!-- Avoid executing the note before perl tests while in 'chroot' -->
          <xsl:when test="ancestor::note[@os='a00'] and $method='chroot'"/>
          <xsl:when test="$testsuite = '0'"/>
          <xsl:when test=
            "$testsuite = '1' and
              not(ancestor::sect1[@id='ch-system-gcc']) and
              not(ancestor::sect1[contains(@id,'ch-system-eglibc')]) and
              not(ancestor::sect1[contains(@id,'ch-system-glibc')]) and
              not(ancestor::sect1[contains(@id,'ch-system-gmp')]) and
              not(ancestor::sect1[contains(@id,'ch-system-mpfr')]) and
              not(ancestor::sect1[contains(@id,'ch-system-mpc')]) and
              not(ancestor::sect1[contains(@id,'ch-system-ppl')]) and
              not(ancestor::sect1[contains(@id,'ch-system-isl')]) and
              not(ancestor::sect1[contains(@id,'ch-system-cloog')]) and
              not(ancestor::sect1[contains(@id,'ch-system-cloog-ppl')]) and
              not(ancestor::sect1[@id='ch-system-binutils'])"/>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$bomb-testsuite = 'n'">
                <xsl:choose>
                  <!-- special case for (e)glibc -->
                  <xsl:when test="contains(string(), 'glibc-check-log')">
                    <xsl:value-of
                       select="substring-before(string(),'2&gt;&amp;1')"/>
                    <xsl:text>&gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
                  </xsl:when>
                  <!-- special case for procps-ng -->
                  <xsl:when test="contains(string(), 'pushd')">
                    <xsl:text>{ </xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>; } &gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
                  </xsl:when>
                  <xsl:when test="contains(string(), 'make -k')">
                    <xsl:apply-templates/>
                    <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
                  </xsl:when>
                  <xsl:when test="contains(string(), 'make')">
                    <xsl:value-of select="substring-before(string(),'make')"/>
                    <xsl:text>make -k</xsl:text>
                    <xsl:value-of select="substring-after(string(),'make')"/>
                    <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates/>
                    <xsl:if test="not(contains(string(), '&gt;&gt;'))">
                      <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1</xsl:text>
                    </xsl:if>
                    <xsl:text>&#xA;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise>
                <!-- bomb-testsuite != 'n'-->
                <xsl:choose>
                  <!-- special case for (e)glibc -->
                  <xsl:when test="contains(string(), 'glibc-check-log')">
                    <xsl:value-of
                       select="substring-before(string(),'2&gt;&amp;1')"/>
                    <xsl:text>&gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
                  </xsl:when>
                  <!-- special case for gmp -->
                  <xsl:when test="contains(string(), 'tee gmp-check-log')">
                    <xsl:text>(</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>&gt;&gt; $TEST_LOG 2&gt;&amp;1 &amp;&amp; exit $PIPESTATUS)&#xA;</xsl:text>
                  </xsl:when>
                  <!-- special case for procps-ng -->
                  <xsl:when test="contains(string(), 'pushd')">
                    <xsl:text>{ </xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>; } &gt;&gt; $TEST_LOG 2&gt;&amp;1&#xA;</xsl:text>
                  </xsl:when>
		  <xsl:when test="contains(string(), 'make -k')">
		    <xsl:apply-templates/>
		    <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
		  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates/>
                    <xsl:if test="not(contains(string(), '&gt;&gt;'))">
                      <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1</xsl:text>
                    </xsl:if>
                    <xsl:text>&#xA;</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
<!-- End of test instructions -->

      <!-- Fixing toolchain test suites run XXX more to fix -->
      <xsl:when test="contains(string(),'glibc-check-log')">
        <xsl:choose>
          <xsl:when test="$testsuite != '0'">
            <xsl:value-of select="substring-before(string(),'2&gt;')"/>
            <xsl:choose>
              <xsl:when test="$bomb-testsuite = 'n'">
                <xsl:text>&gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>&gt;&gt; $TEST_LOG 2&gt;&amp;1</xsl:text>
                <xsl:if test="contains(string(),' -k ')">
                  <xsl:text> || true</xsl:text>
                </xsl:if>
                <xsl:text>&#xA;</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="string() = 'make check' or
                contains(string(), 'make -k check')">
        <xsl:choose>
          <xsl:when test="$testsuite != '0'">
            <xsl:choose>
              <xsl:when test="$bomb-testsuite = 'n'">
                <xsl:text>make -k check &gt;&gt; $TEST_LOG 2&gt;&amp;1 || true&#xA;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates/>
                <xsl:text> &gt;&gt; $TEST_LOG 2&gt;&amp;1</xsl:text>
                <xsl:if test="contains(string(),' -k ')">
                  <xsl:text> || true</xsl:text>
                </xsl:if>
                <xsl:text>&#xA;</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="contains(string(),'test_summary') or
                contains(string(),'expect -c')">
        <xsl:choose>
          <xsl:when test="$testsuite != '0'">
            <xsl:apply-templates/>
            <xsl:text> &gt;&gt; $TEST_LOG&#xA;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <!-- Don't stop on strip run -->
      <xsl:when test="contains(string(),'strip ')">
        <xsl:apply-templates/>
        <xsl:text> || true&#xA;</xsl:text>
      </xsl:when>
      <!-- Add -j1 to make install commands -->
      <xsl:when test="contains(string(),'make ') and
                      contains(string(),'install')">
        <xsl:value-of select="substring-before(string(),'make ')"/>
        <xsl:text>make -j1 </xsl:text>
        <xsl:value-of select="substring-after(string(),'make ')"/>
        <xsl:text>&#xA;</xsl:text>
      </xsl:when>
      <!-- The rest of commands -->
      <xsl:otherwise>
        <xsl:apply-templates/>
        <xsl:text>&#xA;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="replaceable">
    <xsl:choose>
      <xsl:when test="ancestor::sect1[@id='ch-system-glibc']">
        <xsl:value-of select="$timezone"/>
      </xsl:when>
      <xsl:when test="ancestor::sect1[@id='ch-system-eglibc']">
        <xsl:value-of select="$timezone"/>
      </xsl:when>
      <xsl:when test="ancestor::sect1[@id='ch-system-groff']">
        <xsl:value-of select="$page"/>
      </xsl:when>
      <xsl:when test="ancestor::sect1[@id='ch-cross-tools-flags']">
        <xsl:choose>
          <xsl:when test="contains(string(),'BUILD32')">
            <xsl:choose>
              <xsl:when test="$sparc = '1' or $sparc = '2'">
                <xsl:text>-m32 -mcpu=ultrasparc -mtune=ultrasparc</xsl:text>
              </xsl:when>
              <xsl:when test="$sparc = '3'">
                <xsl:text>-m32 -mcpu=ultrasparc3 -mtune=ultrasparc3</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="contains(string(),'BUILD64')">
            <xsl:choose>
              <xsl:when test="$sparc = '1' or $sparc = '2'">
                <xsl:text>-m64 -mcpu=ultrasparc -mtune=ultrasparc</xsl:text>
              </xsl:when>
              <xsl:when test="$sparc = '3'">
                <xsl:text>-m64 -mcpu=ultrasparc3 -mtune=ultrasparc3</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="contains(string(),'GCCTARGET')">
            <xsl:choose>
              <xsl:when test="$sparc = '1' or $sparc = '2'">
                <xsl:text>-mcpu=ultrasparc -mtune=ultrasparc</xsl:text>
              </xsl:when>
              <xsl:when test="$sparc = '3'">
                <xsl:text>-mcpu=ultrasparc3 -mtune=ultrasparc3</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="ancestor::sect1[@id='ch-final-preps-variables']">
        <xsl:choose>
          <xsl:when test="contains(string(),'target triplet')">
            <xsl:value-of select="$x86"/>
          </xsl:when>
          <xsl:when test="contains(string(),'mips')">
            <xsl:value-of select="$mips"/>
          </xsl:when>
          <xsl:when test="contains(string(),'BUILD32')">
            <xsl:choose>
              <xsl:when test="$sparc = '1' or $sparc = '2'">
                <xsl:text>-m32 -mcpu=ultrasparc -mtune=ultrasparc</xsl:text>
              </xsl:when>
              <xsl:when test="$sparc = '3'">
                <xsl:text>-m32 -mcpu=ultrasparc3 -mtune=ultrasparc3</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="contains(string(),'BUILD64')">
            <xsl:choose>
              <xsl:when test="$sparc = '1' or $sparc = '2'">
                <xsl:text>-m64 -mcpu=ultrasparc -mtune=ultrasparc</xsl:text>
              </xsl:when>
              <xsl:when test="$sparc = '3'">
                <xsl:text>-m64 -mcpu=ultrasparc3 -mtune=ultrasparc3</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="contains(string(),'GCCTARGET')">
            <xsl:choose>
              <xsl:when test="$sparc = '1' or $sparc = '2'">
                <xsl:text>-mcpu=ultrasparc -mtune=ultrasparc</xsl:text>
              </xsl:when>
              <xsl:when test="$sparc = '3'">
                <xsl:text>-mcpu=ultrasparc3 -mtune=ultrasparc3</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>**EDITME</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>EDITME**</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
