module.exports = {
    "env": {
        "browser": true,
        "commonjs": true,
        "es6": true
    },
    "parserOptions": {
        "ecmaVersion": 2018,
        "sourceType": "module"
    },
    "extends": [
			"plugin:vue/essential",
			"eslint:recommended"
    ],
    "plugins": ['vue'],
    "rules": {
        "indent": [
            "error",
            "space"
        ],
        "linebreak-style": [
            "error",
            "unix"
        ],
        "quotes": [
            "error",
            "single"
        ],
        "semi": [
            "error",
            "never"
        ]
    }
};
