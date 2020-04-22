import React, { Component } from "react";
import { Input, Row as RRow, Col, Button } from "antd";

import styled from "styled-components";
import ConfirmForm from "../forms/ConfirmForm";
class ProfileInfo extends Component {
    render() {
        return (
            <Wrapper>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">E-mail</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder=" " value="123@mail.com" />
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Password</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder="New Password" />
                    </Col>
                </Row>
                <Row>
                    <Col offset={4}>
                        <Input placeholder="Confirm Password " />
                    </Col>
                </Row>
                <Row>
                    <Col offset={4}>
                        <Input placeholder="Old Password " />
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">GitHub</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder="URL" />
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Email</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder="Email" />
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Facebook</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder="URL" />
                    </Col>
                </Row>
                <Row>
                    <Col span={20}>
                        <label htmlFor="">Delete Account</label>
                    </Col>
                    <Col span={4}>
                        <ConfirmForm buttonName="Delete!" />
                    </Col>
                </Row>
                <Row>
                    <Col offset={20}>
                        <Button type="submit">Change!</Button>
                    </Col>
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
    margin: 1em 0;
`;
