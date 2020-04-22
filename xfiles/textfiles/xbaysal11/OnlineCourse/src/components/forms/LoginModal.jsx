import React, { Component } from "react";
import Modal from "../modal/Modal";
import LoginForm from "./LoginForm";

class LoginModal extends Component {
    render() {
        return (
            <Modal {...this.props} name="login">
                <LoginForm />
            </Modal>
        );
    }
}
export default LoginModal;
