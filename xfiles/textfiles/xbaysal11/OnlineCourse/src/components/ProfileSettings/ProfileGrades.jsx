/* eslint-disable react/display-name */
import React, { Component } from "react";
import styled from "styled-components";
import { Table, Divider, Tag } from "antd";

const columns = [
    {
        title: "Name",
        dataIndex: "name",
        key: "name",
        render: text => <a href="javascript:;">{text}</a>
    },
    {
        title: "Age",
        dataIndex: "age",
        key: "age"
    },
    {
        title: "Address",
        dataIndex: "address",
        key: "address"
    },
    {
        title: "Tags",
        key: "tags",
        dataIndex: "tags",
        render: tags => (
            <span>
                {tags.map(tag => {
                    let color = tag.length > 5 ? "geekblue" : "green";
                    if (tag === "loser") {
                        color = "volcano";
                    }
                    return (
                        <Tag color={color} key={tag}>
                            {tag.toUpperCase()}
                        </Tag>
                    );
                })}
            </span>
        )
    },
    {
        title: "Action",
        key: "action",
        render: (text, record) => (
            <span>
                <a href="javascript:;">Invite {record.name}</a>
                <Divider type="vertical" />
                <a href="javascript:;">Delete</a>
            </span>
        )
    }
];

const data = [
    {
        key: "1",
        name: "John Brown",
        age: 32,
        address: "New York No. 1 Lake Park",
        tags: ["nice", "developer"]
    },
    {
        key: "2",
        name: "Jim Green",
        age: 42,
        address: "London No. 1 Lake Park",
        tags: ["loser"]
    },
    {
        key: "3",
        name: "Joe Black",
        age: 32,
        address: "Sidney No. 1 Lake Park",
        tags: ["cool", "teacher"]
    }
];
class ProfileGrades extends Component {
    render() {
        return (
            <Wrapper>
                <Table columns={columns} dataSource={data} />
            </Wrapper>
        );
    }
}

export default ProfileGrades;
const Wrapper = styled.form`
    background: #fff;
    padding: 2em;
    border-radius: 4px;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.15);
    margin: 24px 12px 52px 12px;
    min-height: 50%;
`;
