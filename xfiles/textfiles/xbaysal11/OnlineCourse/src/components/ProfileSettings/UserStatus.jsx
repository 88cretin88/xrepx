import React, { Component } from "react";
import PT from "prop-types";


class UserStatus extends Component {
    static propTypes = {
        userStatus: PT.string
    };
    
    render() {
        const { userStatus } = this.props;
        return (
            <div style={{color:"#fff"}}>
                {userStatus === "Student" ? (
                    <span style={{background:"green", borderRadius: "5px", fontSize:"12px",
                        padding:"3px"}}>{userStatus}</span>
                ) : this.props.userStatus === "Admin" ? (
                    <span style={{background:"red", borderRadius: "5px", fontSize:"12px",
                        padding:"3px"}}>{userStatus}</span>

                ) : this.props.userStatus === "Teacher" ? (
                    <span style={{background:"orange", borderRadius: "5px", fontSize:"12px",
                        padding:"3px"}}>{userStatus}</span>

                ) : (
                    <span style={{background:"green", borderRadius: "5px", fontSize:"12px",
                        padding:"3px"}}>{userStatus}</span>

                )}
            </div>
        );
    }
}
export default UserStatus;