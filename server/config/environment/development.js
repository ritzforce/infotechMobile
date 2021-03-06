'use strict';

// Development specific configuration
// ==================================
module.exports = {
  // MongoDB connection options
  mongo: {
    uri: 'mongodb://localhost/exam-dev'
  },

  sql: {
    maxLimit: 100,
    host: 'localhost',
    user : 'root',
    password: '',
    database: 'examination'
  },

  log: {
    logLevel : 'info' 
  },
  seedDB: false
};
