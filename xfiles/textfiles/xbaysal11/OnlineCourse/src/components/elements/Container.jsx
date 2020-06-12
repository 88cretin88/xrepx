import React, { PureComponent } from "react";
import PT from "prop-types";
import styled from "styled-components";
import { createBreakpoints } from "styled-breakpoints";

class Container extends PureComponent {
    static propTypes = {
        children: PT.any
    };

    render() {
        const { children } = this.props;
        return <ContainerBlock>{children}</ContainerBlock>;
    }
}

const { above } = createBreakpoints({
    sm: "426px",
    md: "618px",
    lg: "842px",
    xl: "1050px"
});

const ContainerBlock = styled.div`
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    ${above("sm")} {
        max-width: 390px;
    }
    ${above("md")} {
        max-width: 570px;
    }
    ${above("lg")} {
        max-width: 810px;
    }
    ${above("xl")} {
        max-width: 990px;
    }
`;

export default Container;
