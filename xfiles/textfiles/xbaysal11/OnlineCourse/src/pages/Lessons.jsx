import React, { Component } from "react";
import { Layout, Menu, Icon } from "antd";
import LessonSideBar from "../components/Lesson/LessonSideBar";
import { Container, LessonContent, LessonCode } from "../components/index";
import { Redirect, NavLink } from "react-router-dom";
import styled from "styled-components";
import PT from "prop-types";


const { Content } = Layout;


class Lessons extends Component {
    static propTypes = {
        match: PT.object
    };
    state = {
        collapsed: false,
        current: "home1"
    };
    handleClick = e => {
        console.log("click ", e);
        this.setState({
            current: e.key
        });
    };
    onCollapse = collapsed => {
        console.log(collapsed);
        this.setState({ collapsed });
    };
    onToggle = () => {
        this.setState({ collapsed: !this.state.collapsed });
    };
    render() {
        const {
            match: {
                params: { tab, lesson_id },
                url: match_url
            }
        } = this.props;
        return (
            <Container>
                <Layout>
                    <LessonSideBar />

                    <Content>
                        <Wrapper>
                            <Menu
                                onClick={this.handleClick}
                                selectedKeys={[this.state.current]}
                                mode="horizontal"
                            >
                                <Menu.Item key="home1">
                                    <NavLink to={`/lessons/${lesson_id}/home1`}>
                                        <Icon type="file-text" />
                                        Introduction
                                    </NavLink>
                                </Menu.Item>
                                <Menu.Item key="home2">
                                    <NavLink to={`/lessons/${lesson_id}/home2`}>
                                        <Icon type="file-text" />
                                        Variables
                                    </NavLink>
                                </Menu.Item>
                                <Menu.Item key="code1">
                                    <NavLink to={`/lessons/${lesson_id}/code1`}>
                                        <Icon type="code" />
                                        Practice Variables
                                    </NavLink>
                                </Menu.Item>
                                <Menu.Item key="code2">
                                    <NavLink to={`/lessons/${lesson_id}/code2`}>
                                        <Icon type="code" />
                                        Practice Variables 2
                                    </NavLink>
                                </Menu.Item>
                            </Menu>
                        </Wrapper>
                        {tab === "home1" ? (
                            <LessonContent />
                        ) : tab === "home2" ? (
                            <LessonContent />
                        ) : tab === "code1" ? (
                            <LessonCode />
                        ) : tab === "code2" ? (
                            <LessonCode />
                        ) : (
                            <Redirect to={match_url + "/home1"} />
                        )}
                    </Content>
                </Layout>
            </Container>
        );
    }
}
export default Lessons;

const Wrapper = styled.div`
    text-align: center;
`;
