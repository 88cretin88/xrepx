import React, { Component } from "react";
import styled from "styled-components";

import { Menu, Icon, Layout } from "antd";
import { colors } from "../../config";
import SiderMenu from "../SiderMenu";
import { NavLink } from "react-router-dom";

const SubMenu = Menu.SubMenu;

class SettingsSidebar extends Component {
    handleClick = e => {
        console.log("click ", e);
    };
    state = {
        collapsed: false
    };

    onCollapse = collapsed => {
        console.log(collapsed);
        this.setState({ collapsed });
    };
    onToggle = () => {
        this.setState({ collapsed: !this.state.collapsed });
    };

    render() {
        return (
            <Wrapper>
                <Layout.Sider
                    collapsible
                    collapsed={this.state.collapsed}
                    theme="light"
                    trigger={null}
                >
                    <SiderMenu
                        onClick={this.handleClick}
                        defaultSelectedKeys={["profile_info"]}
                        defaultOpenKeys={["sub1"]}
                        mode="inline"
                        toggle={this.onToggle}
                        collapsed={this.state.collapsed}
                    >
                        <Menu.Item key="profile_info">
                            <NavLink to="/profile/profile_info">
                                <Icon type="user" />
                                <span>Profile</span>
                            </NavLink>
                        </Menu.Item>
                        <Menu.Item key="my_courses">
                            <NavLink to="/profile/my_courses">
                                <Icon type="project" />
                                <span>My Courses</span>
                            </NavLink>
                        </Menu.Item>
                        <Menu.Item key="grades">
                            <NavLink to="/profile/grades">
                                <Icon type="calculator" />
                                <span>Grades</span>
                            </NavLink>
                        </Menu.Item>

                        <SubMenu
                            key="sub1"
                            title={
                                <span>
                                    <Icon type="setting" />
                                    <span>Settings</span>
                                </span>
                            }
                        >
                            <Menu.Item key="profile_settings">
                                <NavLink to="/profile/profile_settings">
                                    <Icon type="solution" />
                                    Profile
                                </NavLink>
                            </Menu.Item>
                            <Menu.Item key="linked_accounts">
                                <NavLink to="/profile/linked_accounts">
                                    <Icon type="link" />
                                    Linked Accounts
                                </NavLink>
                            </Menu.Item>
                            <Menu.Item key="account_settings">
                                <NavLink to="/profile/account_settings">
                                    <Icon type="tool" />
                                    Accounts
                                </NavLink>
                            </Menu.Item>
                            <Menu.Item key="notifications_settings">
                                <NavLink to="/profile/notifications_settings">
                                    <Icon type="bell" />
                                    Notifications
                                </NavLink>
                            </Menu.Item>
                        </SubMenu>
                        <Menu.Item
                            key="logout"
                            style={{
                                color: "red",
                                background: colors.red_light
                            }}
                        >
                            <Icon type="logout" />
                            <span>Log Out</span>
                        </Menu.Item>
                    </SiderMenu>
                </Layout.Sider>
            </Wrapper>
        );
    }
}
export default SettingsSidebar;

const Wrapper = styled.div`
    margin-top: 24px;
`;
