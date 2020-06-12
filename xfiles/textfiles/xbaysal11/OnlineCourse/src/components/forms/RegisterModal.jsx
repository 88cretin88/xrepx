import React, { Component } from "react";
import Modal from "../modal/Modal";
import RegisterForm from "./RegisterForm";

class RegisterModal extends Component {
    render() {
        return (
            <Modal {...this.props} name="register" width={700}>
                <RegisterForm />
            </Modal>
        );
    }
}
export default RegisterModal;
