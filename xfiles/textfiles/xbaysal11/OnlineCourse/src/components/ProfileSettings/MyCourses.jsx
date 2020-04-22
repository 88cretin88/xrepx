import React, { Component } from "react";
import styled from "styled-components";
import { Row, Col, Progress } from "antd";
import Card from "../CourseCard";
import { shadows } from "../../config";
import Python from "../../assets/img/python.jpg";
import Java from "../../assets/img/java.jpg";
import Js from "../../assets/img/Js.jpg";

import LessonAutor from "../Lesson/LessonAutor";
class MyCourses extends Component {
    render() {
        return (
            <Wrapper>
                <Courses>
                    <MyCourse>
                        <Row>
                            <Col span={10}>
                                <img src={Java} />
                            </Col>

                            <Col span={14}>
                                <Author>
                                    <LessonAutor />
                                    <p>Keep making progress on Learn Java</p>
                                    <Progress
                                        percent={23}
                                        size="small"
                                        status="active"
                                    />
                                </Author>
                            </Col>
                        </Row>
                    </MyCourse>
                </Courses>
                <Courses>
                    <MyCourse>
                        <Row>
                            <Col span={10}>
                                <img src={Js} />
                            </Col>

                            <Col span={14}>
                                <Author>
                                    <LessonAutor />
                                    <p>Keep making progress on Learn Java</p>
                                    <Progress
                                        percent={23}
                                        size="small"
                                        status="active"
                                    />
                                    {/* <Button> RESUME 58%</Button> */}
                                </Author>
                            </Col>
                        </Row>
                    </MyCourse>
                </Courses>

                <Intro>
                    <h3>Active Courses You Can Take</h3>
                    <p>This courses are avaliable now.</p>
                </Intro>

                <Row type="flex" justify="space-between">
                    <Col span={12}>
                        <Right>
                            <Card img={Python} />
                        </Right>
                    </Col>
                    <Col span={12}>
                        <Left>
                            <Card img={Js} />
                        </Left>
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
const Left = styled.div`
    margin-left: 1em;
`;
const Right = styled.div`
    margin-right: 1em;
`;

const Courses = styled.div`
    margin-bottom: 30px;
`;
const MyCourse = styled.div`
    padding: 2em;
    box-shadow: rgba(46, 41, 51, 0.08) 0px 1px 2px,
        rgba(71, 63, 79, 0.08) 0px 2px 4px;
    transition: ${shadows.transition};
    &:hover {
        ${shadows.hover};
        cursor: pointer;
    }

    button {
        font-size: 20px;
        background-color: #ffc107;
        font-weight: 300;
    }
    h5 {
        margin-top: 20px;
    }
    h4 {
        color: #949494;
    }
    img {
        height: 100%;
        width: 100%;
    }
`;

const Intro = styled.div`
    margin-top: 30px;
    h3 {
        color: #949494;
    }
`;

const Author = styled.div`
    margin-left: 2em;
`;
