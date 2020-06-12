import React from "react";
import Editor from "react-simple-code-editor";
import { highlight, languages } from "prismjs/components/prism-core";
import "prismjs/components/prism-clike";
import "prismjs/components/prism-javascript";
import "prismjs/themes/prism.css";

const code = `function add(a, b) {
  return a + b;
}
console.log(adsfasdf);
`;
class CodeEditor extends React.Component {
    state = { code };
    render() {
        return (
            <Editor
                value={this.state.code}
                onValueChange={code => this.setState({ code })}
                highlight={code => {
                    // console.log(code);
                    return highlight(code, languages.js, "javascript");
                }}
                padding={10}
                style={{
                    fontFamily: "'Fira code', 'Fira Mono', monospace",
                    fontSize: 12,
                    background: "#EFEFEF",
                    height: "100%",
                    borderRadius: "5px"
                }}
            />
        );
    }
}
export default CodeEditor;
