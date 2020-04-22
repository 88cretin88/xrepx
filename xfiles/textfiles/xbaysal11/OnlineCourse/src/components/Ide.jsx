import React, { Component } from "react";
import SplitPane from "react-split-pane";
import styled from "styled-components";
import { Menu, Dropdown, Button as BTN } from "antd";

import CodeEditor from "./CodeEditor";
import Console from "./Console";

const ButtonGroup = BTN.Group;

const menu = (
    <Menu>
        <Menu.Item>
            <a
                target="_blank"
                rel="noopener noreferrer"
                href="http://www.alipay.com/"
            >
                JS
            </a>
        </Menu.Item>
        <Menu.Item>
            <a
                target="_blank"
                rel="noopener noreferrer"
                href="http://www.taobao.com/"
            >
                Python
            </a>
        </Menu.Item>
        <Menu.Item>
            <a
                target="_blank"
                rel="noopener noreferrer"
                href="http://www.tmall.com/"
            >
                HTML
            </a>
        </Menu.Item>
        <Menu.Item>
            <a
                target="_blank"
                rel="noopener noreferrer"
                href="http://www.tmall.com/"
            >
                CSS
            </a>
        </Menu.Item>
    </Menu>
);

class Ide extends Component {
    render() {
        return (
            <Wrapper>
                <NavBar>
                    <Dropdown overlay={menu} placement="bottomCenter">
                        <Button>Languages</Button>
                    </Dropdown>
                    <h5>Lesson #</h5>
                    <ButtonGroup className="right ">
                        <Button>Prettify!</Button>
                        <Button type="primary ">Run!</Button>
                    </ButtonGroup>
                </NavBar>
                <IdeWrapper>
                    <SplitPane
                        split="vertical"
                        minSize={50}
                        defaultSize={"60%"}
                    >
                        <CodeEditor />
                        <Console />
                    </SplitPane>
                </IdeWrapper>
                <Button className="right " type="primary">
                    Submit!
                </Button>
            </Wrapper>
        );
    }
}
export default Ide;

const IdeWrapper = styled.div`
    margin: 1em 0;
    width: 100%;
    height: 450px;
    position: relative;
    & .Resizer.vertical {
        position: relative;
        display: block;
        min-width: 10px;
        cursor: col-resize;
        &:after {
            content: "";
            width: 2px;
            height: 20px;
            background: #ccc;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translateX(-50%) translateY(-50%);
        }
    }
`;
const Wrapper = styled.div`
    margin: 3em 0;

    & .right {
        float: right;
        margin-right: 10px;
    }
`;
const Button = styled(BTN)``;
const NavBar = styled.div`
    display: flex;
    justify-content: space-between;
`;
