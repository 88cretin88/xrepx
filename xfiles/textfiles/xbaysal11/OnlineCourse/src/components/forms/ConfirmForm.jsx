import React, { Component } from "react";
import { Modal, Button } from "antd";
import PT from "prop-types";

const confirm = Modal.confirm;

function showDeleteConfirm() {
    confirm({
        title: "Are you sure delete this task?",
        content: "Some descriptions",
        okText: "Yes",
        okType: "danger",
        cancelText: "No",
        onOk() {
            console.log("OK");
        },
        onCancel() {
            console.log("Cancel");
        }
    });
}

export default class ConfirmForm extends Component {
    static propTypes = {
        buttonName: PT.string.isRequired
    };
    render() {
        return (
            <Button onClick={showDeleteConfirm} type="danger">
                {this.props.buttonName}
            </Button>
        );
    }
}
