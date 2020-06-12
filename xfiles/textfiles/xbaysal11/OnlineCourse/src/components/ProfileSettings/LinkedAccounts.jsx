import React, { Component } from "react";
import styled from "styled-components";
import { Row, Col, Icon } from "antd";

class LinkedAccounts extends Component {
    render() {
        return (
            <Wrapper>
                <Margin>
                    <Row>
                        <Col span={12}>
                            <Row>
                                <Col span={4}>
                                    <Icon
                                        type="google"
                                        style={{
                                            fontSize: "20px",
                                            margin: "0 .2em",
                                            color: "#40A9FF"
                                        }}
                                    />
                                </Col>
                                <Col span={6}>Google</Col>
                                <Col span={14}>
                                    <Link>Link Account</Link>
                                </Col>
                            </Row>
                        </Col>
                        <Col span={12} />
                    </Row>
                </Margin>
                <Margin>
                    <Row>
                        <Col span={12}>
                            <Row>
                                <Col span={4}>
                                    <Icon
                                        type="github"
                                        style={{
                                            fontSize: "20px",
                                            margin: "0 .2em",
                                            color: "#40A9FF"
                                        }}
                                    />
                                </Col>
                                <Col span={6}>Github</Col>
                                <Col span={14}>
                                    <Link>Link Account</Link>
                                </Col>
                            </Row>
                        </Col>
                        <Col span={12} />
                    </Row>
                </Margin>
                <Margin>
                    <Row>
                        <Col span={12}>
                            <Row>
                                <Col span={4}>
                                    <Icon
                                        type="facebook"
                                        style={{
                                            fontSize: "20px",
                                            margin: "0 .2em",
                                            color: "#40A9FF"
                                        }}
                                    />
                                </Col>
                                <Col span={6}>Facebook</Col>
                                <Col span={14}>
                                    <Link>Link Account</Link>
                                </Col>
                            </Row>
                        </Col>
                        <Col span={12} />
                    </Row>
                </Margin>
                <Margin>
                    <Row>
                        <Col span={12}>
                            <Row>
                                <Col span={4}>
                                    <Icon
                                        type="twitter"
                                        style={{
                                            fontSize: "20px",
                                            margin: "0 .2em",
                                            color: "#40A9FF"
                                        }}
                                    />
                                </Col>
                                <Col span={6}>Twitter</Col>
                                <Col span={14}>
                                    <Link>Link Account</Link>
                                </Col>
                            </Row>
                        </Col>
                        <Col span={12} />
                    </Row>
                </Margin>
            </Wrapper>
        );
    }
}

export default LinkedAccounts;

const Wrapper = styled.form`
    background: #fff;
    padding: 2em;
    border-radius: 4px;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.15);
    margin: 24px 12px 52px 12px;
    min-height: 50%;
`;

const Margin = styled.div`
    margin-top: 2em;
    font-weight: 500;
`;
const Link = styled.a`
    border: #d06667 solid 1px;
    padding: 10px;
`;
