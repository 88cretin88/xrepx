import React, { Component } from "react";
import { Menu, Icon } from "antd";
import PT from "prop-types";

class SiderMenu extends Component {
    static propTypes = {
        collapsed: PT.bool.isRequired,
        toggle: PT.func.isRequired,
        children: PT.any
    };
    render() {
        const { collapsed, toggle, ...rest } = this.props;
        return (
            <Menu {...rest}>
                {this.props.children}
                <Menu.Item onClick={toggle}>
                    {collapsed ? (
                        <Icon type={"right"} />
                    ) : (
                        <Icon type={"left"} />
                    )}
                </Menu.Item>
            </Menu>
        );
    }
}
export default SiderMenu;
