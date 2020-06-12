import React, { Component } from "react";
import PT from "prop-types";

class WeekHead extends Component {
    static propTypes = {
        children: PT.any
    };
    render() {
        return <div>{this.props.children}</div>;
    }
}

export default WeekHead;
