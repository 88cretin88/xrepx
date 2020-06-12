import React, { Component } from "react";
import Modal from "../modal/Modal";
import RestoreForm from "./RestoreForm";

class RestoreModal extends Component {
    render() {
        return (
            <Modal {...this.props} name="restore">
                <RestoreForm />
            </Modal>
        );
    }
}
export default RestoreModal;