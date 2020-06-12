import React, { Component } from "react";
import styled from "styled-components";
import PT from "prop-types";

import {
    Form,
    Input as InputAntd,
    Button as ButtonAntd
    // Select
    // AutoComplete
} from "antd";

// const { Option } = Select;
// const AutoCompleteOption = AutoComplete.Option;

class RestorForm extends Component {
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
        // const prefixSelector = getFieldDecorator("prefix", {
        //     initialValue: "996"
        // })(
        //     <Select style={{ width: 80 }}>
        //         <Option value="996">+996</Option>
        //         <Option value="7">+7</Option>
        //     </Select>
        // );

        return (
            <Wrapper>
                <Title>Restore Password</Title>
                <Form {...formItemLayout} onSubmit={this.handleSubmit}>
                    <p>Please write your email. Which connected to account. </p>
                    <p>Then check email and pass through unique link</p>
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

                    <Form.Item {...tailFormItemLayout}>
                        <Button type="primary" htmlType="submit">
                            Send!
                        </Button>
                    </Form.Item>
                </Form>
            </Wrapper>
        );
    }
}

const WrappedRestorForm = Form.create({ name: "restore" })(RestorForm);

export default WrappedRestorForm;

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
