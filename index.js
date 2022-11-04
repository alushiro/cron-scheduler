const express = require('express');
var fs = require('fs');
var ts=require('log-timestamp');
app = express();
let rawdata = fs.readFileSync('config.json');
let config = JSON.parse(rawdata);
console.log(config.cron);
config.cron.forEach(obj => {
    if(obj.flagActive){
        console.log("Initialize Job: "+obj.description+" at Endpoint:  "+obj.endpoint);
        let cron = require('node-cron');
        cron.schedule(obj.cronExpression, function() {
        console.log('Running a job: '+obj.endpoint + " Description Job: "+obj.description);
        const request = require('request');
        request(obj.endpoint, { json: true }, (err, res, body) => {
        if (err) { return console.log(err); }
        //console.log(body);
    }); 
        }, {
            timezone: "America/Santiago"
          });
    }
    });
app.listen(5000);