import React, { Component, createContext } from "react";
import PT from "prop-types";
import omit from "lodash/omit";

const ModalContext = createContext();

class ModalManager extends Component {
    constructor() {
        super();
        this.state = {
            modals: {},
            open: []
        };
        this.addModal = this.addModal.bind(this);
        this.delModal = this.delModal.bind(this);
        this.openModal = this.openModal.bind(this);
        this.closeModal = this.closeModal.bind(this);
        this.isOpen = this.isOpen.bind(this);
    }
    addModal(modal) {
        this.setState({
            modals: { ...this.state.modal, [modal.props.name]: modal }
        });
    }
    delModal(modal) {
        this.setState({ modals: omit(this.state.modals, [modal.props.name]) });
    }
    openModal(name, close_other = true) {
        this.setState({
            open: [...(close_other ? [] : this.state.open), name]
        });
    }
    closeModal(name) {
        this.setState({
            open: !name ? [] : this.state.open.filter(v => v !== name)
        });
    }
    isOpen(name) {
        return this.state.open.includes(name);
    }
    static propTypes = {
        children: PT.any.isRequired
    };
    render() {
        return (
            <ModalContext.Provider
                value={{
                    addModal: this.addModal,
                    delModal: this.delModal,
                    openModal: this.openModal,
                    closeModal: this.closeModal,
                    isOpen: this.isOpen
                }}
            >
                {this.props.children}
            </ModalContext.Provider>
        );
    }
}

export default ModalManager;
export { ModalContext };
