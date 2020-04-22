import React, { Component } from "react";
import styled from "styled-components";
import { Row, Col } from "antd";
import { Container, PageHeader } from "../components/index";
import { NavLink } from "react-router-dom";
import Card from "../components/CourseCard";
import Python from "../assets/img/python.jpg";
import Js from "../assets/img/Js.jpg";
import Java from "../assets/img/java.jpg";

class Courses extends Component {
    render() {
        return (
            <Main>
                <PageHeader background="linear-gradient(to right, #56c9ff, #0063ba)">
                    <h2>
                        Improve Your English
                        <br /> Communication Skills Specialization
                    </h2>
                </PageHeader>
                <Container>
                    <Title>Our Courses </Title>

                    <Row type="flex" justify="space-around">
                        <Col span={7}>
                            <NavLink to="/java">
                                <Card img={Python} />
                            </NavLink>
                        </Col>

                        <Col span={7}>
                            <NavLink to="/java">
                                <Card img={Java} />
                            </NavLink>
                        </Col>

                        <Col span={7}>
                            <NavLink to="/java">
                                <Card img={Js} />
                            </NavLink>
                        </Col>
                    </Row>
                </Container>
            </Main>
        );
    }
}

export default Courses;

const Main = styled.div`
    margin-bottom: 50px;
    h2 {
        color: #fff;
        font-weight: lighter;
    }
`;

const Title = styled.h3`
    margin: 50px 0;
    text-align: center;
    font-weight: 600;
`;
