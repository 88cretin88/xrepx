module.exports = {
    env: {
        browser: true,
        es6: true,
        node: true
    },
    extends: [
        "eslint:recommended",
        // "eslint-config-react:recommended",
        // "eslint-plugin-react:recommended",
        "plugin:react/recommended",
        "plugin:import/errors",
        "plugin:import/warnings",
        "prettier"
    ],
    parser: "babel-eslint",
    parserOptions: {
        ecmaFeatures: {
            jsx: true
        },
        ecmaVersion: 2017,
        sourceType: "module"
    },
    plugins: ["react", "prettier", "import"],
    rules: {
        indent: [
            "error",
            4,
            {
                SwitchCase: 1
            }
        ],

        "linebreak-style": ["error", "unix"],
        quotes: ["error", "double"],
        semi: ["error", "always"],
        "global-require": "off",
        // prettier
        // "prettier/prettier": "error",
        // react
        "react/jsx-uses-vars": 1,
        "react/jsx-uses-react": 1,
        "react/prop-types": 2,
        "react/no-unescaped-entities": 0,

        // "react/display-name": 0,
        // debug
        "no-console": 0,
        "no-debug": 0
    },
    settings: {
        "import/resolver": {
            node: {
                extensions: [".js", ".jsx", ".es6"]
            }
        }
    }
};
