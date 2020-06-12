import React, { Component } from "react";
import styled from "styled-components";
import {
    Upload,
    message,
    Button,
    Avatar,
    Row as RRow,
    Col,
    Icon,
    Rate,
    Layout
} from "antd";
import faker from "faker";
import {
    PageHeader,
    Container,
    SettingsSidebar,
    ProfileSettings,
    AccountSettings,
    NotificationsSettigs,
    MyCourses,
    ProfileGrades,
    ProfileInfo,
    LinkedAccounts
} from "../components/index";
import UserStatus from "../components/ProfileSettings/UserStatus";

import { Route } from "react-router-dom";

const props = {
    name: "file",
    action: "//jsonplaceholder.typicode.com/posts/",
    headers: {
        authorization: "authorization-text"
    },
    onChange(info) {
        if (info.file.status !== "uploading") {
            console.log(info.file, info.fileList);
        }
        if (info.file.status === "done") {
            message.success(`${info.file.name} file uploaded successfully`);
        } else if (info.file.status === "error") {
            message.error(`${info.file.name} file upload failed.`);
        }
    }
};

class Profile extends Component {
    state = {
        visible: false,
        status: "Student",
        ImgSrc:
            "https://www.wwhf.org/wp-content/uploads/2014/04/bokeh-cover-bg.jpg"
    };

    hide = () => {
        this.setState({
            visible: false
        });
    };

    handleVisibleChange = visible => {
        this.setState({ visible });
    };

    render() {
        const divImage = "url(" + this.state.ImgSrc + ");";

        return (
            <div>
                <Wrapper>
                    <div className="upload">
                        <Upload {...props}>
                            <Button
                                style={{
                                    background: "none",
                                    border: "none",
                                    padding: 0,
                                    margin: 0
                                }}
                            >
                                <Icon
                                    type="camera"
                                    style={{
                                        fontSize: "2em",
                                        color: "#ddd"
                                    }}
                                />
                            </Button>
                        </Upload>
                    </div>
                    <PageHeader user background={divImage}>
                        <Row>
                            <Col span={6}>
                                <Avatar
                                    shape="square"
                                    size={190}
                                    icon="user"
                                    src="https://randomuser.me/api/portraits/men/71.jpg"
                                />
                            </Col>
                            <Col span={18}>
                                <Info>
                                    <Row>
                                        <Col span={13}>
                                            <Name>
                                                {faker.name.firstName()}{" "}
                                                {faker.name.lastName()}
                                            </Name>
                                        </Col>

                                        <Col span={10}>
                                            <Rate
                                                disabled
                                                allowHalf
                                                defaultValue={4}
                                                style={{
                                                    margin: ".6em 0",
                                                    color: "#40A9FF"
                                                }}
                                            />
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col span={12}>
                                            <UserStatus
                                                userStatus={this.state.status}
                                            />
                                        </Col>
                                        <Col span={12}>
                                            <p>
                                                <Icon
                                                    type="phone"
                                                    style={{
                                                        fontSize: "22px",
                                                        color: "#40A9FF"
                                                    }}
                                                />
                                                +9967000000000
                                            </p>
                                        </Col>
                                    </Row>

                                    <Row>
                                        <Col span={12}>
                                            <p>
                                                <strong>Group : </strong>
                                                Front-End 19
                                            </p>
                                        </Col>
                                        <Col span={12}>
                                            <p>
                                                <strong>Birth day : </strong>
                                                444 - 3232 - 1999999
                                            </p>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col span={24}>
                                            <p>
                                                Lorem, ipsum dolor sit amet
                                                consectetur adipisicing elit.
                                                Autem fugiat neque, sit maiores
                                                recusandae nam voluptatibus
                                                aspernatur, incidunt sapiente
                                                eveniet in illum debitis
                                                obcaecati non consectetur
                                                asperiores quasi officia! Animi!
                                            </p>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col span={24}>
                                            <Icon
                                                type="github"
                                                style={{
                                                    fontSize: "22px",
                                                    margin: "0 .2em",
                                                    color: "#40A9FF"
                                                }}
                                            />
                                            <Icon
                                                type="google"
                                                style={{
                                                    fontSize: "22px",
                                                    margin: "0 .2em",
                                                    color: "#40A9FF"
                                                }}
                                            />
                                            <Icon
                                                type="gitlab"
                                                style={{
                                                    fontSize: "22px",
                                                    margin: "0 .2em",
                                                    color: "#40A9FF"
                                                }}
                                            />
                                            <Icon
                                                type="facebook"
                                                style={{
                                                    fontSize: "22px",
                                                    margin: "0 .2em",
                                                    color: "#40A9FF"
                                                }}
                                            />
                                        </Col>
                                    </Row>
                                </Info>
                            </Col>
                        </Row>
                    </PageHeader>
                    <Container>
                        <Layout>
                            <SettingsSidebar />

                            <Content>
                                <Route
                                    path="/profile/profile_info"
                                    component={ProfileInfo}
                                />
                                <Route
                                    path="/profile/my_courses"
                                    component={MyCourses}
                                />
                                <Route
                                    path="/profile/grades"
                                    component={ProfileGrades}
                                />
                                <Route
                                    path="/profile/profile_settings"
                                    component={ProfileSettings}
                                />
                                <Route
                                    path="/profile/account_settings"
                                    component={AccountSettings}
                                />
                                <Route
                                    path="/profile/notifications_settings"
                                    component={NotificationsSettigs}
                                />
                                <Route
                                    path="/profile/linked_accounts"
                                    component={LinkedAccounts}
                                />
                            </Content>
                        </Layout>
                    </Container>
                </Wrapper>
            </div>
        );
    }
}
export default Profile;
const Wrapper = styled.div`
    & .upload {
        position: absolute;
        right: 3%;
        top: 15%;
        display: grid;
        justify-content: end;
        align-content: start;
    }
`;
const Content = styled.div`
    width: 100%;
`;

const Info = styled.div`
    color: #fff;
`;
const Name = styled.div`
    color: #fff;
    font-size: 36px;
    font-weight: 600;
`;

const Row = styled(RRow)`
    align-content: center;
`;
