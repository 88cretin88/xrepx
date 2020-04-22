import React, { Component } from "react";
import { Container } from "..";
import styled from "styled-components";
import { Link } from "react-router-dom";
import { Card, Col, Row, Button, Icon, Rate } from "antd";
import Week from "./Week";
import Instructor from "../Instructors/Instructor";
import Faq from "./Faq";

class AboutJava extends Component {
    render() {
        return (
            <>
                <div style={{ background: "#fff" }}>
                    <Container>
                        <About>
                            <Row>
                                <Col span={15}>
                                    <h3>About this Specialization</h3>
                                    <Rate
                                        disabled
                                        allowHalf
                                        defaultValue={3.5}
                                    />
                                    <p>
                                        Take your first step towards a career in
                                        software development with this
                                        introduction to Java—one of the most
                                        in-demand programming languages and the
                                        foundation of the Android operating
                                        system. Designed for beginners, this
                                        Specialization will teach you core
                                        programming concepts and equip you to
                                        write programs to solve complex
                                        problems. In addition, you will gain the
                                        foundational skills a software engineer
                                        needs to solve real-world problems, from
                                        designing algorithms to testing and
                                        debugging your programs.
                                    </p>
                                </Col>
                                <Col span={9}>
                                    <Instructor />
                                </Col>
                            </Row>
                        </About>

                        <div style={{ background: "#fff", padding: "30px" }}>
                            <Row gutter={16}>
                                <Col span={8}>
                                    <Card title="Free" bordered={false} />
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="check-circle"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="twoTone"
                                            twoToneColor="#52c41a"
                                        />
                                        Access for 5 lessons
                                    </Card>
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="check-circle"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="outlined"
                                            twoToneColor="#52c41a"
                                        />{" "}
                                        No access to links
                                    </Card>
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="check-circle"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="outlined"
                                            twoToneColor="#52c41a"
                                        />{" "}
                                        No access ti write a comments
                                    </Card>

                                    <Card title="" bordered={false}>
                                        <Button
                                            type="primary"
                                            style={{ width: "240px" }}
                                        >
                                            Try for free
                                        </Button>
                                    </Card>
                                </Col>
                                <Col span={8}>
                                    <Card title="Pro " bordered={false} />
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="check-circle"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="twoTone"
                                            twoToneColor="#52c41a"
                                        />{" "}
                                        Access for all lessons
                                    </Card>
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="check-circle"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="twoTone"
                                            twoToneColor="#52c41a"
                                        />{" "}
                                        Access for all links
                                    </Card>
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="check-circle"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="twoTone"
                                            twoToneColor="#52c41a"
                                        />{" "}
                                        Access to write a comments
                                    </Card>
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="smile"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="twoTone"
                                            twoToneColor="#eb2f96"
                                        />{" "}
                                        30 day access
                                    </Card>
                                    <Card title="" bordered={false}>
                                        <Link to={"/lessons/12094/home"}>
                                            <Button
                                                type="primary"
                                                style={{ width: "240px" }}
                                            >
                                                Try for free
                                            </Button>
                                        </Link>
                                    </Card>
                                </Col>
                                <Col span={8}>
                                    <Card title="Premium" bordered={false} />
                                    <Card title="" bordered={true}>
                                        <Icon
                                            type="heart"
                                            style={{
                                                fontSize: "25px",
                                                marginRight: "8px"
                                            }}
                                            theme="twoTone"
                                            twoToneColor="red"
                                        />{" "}
                                        Full course lifetime access
                                    </Card>
                                    <Card title="" bordered={false}>
                                        <Button
                                            type="primary"
                                            style={{ width: "240px" }}
                                        >
                                            Try for free
                                        </Button>
                                    </Card>
                                </Col>
                            </Row>
                        </div>
                    </Container>
                    <Week />
                    <Container>
                        <Faq />
                    </Container>
                </div>
            </>
        );
    }
}

export default AboutJava;

const About = styled.div`
    padding-top: 60px;
    h3 {
        margin-bottom: 10px;
        padding: 0;
    }
    p {
        margin-top: 10px;
    }
`;
