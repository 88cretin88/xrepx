import React, { Component } from "react";
import PT from "prop-types";
import styled from "styled-components";

import LessonItem from "./LessonItem";
import { colors } from "../../config";

const ShevronIcon = () => {
    return (
        <svg
            viewBox="0 0 926.23699 573.74994"
            version="1.1"
            x="0px"
            y="0px"
            width="10"
            height="10"
            className="css-zcgwop"
        >
            <g transform="translate(904.92214,-879.1482)">
                <path
                    d="
          m -673.67664,1221.6502 -231.2455,-231.24803 55.6165,
          -55.627 c 30.5891,-30.59485 56.1806,-55.627 56.8701,-55.627 0.6894,
          0 79.8637,78.60862 175.9427,174.68583 l 174.6892,174.6858 174.6892,
          -174.6858 c 96.079,-96.07721 175.253196,-174.68583 175.942696,
          -174.68583 0.6895,0 26.281,25.03215 56.8701,
          55.627 l 55.6165,55.627 -231.245496,231.24803 c -127.185,127.1864
          -231.5279,231.248 -231.873,231.248 -0.3451,0 -104.688,
          -104.0616 -231.873,-231.248 z
        "
                    fill="currentColor"
                />
            </g>
        </svg>
    );
};

class WeekItem extends Component {
    static propTypes = {
        week: PT.object.isRequired
    };
    state = {
        collapse: false
    };
    toggle = () => {
        this.setState({
            collapse: !this.state.collapse
        });
    };
    render() {
        const { collapse } = this.state;
        const { week } = this.props;
        return (
            <Root className="week">
                <WeekTitle onClick={this.toggle} className="title">
                    <Title>{week.title}</Title>
                    <a>
                        <ShevronIcon />
                    </a>
                </WeekTitle>
                {collapse === false ? (
                    <LessonsList>
                        {week.lessons.map(l => {
                            return <LessonItem key={l.id} lesson={l} />;
                        })}
                    </LessonsList>
                ) : null}
            </Root>
        );
    }
}
export default WeekItem;

const Root = styled.li`
    margin: 0px;
    list-style: none;
    position: relative;
    background: rgba(241, 222, 250, 0.15);
    transition: all 100ms cubic-bezier(0.4, 0, 0.2, 1) 0s;
    cursor: pointer;
    &::before {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        border-top: 1px solid rgba(0, 0, 0, 0.07);
    }
`;

const LessonsList = styled.ul``;
const WeekTitle = styled.span`
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    position: relative;
    &::before {
        bottom: 0px;
        top: auto;
        content: "";
        height: 1px;
        position: absolute;
        right: 0px;
        left: 1.5rem;
        background: transparent;
    }
    &:hover {
        background: rgba(241, 222, 250, 0.275);
    }
`;
const Title = styled.span`
    min-height: 2.5rem;
    padding-top: 0.75rem;
    padding-bottom: 0.75rem;
    position: relative;
    z-index: 1;
    width: 90%;
    padding-right: 1.5rem;
    padding-left: 1.5rem;
    &::before {
        transform: scale(0.1);
        border-radius: 100%;
        content: "";
        left: calc(0.5rem);
        top: 1.3em;
        height: 8px;
        position: absolute;
        width: 8px;
        transition: all 250ms cubic-bezier(0.4, 0, 0.2, 1) 0s;
    }

    &:hover::before {
        transform: scale(1);
        background: ${colors.blue};
    }
    &::after {
        opacity: 0;
        transform: translateX(-92px);
        width: 0px;
        background: ${colors.blue};
        border-radius: 4px;
        content: "";
        left: calc(0.5rem);
        top: 1.3em;
        height: 8px;
        position: absolute;
        width: 8px;
        transition: all 250ms cubic-bezier(0.4, 0, 0.2, 1) 0s;
    }
`;
