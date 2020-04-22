import React, { Component } from "react";
import { Input, Select, Row as RRow, Col, Button } from "antd";

import styled from "styled-components";
import UploadAvatar from "./UploadAvatar";

const Option = Select.Option;

function handleChange(value) {
    console.log(`selected ${value}`);
}

class ProfileSettings extends Component {
    render() {
        return (
            <Form action="#" method="post">
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Name</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder=" " />
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">E-mail</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder=" " />
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Обо мне</label>
                    </Col>
                    <Col span={20}>
                        <Input placeholder=" " />
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Язык</label>
                    </Col>
                    <Col span={20}>
                        <Select
                            defaultValue="rus"
                            style={{ width: 120 }}
                            onChange={handleChange}
                        >
                            <Option value="rus">Russian</Option>
                            <Option value="eng">English</Option>
                        </Select>
                    </Col>
                </Row>
                <Row>
                    <Col span={4}>
                        <label htmlFor="">Avatar</label>
                    </Col>
                    <Col span={20}>
                        <UploadAvatar />
                    </Col>
                </Row>
                <Row>
                    <Col offset={20}>
                        <Button type="submit">Change!</Button>
                    </Col>
                </Row>
            </Form>
        );
    }
}
export default ProfileSettings;

const Form = styled.form`
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
