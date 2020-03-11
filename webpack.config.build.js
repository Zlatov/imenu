"use strict"

const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const webpack = require("webpack")

module.exports = {
  mode: "production",
  context: null,
  entry: "./test/assets/js-production",
  output: {
    path: __dirname + "/dist",
    filename: "js.js",
    library: "imenu",
    libraryTarget: "umd2"
  },
  watch: false,
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
