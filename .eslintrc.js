module.exports = {
  root: true,
  env: {
    browser: true,
    node: true
  },
  parserOptions: {
    parser: 'babel-eslint',
    ecmaVersion: 6
  },
  extends: [
    'plugin:vue/essential',
    "eslint:recommended",
    "plugin:prettier/recommended"
  ],
  plugins: [
    'vue'
  ],
  rules: {
    "prettier/prettier": [
      "error",
      {
        "singleQuote": true,
        "semi": false,
        "files.associations": {
          "*.vue": "vue"
        },
        "emmet.syntaxProfiles": {
          "vue": "css"
        },
        "indent": ["error", "tab"],
      },
    ],
  }
}
