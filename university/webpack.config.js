var path = require('path');

module.exports = {
    entry: './client/js/app.js',
    output: {
        path: path.resolve('www/build/js'),
        filename: 'app.bundle.js',
        pathinfo: false
    },
    module: {
        loaders: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                query: {
                    presets: ['es2015', 'react'],
                    plugins: ['transform-object-rest-spread']
                },
                exclude: /node_modules/
            },
            {
                test:   /\.css$/, // Transform all .css files required somewhere within an entry point...
                loaders: ['style-loader', 'css-loader', 'postcss-loader'] // ...with PostCSS
            }
        ]
    },
    postcss: function() {
        return [
          require('postcss-import')({ // Import all the css files...
            onImport: function (files) {
                files.forEach(this.addDependency); // ...and add dependecies from the main.css files to the other css files...
            }.bind(this) // ...so they get hot–reloaded when something changes...
          }),
          console.log('awef'),
          require('postcss-simple-vars')(), // ...then replace the variables...
          require('postcss-focus')(), // ...add a :focus to ever :hover...
          require('autoprefixer')({ // ...and add vendor prefixes...
            browsers: ['last 2 versions', 'IE > 8'] // ...supporting the last 2 major browser versions and IE 8 and up...
          }),
          require('postcss-reporter')({ // This plugin makes sure we get warnings in the console
            clearMessages: true
          })
        ];
      },
      target: "web", // Make web variables accessible to webpack, e.g. window
    stats: {
        colors: true
    },
    devtool: 'source-map'
};