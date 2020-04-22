import React, { Component } from "react";
import { Collapse } from "antd";
import styled from "styled-components";

const Panel = Collapse.Panel;

class Faq extends Component {
    render() {
        return (
            <MarginBot>
                <Center>
                    <h2>Frequently Asked Questions</h2>
                </Center>
                <Collapse>
                    <Panel
                        style={{ marginBottom: "10px", paddingTop: "10px" }}
                        header="When will I have access to the lectures and assignments?"
                        key="1"
                    >
                        <p>
                            Once you enroll for a Certificate, you’ll have
                            access to all videos, quizzes, and programming
                            assignments (if applicable). Peer review assignments
                            can only be submitted and reviewed once your session
                            has begun. If you choose to explore the course
                            without purchasing, you may not be able to access
                            certain assignments.
                        </p>
                    </Panel>
                    <Panel
                        style={{ marginBottom: "10px" }}
                        header="What will I get if I subscribe to this Specialization?"
                        key="2"
                    >
                        <p>
                            When you enroll in the course, you get access to all
                            of the courses in the Specialization, and you earn a
                            certificate when you complete the work. Your
                            electronic Certificate will be added to your
                            Accomplishments page - from there, you can print
                            your Certificate or add it to your LinkedIn profile.
                            If you only want to read and view the course
                            content, you can audit the course for free.
                        </p>
                    </Panel>
                    <Panel
                        style={{ marginBottom: "10px" }}
                        header="What is the refund policy?"
                        key="3"
                    >
                        <p>
                            If you subscribed, you get a 7-day free trial during
                            which you can cancel at no penalty. After that, we
                            don’t give refunds, but you can cancel your
                            subscription at any time. See our full refund
                            policy.
                        </p>
                    </Panel>
                    <Panel
                        style={{ marginBottom: "10px" }}
                        header="Is financial assistance available?"
                        key="4"
                    >
                        <p>
                            Yes, Coursera provides scholarships to learners who
                            cannot afford the fee. Apply for it by clicking on
                            the Scholarships link next to the "Enroll" button.
                            You'll be prompted to complete an application and
                            will be notified if you are approved. You'll need to
                            complete this step for each course in the
                            Specialization, including the Capstone Project.
                            Learn more.
                        </p>
                    </Panel>
                </Collapse>
            </MarginBot>
        );
    }
}

export default Faq;

const Center = styled.div`
    text-align: center;
    margin-bottom: 60px;
`;

const MarginBot = styled.div`
    padding-bottom: 80px;
`;
