module.exports = {
  "env": {
    "browser": true,
    "node": true,
    "es6": true,
    "jest": true,
    "mocha": true
  },
  "parser": "babel-eslint",
  "parserOptions": {
    "ecmaVersion": 7,
    "ecmaFeatures": {
      "legacyDecorators": true
    },
    "babelOptions": {
      "configFile": "./babel.config.js"
    }
  },
  "extends": [
    "airbnb",
    "@wgf"
  ],
  "rules": {
    "import/no-extraneous-dependencies": 0,
    "react/jsx-filename-extension": 0
  }
};
