import React, { Component } from "react";
import PT from "prop-types";
import styled from "styled-components";
import Container from "./elements/Container";
import { Col, Row } from "antd";

import logo from "../assets/img/logo.png";

class PageHeader extends Component {
    static propTypes = {
        background: PT.string.isRequired,
        user: PT.object.isRequired,
        children: PT.any
    };

    render() {
        return (
            <>
                <Bg background={this.props.background}>
                    <Container>
                        {this.props.user ? (
                            <About>{this.props.children}</About>
                        ) : (
                            <Row>
                                <Col span={15}>
                                    <About>{this.props.children}</About>
                                </Col>
                                <Col span={8} offset={1}>
                                    <Academy>
                                        <h4>Offered By</h4>
                                        <img src={logo} alt="" />
                                    </Academy>
                                </Col>
                            </Row>
                        )}
                    </Container>
                </Bg>
            </>
        );
    }
}

export default PageHeader;

const Bg = styled.div`
    background-image: ${props => props.background};
`;
const About = styled.div`
    padding: 10% 0;
`;
const Academy = styled.div`
    margin-top: 50px;
    h4 {
        color: #fff;
    }
`;
