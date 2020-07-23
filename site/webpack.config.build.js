"use strict"

const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const webpack = require("webpack")

var node_env = null
switch (process.env.NODE_ENV) {
  case null:
  case undefined:
  case "development":
  node_env = "development"
  break
  case "production":
  node_env = "production"
  break
  default:
  throw new Error("Не удалось определить окружение.")
}

module.exports = {
  mode: node_env,
  context: null,
  entry: "./src/js.js",
  output: {
    path: __dirname + "/public/assets",
    filename: "js.js",
    library: "site",
    libraryTarget: "umd2"
  },
  watch: node_env == "development",
  devtool: false,
  optimization: {
    minimize: true
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"]
          }
        }
      },
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          {loader: MiniCssExtractPlugin.loader },
          {loader: "css-loader"},
          {loader: "postcss-loader"},
          {loader: "sass-loader", options: {implementation: require("sass")}}
        ]
      },
      {
        test: /\.(png|jpe?g|gif|svg)$/i,
        use: [
          {
            loader: "file-loader",
            options: {
              outputPath: "./",
              name: "[path][name]_[hash].[ext]"
            }
          }
        ]
      },
      {
        test: /\.(woff|woff2|ttf|otf|eot)$/i,
        use: [
          {
            loader: "file-loader",
            options: {
              outputPath: "../fonts",
              name: "[path][name]_[hash].[ext]"
            }
          }
        ]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "./css.css"
    })
  ]
}
