import React, { Component } from "react";
import styled from "styled-components";
import { Icon } from "antd";
import PT from "prop-types";

class Progress extends Component {
    static propTypes = {
        children: PT.any
    };
    render() {
        return (
            <>
                <Content>
                    <p>
                        <Icon
                            type="check-circle"
                            style={{
                                fontSize: "25px",
                                marginRight: "8px"
                            }}
                            theme="twoTone"
                            twoToneColor="blue"
                        />
                        {this.props.children}
                    </p>
                </Content>
            </>
        );
    }
}

export default Progress;

const Content = styled.div`
    color: rgb(110, 118, 127);
`;
