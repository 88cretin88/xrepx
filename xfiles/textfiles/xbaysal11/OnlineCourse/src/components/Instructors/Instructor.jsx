import React, { Component } from "react";
import styled from "styled-components";

import photo from "../../assets/img/client-1.jpg";

class Instructor extends Component {
    render() {
        return (
            <>
                <MyImg>
                    <img src={photo} alt="" />
                    <h5>Dr. Shane Dixon</h5>

                    <span>
                        Full-Stack developer. OSS Contributor @ GatsbyJS.
                        Thru-hiker. 11 min read · April 6th 2019
                    </span>
                </MyImg>
            </>
        );
    }
}

export default Instructor;

const MyImg = styled.div`
    margin-left: 80px;
    text-align: center;
    img {
        border-radius: 50%;
        width: 130px;
        height: 130px;
        margin-bottom: 15px;
    }
    h5 {
        margin: 0;
        padding: 0;
        padding-bottom: 5px;
        color: #663399;
    }

    span {
        font-size: 0.9em;   
        color: #7a7a7a;
    }
`;
