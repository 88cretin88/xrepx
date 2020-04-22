import React, { Component } from "react";
import styled from "styled-components";
import { Row, Col} from "antd";

import photo from "../../assets/img/client-1.jpg";

class InstructorSmall extends Component {
    render() {
        return (
            <>
                <MyImg>
                    <Row>
                        <Col span={4}>
                            <img src={photo} alt="" />
                        </Col>
                        <Col span={20}>
                            <span>
                                <h6>Dr. Shane Dixon</h6>
                                Full-Stack developer. OSS Contributor @
                                It-Academy.<br></br> Thru-hiker. 11 min read · April 6th
                                2019
                            </span>
                        </Col>
                    </Row>
                </MyImg>
            </>
        );
    }
}

export default InstructorSmall;

const MyImg = styled.div`
  

    img {
        border-radius: 50%;
        width: 60px;
        height: 60px;
    }
    h6 {
        margin: 0;
        padding: 0;
        color: #663399;
    }

    span {
        font-size: 0.9em;
        color: #7a7a7a;
    }
`;
