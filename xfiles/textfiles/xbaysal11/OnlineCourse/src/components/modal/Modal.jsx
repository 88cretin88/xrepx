import React, { Component } from "react";
import { Modal as AntModal } from "antd";
import PT from "prop-types";
import { ModalContext } from "./ModalManager";

class Modal extends Component {
    static propTypes = {
        name: PT.string.isRequired,
        addModal: PT.func,
        delModal: PT.func,
        openModal: PT.func,
        closeModal: PT.func,
        isOpen: PT.func,
        children: PT.any
    };

    componentDidMount() {
        this.props.addModal(this);
    }
    componentWillUnmount() {
        this.props.delModal(this);
    }
    render() {
        const { name, isOpen, closeModal, children, ...rest } = this.props;

        return (
            <AntModal
                {...rest}
                onCancel={() => {
                    closeModal(name);
                }}
                visible={isOpen(name)}
            >
                {children}
            </AntModal>
        );
    }
}
// eslint-disable-next-line react/display-name
export default React.forwardRef((props, ref) => (
    <ModalContext.Consumer>
        {value => <Modal {...{ ...props, ...value }} ref={ref} />}
    </ModalContext.Consumer>
));
