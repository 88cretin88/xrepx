import React, { Component } from "react";
import { Row as RRow } from "antd";

import styled from "styled-components";
import { HeatMap, Charts } from "../index";

class ProfileInfo extends Component {
    render() {
        return (
            <Wrapper>
                <Row>
                    <HeatMap />
                </Row>
                <Row>
                    <Charts />
                </Row>
            </Wrapper>
        );
    }
}

export default ProfileInfo;
const Wrapper = styled.form`
    background: #fff;
    padding: 2em;
    border-radius: 4px;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.15);
    margin: 24px 12px 52px 12px;
    min-height: 50%;
`;
const Row = styled(RRow)`
    margin: 2em 0;
`;
