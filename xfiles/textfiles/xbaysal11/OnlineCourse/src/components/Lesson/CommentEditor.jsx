import React, { Component } from "react";
import PT from "prop-types";
import styled from "styled-components";
import CommentHeader from "./CommentHeader";
import { Button } from "antd";

export default class CommentAnswer extends Component {
    static propTypes = {
        cancelOnclick: PT.func,
        first_name: PT.string,
        last_name: PT.string,
        answer: PT.object
    };

    render() {
        const { cancelOnclick, first_name, last_name } = this.props;
        return (
            <SCommentAnswer>
                <STop>
                    <CommentHeader
                        first_name={first_name}
                        last_name={last_name}
                    />
                    <MyInput placeholder="Text here" />
                    <br />
                    <Button type="primary">Answer</Button>
                    <Button onClick={cancelOnclick} type="default">
                        Cancle
                    </Button>
                </STop>
            </SCommentAnswer>
        );
    }
}

const SCommentAnswer = styled.div`
    border: 2px solid #f1f1f2;
    border-left: solid 5px #e0e0e0;
    padding: 1em;
`;
const STop = styled.div`
    margin-bottom: 1em;
`;
const MyInput = styled.input`
    margin-top: 5px;
    margin-bottom: 10px;
    width: 100%;
    font-size: 15px;
`;
