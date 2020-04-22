import React, { Component } from "react";
import MarkdownText from "../MarkdownText";
import styled from "styled-components";
import { colors } from "../../config";
import { Icon as IIcon } from "antd";

const tldr_title = `
## **Title**
`;
const tldr = `
Сертификаты получают студенты набравшие 50 баллов, студенты набравшие 75 баллов и выше 
получают сертификат с отличием.
`;

class Tldr extends Component {
    render() {
        return (
            <TTldr>
                <Flex>
                    <Icon
                        type="info-circle"
                        theme="filled"
                        style={{ fontSize: "20px", color: "#08c" }}
                    />
                    <MarkdownText text={tldr_title} />
                </Flex>
                <MarkdownText text={tldr} />
            </TTldr>
        );
    }
}
export default Tldr;

const TTldr = styled.div`
    margin: 16px 0;
    padding: 16px;
    border: 3px solid ${colors.blue_light};
    border-radius: 4px;
    /* background: ${colors.blue_light}; */
`;
const Flex = styled.div`
    display: flex;
`;

const Icon = styled(IIcon)`
    margin: 0 5px 0 0;
`;
