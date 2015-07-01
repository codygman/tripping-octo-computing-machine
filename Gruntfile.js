module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({

    libFiles: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs"
    ],

    psc: {
      options: {
        main: "Validator.Main",
        modules: ["Validator.Main"]
      },
      all: {
        src: [ "src/**/*.purs"
             , "bower_components/**/src/**/*.purs"],
        dest: "dist/example.js"
      }
    },
    dotPsci: ["<%=libFiles%>"],
    watch: {
      files: [ "src/**/*.purs"
             , "bower_components/**/src/**/*.purs"],
      tasks: ["psc:all"]
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks("grunt-purescript");

  grunt.registerTask("default", ["psc:all","dotPsci"]);
};
