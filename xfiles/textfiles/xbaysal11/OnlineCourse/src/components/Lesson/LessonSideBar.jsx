import React, { Component } from "react";
import WeekItem from "./WeekItem";

import { Layout } from "antd";

const data = [
    {
        id: 1,
        title: "SQL introduction",
        progress: 1,
        lessons: [
            {
                id: 1,
                title: "1.1 Первые запросы",
                progress: 0.5,
                available: true
            },
            {
                id: 2,
                title: "1.2 Составные условия",
                progress: 1,
                available: true
            }
        ]
    },
    {
        id: 2,
        title: "SQL advanced",
        progress: 1,
        lessons: [
            {
                id: 3,
                title: "2.1 Принципы работы баз данных",
                progress: 0,
                available: false
            },
            {
                id: 4,
                title: "2.2 Установка MySQL в Windows",
                progress: 0,
                available: false
            }
        ]
    }
];

class LessonSideBar extends Component {
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
            <Layout.Sider
                collapsible
                collapsed={this.state.collapsed}
                theme="light"
                trigger={null}
                collapsedWidth="120px"
            >
                <ul>
                    {data.map(w => {
                        return <WeekItem key={w.id} week={w} />;
                    })}
                </ul>
            </Layout.Sider>
        );
    }
}
export default LessonSideBar;
