import React, { Component } from "react";
import { Avatar } from "antd";
import PT from "prop-types";
import styled from "styled-components";

class CommentHeader extends Component {
    static propTypes = {
        first_name: PT.string,
        last_name: PT.string,
        date: PT.string
    };
    render() {
        const { first_name, last_name, date } = this.props;
        return (
            <Name>
                <div>
                    <Avatar
                        size="large"
                        style={{ backgroundColor: "#87d068" }}
                        icon="user"
                    />
                </div>
                <FullName>
                    <a href="">
                        {first_name} {last_name}
                    </a>

                    <br />
                    <span>{date}</span>
                    {/*      
                            <span> <Rate allowHalf defaultValue={2.5} /></span> */}
                </FullName>
            </Name>
        );
    }
}

export default CommentHeader;

const Name = styled.div`
    margin-top: 1em;
    display: flex;
    align-items: center;
`;

const FullName = styled.div`
    margin-left: 0.5em;
    font-size: 0.9em;

    a {
        color: #0ea0e7;
    }
    span {
        color: rgb(127, 127, 127);
    }
`;
