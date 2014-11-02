var webpack = require("webpack");
var path = require("path");

module.exports = {
  devtool: "eval-source-map",
  context: __dirname,
  entry: [
    "webpack-dev-server/client?http://localhost:4000",
    "webpack/hot/dev-server",
    "./assets/javascripts/hello"
  ],
  // Note, this file is not actually saved, but used by the express server
  output: {
    filename: "webpack-bundle.js",
    path: __dirname,
    publicPath: "http://localhost:4000/"
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ],
  // In case you wanted to load jQuery from the CDN, this is how you would do it:
  externals: {
    jquery: "var jQuery"
  },
  resolve: {
    root: [ path.join(__dirname, "scripts"), path.join(__dirname, "assets/javascripts")],
    extensions: ['', '.js', '.jsx', '.coffee', '.cjsx']
  },
  module: {
    loaders: [
      { test: /\.jsx$/, loaders: ["react-hot", "es6", "jsx?harmony"] },
      // { test: /\.jsx$/, loader: 'jsx-loader' },
      { test: /\.cjsx$/, loader: 'coffee-loader!cjsx-loader'},
      { test: /\.coffee$/, loader: 'coffee-loader' },
      { test: require.resolve('jquery'), loader: 'expose?jQuery' },
      { test: require.resolve('jquery'), loader: 'expose?$' }
    ]
  }
};