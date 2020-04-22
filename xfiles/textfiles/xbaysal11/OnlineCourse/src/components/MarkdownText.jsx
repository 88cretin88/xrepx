import React, { Component } from "react";
import PT from "prop-types";
import remark from "remark";
import remark2react from "remark-react";
import Highlight, { defaultProps } from "prism-react-renderer";
import duotoneLight from "../../node_modules/prism-react-renderer/themes/duotoneLight";
import styled from "styled-components";

const pre = props => {
    const code = props.children[0];
    const text = code.props.children[0];
    // debugger;
    return (
        <Wrapper>
            <Highlight
                {...defaultProps}
                code={text}
                language="jsx"
                theme={duotoneLight}
            >
                {({ style, tokens, getLineProps, getTokenProps }) => (
                    <pre style={style} className={"line"}>
                        {tokens.map((line, i) => (
                            <div key={i} {...getLineProps({ line })}>
                                {line.map((token, key) => (
                                    <span
                                        key={key}
                                        {...getTokenProps({ token })}
                                    />
                                ))}
                            </div>
                        ))}
                        <div className="line-numbers-rows">
                            {tokens.map((_, i) => (
                                <span key={i} className="line-number">
                                    {i}
                                </span>
                            ))}
                        </div>
                    </pre>
                )}
            </Highlight>
        </Wrapper>
    );
};

pre.propTypes = { children: PT.any };

class MarkdownText extends Component {
    static propTypes = {
        text: PT.string
    };
    render() {
        return (
            <div>
                {
                    remark()
                        .use(remark2react, {
                            remarkReactComponents: { pre }
                        })
                        .processSync(this.props.text).contents
                }
            </div>
        );
    }
}
export default MarkdownText;
const Wrapper = styled.div`
    & .line-numbers-rows {
        position: absolute;
        pointer-events: none;
        top: 0;
        font-size: 100%;
        width: 3em;
        letter-spacing: -1px;
        border-right: 1px solid #999;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        left: 0;
    }

    & .line-numbers-rows span {
        pointer-events: none;
        display: block;
        counter-increment: linenumber;
        height: 20px;
        padding-left: 1.2em;
    }

    & .line {
        position: relative;
        padding-left: 3.8em;
    }

    & .line-number {
        color: #000;
    }
`;
