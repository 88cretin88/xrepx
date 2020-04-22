import React, { Component } from "react";
import {  Row as RRow, Col, Button, Switch, Checkbox } from "antd";

import styled from "styled-components";

function onChange(checked) {
    console.log(`switch to ${checked}`);
    console.log(`checked = ${checked.target.checked}`);
}
class NotificationsSettigs extends Component {
    render() {
        return (
            <Wrapper>
                <Switch defaultChecked onChange={onChange} />
                <Row>
                    <Col span={4}>
                        <label htmlFor="">E-mail</label>
                    </Col>
                    <Col span={20}>
                        <Checkbox onChange={onChange}>Checkbox</Checkbox>
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Password</label>
                    </Col>
                    <Col span={20}>
                        <Checkbox onChange={onChange}>Checkbox</Checkbox>
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Password</label>
                    </Col>
                    <Col span={20}>
                        <Checkbox onChange={onChange}>Checkbox</Checkbox>
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

export default NotificationsSettigs;
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
