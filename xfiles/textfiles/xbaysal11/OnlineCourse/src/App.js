import React, { Component } from "react";

import styled from "styled-components";
import { Reset } from "styled-reset";
import { BrowserRouter as Router } from "react-router-dom";

import Header from "./components/Header/Header";
import Footer from "./components/Footer/Footer";
import Routes from "./routes";
import { ModalManager } from "./components";

import "antd/dist/antd.css";

class App extends Component {
    render() {
        return (
            <Wrapper>
                <Reset />
                <ModalManager>
                    <Router>
                        <>
                            <Header />
                            <Routes />
                            <Footer />
                        </>
                    </Router>
                </ModalManager>
            </Wrapper>
        );
    }
}

export default App;

const Wrapper = styled.div`
    background: #f7f7f7;
`;
