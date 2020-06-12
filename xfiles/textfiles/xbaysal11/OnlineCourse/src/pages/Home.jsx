import React, { Component } from "react";
import { PageHeader } from "../components/index";
import styled from "styled-components";
import { List, Avatar, Icon, Calendar, Statistic } from "antd";
import PT from "prop-types";

const listData = [];
for (let i = 0; i < 23; i++) {
    listData.push({
        href: "http://it-academy.kg",
        title: "IT Academy ",
        avatar:
            "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic1.squarespace.com%2Fstatic%2F55d1e076e4b0be96a30dc726%2Ft%2F56d9848bb654f9ac7f54901b%2F1464339883537%2Fcomputerworld_courses_icon&f=1",
        description: "Lets study!",
        content:
            "We supply a series of design principles, to help people create their product prototypes beautifully and efficiently."
    });
}

const Countdown = Statistic.Countdown;
const deadline = Date.now() + 1000 * 60 * 60 * 24 * 2 + 1000 * 30; // Moment is also OK

function onFinish() {
    console.log("finished!");
}

const IconText = ({ type, text }) => (
    <span>
        <Icon type={type} style={{ marginRight: 8 }} />
        {text}
    </span>
);

IconText.propTypes = { type: PT.any, text: PT.any };
function onPanelChange(value, mode) {
    console.log(value, mode);
}
class Home extends Component {
    render() {
        return (
            <Wrapper>
                <PageHeader background="linear-gradient(#990033, #802249)">
                    <H2>Наши курсы - самый короткий путь в IT</H2>
                    <p>
                        Освойте одну из самых востребованных и
                        высокооплачиваемых профессий всего за 9 месяцев по
                        сертифицированной программе IT академии ПВТ Беларуси
                    </p>
                </PageHeader>
                {/* <Container> */}
                <Flex>
                    <Aside>
                        <DeadLine>
                            <Countdown
                                title="Countdown"
                                value={deadline}
                                onFinish={onFinish}
                            />
                            <Countdown
                                title="Million Seconds"
                                value={deadline}
                                format="HH:mm:ss:SSS"
                            />
                            <Countdown
                                title="Day Level"
                                value={deadline}
                                format="D : HH : mm : ss "
                            />
                        </DeadLine>
                    </Aside>
                    <Content>
                        <List
                            itemLayout="vertical"
                            size="large"
                            pagination={{
                                onChange: page => {
                                    console.log(page);
                                },
                                pageSize: 3
                            }}
                            dataSource={listData}
                            // footer={
                            //     <div>
                            //         <b>ant design</b> footer part
                            //     </div>
                            // }
                            renderItem={item => (
                                <List.Item
                                    key={item.title}
                                    actions={[
                                        <IconText
                                            key={item.id}
                                            type="star-o"
                                            text="156"
                                        />,
                                        <IconText
                                            key={item.id}
                                            type="like-o"
                                            text="156"
                                        />,
                                        <IconText
                                            key={item.id}
                                            type="message"
                                            text="2"
                                        />
                                    ]}
                                    extra={
                                        <img
                                            width={272}
                                            alt="logo"
                                            src="https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn1.tnwcdn.com%2Fwp-content%2Fblogs.dir%2F1%2Ffiles%2F2016%2F11%2F03novblog3.jpg&f=1"
                                        />
                                    }
                                >
                                    <List.Item.Meta
                                        avatar={<Avatar src={item.avatar} />}
                                        title={
                                            <a href={item.href}>{item.title}</a>
                                        }
                                        description={item.description}
                                    />
                                    {item.content}
                                </List.Item>
                            )}
                        />
                    </Content>
                    <Aside>
                        <div
                            style={{
                                width: 250,
                                border: "1px solid #d9d9d9",
                                borderRadius: 4
                            }}
                        >
                            <Calendar
                                fullscreen={false}
                                onPanelChange={onPanelChange}
                            />
                        </div>
                    </Aside>
                </Flex>
                {/* </Container> */}
            </Wrapper>
        );
    }
}

export default Home;

const Wrapper = styled.div`
    color: #fff;
`;
const H2 = styled.div`
    font-size: 26px;
`;
const Aside = styled.div`
    width: 15%;
    margin: 0 1.5em;
`;
const Content = styled.div`
    width: 60%;
    padding: 0 3em;
    border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
`;
const DeadLine = styled.div`
    display: FLEX;
    flex-direction: column;
`;
const Flex = styled.div`
    display: flex;
    margin: 3em 2em;
`;
