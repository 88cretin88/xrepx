import React, { Component } from "react";
import styled from "styled-components";
import PT from "prop-types";

import {
    Form,
    Icon,
    Input as InputAntd,
    Button as ButtonAntd,
    Checkbox,
    Tooltip,
    Select
    // AutoComplete
} from "antd";

const { Option } = Select;
// const AutoCompleteOption = AutoComplete.Option;

class RegisterForm extends Component {
    state = {
        confirmDirty: false,
        autoCompleteResult: []
    };
    static propTypes = {
        form: PT.object
    };

    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFieldsAndScroll((err, values) => {
            if (!err) {
                console.log("Received values of form: ", values);
            }
        });
    };

    handleConfirmBlur = e => {
        const value = e.target.value;
        this.setState({ confirmDirty: this.state.confirmDirty || !!value });
    };

    compareToFirstPassword = (rule, value, callback) => {
        const form = this.props.form;
        if (value && value !== form.getFieldValue("password")) {
            callback("Two passwords that you enter is inconsistent!");
        } else {
            callback();
        }
    };

    validateToNextPassword = (rule, value, callback) => {
        const form = this.props.form;
        if (value && this.state.confirmDirty) {
            form.validateFields(["confirm"], { force: true });
        }
        callback();
    };

    handleWebsiteChange = value => {
        let autoCompleteResult;
        if (!value) {
            autoCompleteResult = [];
        } else {
            autoCompleteResult = [".com", ".org", ".net"].map(
                domain => `${value}${domain}`
            );
        }
        this.setState({ autoCompleteResult });
    };

    render() {
        const { getFieldDecorator } = this.props.form;
        // const { autoCompleteResult } = this.state;

        const formItemLayout = {
            labelCol: {
                xs: { span: 24 },
                sm: { span: 8 }
            },
            wrapperCol: {
                xs: { span: 24 },
                sm: { span: 16 }
            }
        };
        const tailFormItemLayout = {
            wrapperCol: {
                xs: {
                    span: 24,
                    offset: 0
                },
                sm: {
                    span: 16,
                    offset: 8
                }
            }
        };
        const prefixSelector = getFieldDecorator("prefix", {
            initialValue: "996"
        })(
            <Select style={{ width: 80 }}>
                <Option value="996">+996</Option>
                <Option value="7">+7</Option>
            </Select>
        );

        return (
            <Wrapper>
                <Title>Registration</Title>
                <Form {...formItemLayout} onSubmit={this.handleSubmit}>
                    <Form.Item
                        label={
                            <span>
                                Name Surname&nbsp;
                                <Tooltip title="What do you want others to call you?">
                                    <Icon type="question-circle-o" />
                                </Tooltip>
                            </span>
                        }
                    >
                        {getFieldDecorator("nickname", {
                            rules: [
                                {
                                    required: true,
                                    message: "Please input your nickname!",
                                    whitespace: true
                                }
                            ]
                        })(<Input />)}
                    </Form.Item>
                    <Form.Item label="E-mail">
                        {getFieldDecorator("email", {
                            rules: [
                                {
                                    type: "email",
                                    message: "The input is not valid E-mail!"
                                },
                                {
                                    required: true,
                                    message: "Please input your E-mail!"
                                }
                            ]
                        })(<Input />)}
                    </Form.Item>
                    <Form.Item label="Password">
                        {getFieldDecorator("password", {
                            rules: [
                                {
                                    required: true,
                                    message: "Please input your password!"
                                },
                                {
                                    validator: this.validateToNextPassword
                                }
                            ]
                        })(<Input type="password" />)}
                    </Form.Item>
                    <Form.Item label="Confirm Password">
                        {getFieldDecorator("confirm", {
                            rules: [
                                {
                                    required: true,
                                    message: "Please confirm your password!"
                                },
                                {
                                    validator: this.compareToFirstPassword
                                }
                            ]
                        })(
                            <Input
                                type="password"
                                onBlur={this.handleConfirmBlur}
                            />
                        )}
                    </Form.Item>

                    <Form.Item label="Phone Number">
                        {getFieldDecorator("phone", {
                            rules: [
                                {
                                    required: true,
                                    message: "Please input your phone number!"
                                }
                            ]
                        })(
                            <Input
                                addonBefore={prefixSelector}
                                style={{ width: "100%" }}
                            />
                        )}
                    </Form.Item>

                    <Form.Item {...tailFormItemLayout}>
                        {getFieldDecorator("agreement", {
                            valuePropName: "checked"
                        })(
                            <Checkbox>
                                I have read the <a href="/">agreement</a>
                            </Checkbox>
                        )}
                    </Form.Item>
                    <Form.Item {...tailFormItemLayout}>
                        <Button type="primary" htmlType="submit">
                            Register
                        </Button>
                    </Form.Item>
                </Form>
            </Wrapper>
        );
    }
}

const WrappedRegisterForm = Form.create({ name: "register" })(RegisterForm);

export default WrappedRegisterForm;

const Button = styled(ButtonAntd)`
    width: 50%;
`;

const Input = styled(InputAntd)`
    max-width: 300px;
`;

const Wrapper = styled.div``;

const Title = styled.h2`
    color: #494949;
    text-align: center;
`;
