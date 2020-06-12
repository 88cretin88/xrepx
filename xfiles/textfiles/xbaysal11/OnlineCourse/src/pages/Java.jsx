import React, { Component } from "react";
import styled from "styled-components";
import { PageHeader } from "../components";
import AboutJava from "../components/AboutCourse/AboutJava";

class Java extends Component {
    render() {
        return (
            <>
                <Bg>
                    <PageHeader background="linear-gradient(to right, #01256e, #f6eab8)">
                        <h2>
                            Java Programming and Software <br />
                            Engineering Fundamentals Specialization
                        </h2>
                        <p>
                            Explore a Career as a Software Engineer. Learn the
                            basics of programming and <br />
                            software development
                        </p>
                    </PageHeader>
                </Bg>
                <AboutJava />
            </>
        );
    }
}

export default Java;

const Bg = styled.div`
    h2,
    p {
        color: #fff;
        font-weight: lighter;
    }
`;
