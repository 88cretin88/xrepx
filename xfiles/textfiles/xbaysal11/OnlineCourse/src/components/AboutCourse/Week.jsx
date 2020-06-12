import React, { Component } from "react";
import Container from "../elements/Container";
import WeekCounter from "./WeekCounter";
import styled from "styled-components";
import { Col, Row } from "antd";
import Hours from "./Hours";
import WeekHead from "./WeekHead";
import HoursContent from "./HoursContent";

class Week extends Component {
    render() {
        return (
            <>
                <Container>
                    <MyRow type="flex" align="middle">
                        <Col span={20} push={4}>
                            <Hours>4 hours to complete</Hours>
                            <WeekHead>
                                <h3>
                                    Communicate in Person: The Power of Face to
                                    Face Connections
                                </h3>
                                <p>
                                    Through the lessons this module, you will be
                                    able to work on professional conversational
                                    vocabulary and proper word stress and
                                    intonation. After the final lesson you will
                                    be able to present a short Elevator Speech.
                                </p>
                            </WeekHead>
                            <HoursContent>
                                4 videos (Total 18 min), 8 readings, 4 quizzes
                            </HoursContent>
                        </Col>
                        <Col span={4} pull={20}>
                            <WeekCounter>1</WeekCounter>
                        </Col>
                    </MyRow>

                    <MyRow type="flex" align="middle">
                        <Col span={20} push={4}>
                            <Hours>5 hours to complete</Hours>
                            <WeekHead>
                                <h3>Meet and Talk Online</h3>
                                <p>
                                    This module looks at group discussion
                                    situations with the focus on video
                                    conferencing. By looking at various
                                    scenarios, you will learn key language for
                                    group discussion as well as gain some
                                    business etiquette.
                                </p>
                            </WeekHead>
                            <HoursContent>
                                4 videos (Total 18 min), 8 readings, 4 quizzes
                            </HoursContent>
                        </Col>
                        <Col span={4} pull={20}>
                            <WeekCounter>2</WeekCounter>
                        </Col>
                    </MyRow>
                    <MyRow type="flex" align="middle">
                        <Col span={20} push={4}>
                            <Hours>9 hours to complete</Hours>
                            <WeekHead>
                                <h3>Powerful Phone Talk</h3>
                                <p>
                                    In this module, you will improve language
                                    use and pronunciation for phone
                                    conversations. Trickier pronunciation
                                    distinctions in can/can't and numbers will
                                    be the focus for pronunciation.
                                </p>
                            </WeekHead>
                            <HoursContent>
                                4 videos (Total 18 min), 8 readings, 4 quizzes
                            </HoursContent>
                        </Col>
                        <Col span={4} pull={20}>
                            <WeekCounter>3</WeekCounter>
                        </Col>
                    </MyRow>
                </Container>
            </>
        );
    }
}

export default Week;

const MyRow = styled(Row)`
    margin-top: 100px;
    &:last-child {
        padding-bottom: 100px;
    }
`;
