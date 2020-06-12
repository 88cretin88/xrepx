import React, { Component } from "react";
import { Formik } from "formik";
import PT from "prop-types";

import styled from "styled-components";

import OpenModal from "../modal/OpenModal";

import {
    Form,
    Icon,
    Input as InputAntd,
    Button as ButtonAntd,
    Checkbox
} from "antd";

class LoginForm extends Component {
    static propTypes = {
        form: PT.object
    };
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFields((err, values) => {
            if (!err) {
                console.log("Received values of form: ", values);
            }
        });
    };
    render() {
        const { getFieldDecorator } = this.props.form;

        return (
            <Formik>
                <Wrapper>
                    <Title>Log In</Title>
                    <Form onSubmit={this.handleSubmit}>
                        <Form.Item>
                            {getFieldDecorator("userName", {
                                rules: [
                                    {
                                        required: true,
                                        message: "Please input your username!"
                                    }
                                ]
                            })(
                                <Input
                                    prefix={
                                        <Icon
                                            type="user"
                                            style={{ color: "rgba(0,0,0,.25)" }}
                                        />
                                    }
                                    placeholder="Username"
                                />
                            )}
                        </Form.Item>
                        <Form.Item>
                            {getFieldDecorator("password", {
                                rules: [
                                    {
                                        required: true,
                                        message: "Please input your Password!"
                                    }
                                ]
                            })(
                                <Input
                                    prefix={
                                        <Icon
                                            type="lock"
                                            style={{ color: "rgba(0,0,0,.25)" }}
                                        />
                                    }
                                    type="password"
                                    placeholder="Password"
                                />
                            )}
                        </Form.Item>
                        <Form.Item>
                            {getFieldDecorator("remember", {
                                valuePropName: "checked",
                                initialValue: true
                            })(<Checkbox>Remember me</Checkbox>)}
                            <OpenModal name={"restore"}>
                                <Button type="primary">Forgot password</Button>
                            </OpenModal>
                            <Button type="primary" htmlType="submit">
                                Log in
                            </Button>
                            Or <a href="/">register now!</a>
                        </Form.Item>
                    </Form>
                </Wrapper>
            </Formik>
        );
    }
}
const WrappedLoginForm = Form.create({ name: "login" })(LoginForm);

export default WrappedLoginForm;

const Button = styled(ButtonAntd)`
    width: 100%;
`;

const Wrapper = styled.div`
    text-align: center;
`;

const Input = styled(InputAntd)`
    max-width: 300px;
    padding: 0 auto;
`;
const Title = styled.h2`
    color: #494949;
`;
