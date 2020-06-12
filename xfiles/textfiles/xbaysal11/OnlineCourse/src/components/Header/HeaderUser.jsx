import React, { Component } from "react";
import {  Button } from "antd";
// import PT from "prop-types";
// import styled from "styled-components";
import OpenModal from "../modal/OpenModal";

// const menu = (
//     <Menu style={{ width: "200px" }}>
//         <Menu.Item key="3">Profile</Menu.Item>
//         <Menu.Item key="3">Settings</Menu.Item>
//         <Menu.Item key="3">Help Center</Menu.Item>
//         <Menu.Divider />
//         <Menu.Item key="3">Log Out</Menu.Item>
//     </Menu>
// );

class HeaderUser extends Component {
    // static propTypes = {
    //     user: PT.object
    // };
    render() {
        return (
            <div>
                <>
                    <Button.Group>
                        <OpenModal name={"login"}>
                            <Button type="primary">Log in</Button>
                        </OpenModal>
                        <OpenModal name={"register"}>
                            <Button type="primary">Register</Button>
                        </OpenModal>
                        
                    </Button.Group>

                    {/* <Badge count={3}>
                        <Avatar shape="square" icon="user" />
                    </Badge>
                    <Dropdown overlay={menu} trigger={["click"]}>
                        <UserName>
                            Ragnar Lod Brock <Icon type="down" />
                        </UserName>
                    </Dropdown> */}
                </>
            </div>
        );
    }
}
export default HeaderUser;

// const UserName = styled.span`
//     color: #fff;
//     margin-left: 0.5em;
//     cursor: pointer;
// `;
