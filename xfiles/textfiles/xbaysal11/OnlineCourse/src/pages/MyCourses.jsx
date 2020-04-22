import React, { Component } from "react";
import { PageHeader, Container } from "../components";
import styled from "styled-components";
import { Row, Col, Button } from "antd";
import { NavLink } from "react-router-dom";

class MyCourses extends Component {
    render() {
        return (
            <Wrapper>
                <Intro>
                    <h3>Last Active</h3>
                    <p>Courses are sorted by your last activity.</p>
                </Intro>

                <Courses>
                    <MyCourse>
                        <Row>
                            <Col span={8}>
                                <Center>
                                    <Image1>
                                        <img
                                            src="https://img.icons8.com/color/500/000000/java-coffee-cup-logo.png"
                                            alt=""
                                        />
                                        <h5>JAVA COURSE</h5>
                                    </Image1>
                                </Center>
                            </Col>
                            <Col span={8}>
                                <h5>About Course</h5>
                                There’s thrill, intensity, insanity and
                                horsepower in Jordan Belfort’s speech where he
                                motivates his employees to take on the world
                                with their work. There are only 2 possibilities
                                if we ever listened to a speech like this in
                                real life — either we’ll change ourselves, or
                                we’ll change the world.
                            </Col>
                            <AboutCourse>
                                <Col span={8}>
                                    <Button type="primary">Go to course</Button>
                                </Col>
                            </AboutCourse>
                        </Row>
                    </MyCourse>
                </Courses>

                <Courses>
                    <MyCourse>
                        <Row>
                            <Col span={8}>
                                <Center>
                                    <Image1>
                                        <img
                                            src="https://img.icons8.com/color/480/000000/python.png"
                                            alt=""
                                        />
                                        <h5>PYTHON COURSE</h5>
                                    </Image1>
                                </Center>
                            </Col>
                            <Col span={8}>
                                <h5>About Course</h5>
                                There’s thrill, intensity, insanity and
                                horsepower in Jordan Belfort’s speech where he
                                motivates his employees to take on the world
                                with their work. There are only 2 possibilities
                                if we ever listened to a speech like this in
                                real life — either we’ll change ourselves, or
                                we’ll change the world.
                            </Col>
                            <AboutCourse>
                                <Col span={8}>
                                    <Button type="primary">Go to course</Button>
                                </Col>
                            </AboutCourse>
                        </Row>
                    </MyCourse>
                </Courses>
                <Intro>
                    <h3>Active Courses You Can Take</h3>
                    <p>This courses are avaliable now.</p>
                </Intro>

                <Row type="flex" justify="space-between">
                    <Col span={5}>
                        <Course>
                            <Image>
                                <img
                                    src="https://img.icons8.com/color/500/000000/java-coffee-cup-logo.png"
                                    alt=""
                                />
                            </Image>
                            <Top>Java</Top>
                            <NavLink to="/java">
                                <Button type="primary">Go to Course</Button>
                            </NavLink>
                        </Course>
                    </Col>
                    <Col span={5}>
                        <Course>
                            <Image>
                                <img
                                    src="https://img.icons8.com/color/480/000000/python.png"
                                    alt=""
                                />
                            </Image>
                            <Top>Python</Top>
                            <NavLink to="/java">
                                <Button type="primary">Go to Course</Button>
                            </NavLink>
                        </Course>
                    </Col>
                    <Col span={5}>
                        <Course>
                            <Image>
                                <img
                                    src="https://img.icons8.com/color/480/000000/javascript.png"
                                    alt=""
                                />
                            </Image>
                            <Top>JavaScript</Top>
                            <NavLink to="/java">
                                <Button type="primary">Go to Course</Button>
                            </NavLink>
                        </Course>
                    </Col>
                    <Col span={5}>
                        <Course>
                            <Image>
                                <img
                                    src="https://img.icons8.com/color/480/000000/ruby-programming-language.png"
                                    alt=""
                                />
                            </Image>
                            <Top>Ruby</Top>
                            <NavLink to="/java">
                                <Button type="primary">Go to Course</Button>
                            </NavLink>
                        </Course>
                    </Col>
                </Row>
            </Wrapper>
        );
    }
}

export default MyCourses;

const Wrapper = styled.form`
    background: #fff;
    padding: 2em;
    border-radius: 4px;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.15);
    margin: 24px 12px 52px 12px;
    min-height: 50%;
`;

const Courses = styled.div`
    border: #d8d8d8 solid 1px;
    margin-bottom: 30px;
`;

const MyCourse = styled.div`
    border: #d8d8d8 solid 1px;
    padding: 40px;
`;

const Intro = styled.div`
    margin-top: 30px;
    h3 {
        color: #949494;
    }
`;
const AboutCourse = styled.div`
    display: flex;
    justify-content: center;
    button {
        margin-top: 60px;
    }
`;

const Course = styled.div`
    border: 1px solid #dddddd;
    text-align: center;
    padding: 1em;
    border-radius: 5px;
    box-shadow: 1px 1px 10px #ccc;
    margin-bottom: 50px;
`;
const Top = styled.div`
    margin: 1em 0;
`;
const Image1 = styled.div`
    img {
        width: 120px;
        height: 120px;
    }
    button {
        margin-top: 70px;
    }
`;

const Image = styled.div`
    img {
        width: 160px;
        height: 160px;
    }
`;
const Center = styled.div`
    text-align: center;
`;
