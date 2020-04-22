import React, { Component } from "react";
import { Row as RowAntd, Col } from "antd";
import styled from "styled-components";
import { colors } from "../../config";
import { Container } from "../index";

import logo from "../../assets/img/logo.png";

class Footer extends Component {
    render() {
        return (
            <FooterMain>
                <Container>
                    <Row>
                        <Col span={8}>
                            <Social>
                                <h5>Social Media</h5>
                                <ul>
                                    <li>
                                        <a href="https://www.facebook.com/groups/677106115786158">
                                            Facebook
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.instagram.com/itacademy.kg/">
                                            Instagram
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/">itacademy98@gmail.com</a>
                                    </li>
                                </ul>
                            </Social>
                        </Col>
                        <Col span={8}>
                            <Courses>
                                <h5>Courses</h5>
                                <ul>
                                    <li>
                                        <a target="_blank" href="/">
                                            Java
                                        </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="/">
                                            Python
                                        </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="/">
                                            JavaScript
                                        </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="/">
                                            Ruby
                                        </a>
                                    </li>
                                </ul>
                            </Courses>
                        </Col>
                        <Col span={8}>
                            <Links>
                                <h5>Links</h5>
                                <ul>
                                    <li>
                                        <a target="_blank" href="/">
                                            About Project
                                        </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="/">
                                            Courses
                                        </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="/">
                                            Filials
                                        </a>
                                    </li>
                                </ul>
                            </Links>
                        </Col>
                    </Row>
                    <Row>
                        <Col offset={4}>
                            <Flex>
                                <Logo>
                                    <img src={logo} alt="" />
                                </Logo>
                                <Copyright>
                                    <p>
                                        © Все права защищены 2019. Разработал и
                                        поддерживает IT-Lab
                                    </p>
                                </Copyright>
                            </Flex>
                        </Col>
                    </Row>
                </Container>
            </FooterMain>
        );
    }
}

export default Footer;

const Logo = styled.div`
    margin: 1em;
`;

const Copyright = styled.div`
    color: #b2bec3;
    margin-top: 1.5em;
`;
const Flex = styled.div`
    display: flex;
`;
const FooterMain = styled.div`
    background: linear-gradient(0deg, ${colors.main} 0%, rgba(0, 0, 0, 1) 100%);
`;

const Row = styled(RowAntd)``;
const Box = styled.div`
    color: #fff;
    height: 35vh;
    padding: 0 5vw;
    text-transform: uppercase;

    h5 {
        padding-top: 3vh;
        margin: 2vh 0 0 0;
        font-size: 1.1em;
        color: #fff;
        font-weight: bold;
        &::after {
            content: "";
            position: absolute;
            width: 30px;
            height: 2px;
            background-color: #fff;
            top: 3.8em;
            left: 4.4em;
        }
    }

    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        li {
            margin-top: 0.8em;
        }
    }

    a {
        color: #b2bec3;
        font-size: 0.8em;
        font-weight: 600;

        &:hover {
            color: #fff;
        }
    }
`;

const Social = styled(Box)``;
const Courses = styled(Box)``;
const Links = styled(Box)``;
