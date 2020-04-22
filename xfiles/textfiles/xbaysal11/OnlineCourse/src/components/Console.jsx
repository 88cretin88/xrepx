import React, { Component } from "react";
import styled from "styled-components";
import Terminal from "react-console-emulator";

const commands = {
    echo: {
        description: "Echo a passed string.",
        usage: "echo <string>",
        fn: function() {
            return `${Array.from(arguments).join(" ")}`;
        }
    }
};
class Console extends Component {
    render() {
        return (
            <TerminalWrapper>
                <Terminal
                    commands={commands}
                    welcomeMessage={"Welcome to the terminal!"}
                    promptLabel={"$"}
                />
            </TerminalWrapper>
        );
    }
}
export default Console;

const TerminalWrapper = styled.div`
    & [name="react-console-emulator__content"] {
        font-size: 10px !important;
    }
    & [name="react-console-emulator"] {
        height: 450px;
    }
    & [name="react-console-emulator__input"] {
        font-size: 10px !important;
    }
`;
