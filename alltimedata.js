var http = require('http'),
        url = require('url'),
        exec = require('child_process').exec;
const PORT=8022;
const moment = require('moment')
const csv=require('csvtojson')
const fs = require('fs')

function todayDate() {
    var dateString = moment().subtract(1, 'days').utc().format('MM-DD-Y')
    console.log("today datestring", dateString);
    return dateString;
}

var handleRequest = function(req, res){
        console.log(new Date().toISOString() + " :: " + req.url);
        if(req.url.indexOf("/data") == 0){
                console.log("i am here");
                var param = url.parse(req.url,true).query;
                var data_type = param.type || "global";
                var at = param.at || todayDate();
                const csvFilePath='./COVID-19/csse_covid_19_data/csse_covid_19_daily_reports/'+at+'.csv';
                console.log("csvFilePath", csvFilePath);
                // check file exists or not

                fs.access(csvFilePath, fs.F_OK, (err) => {
                    if (err) {
                        console.error(err)
                        res.end(JSON.stringify({'success': false, 'message': 'data doesnot exists in this date'}));
                        return;
                    }

                    //file exists
                    if(data_type=="global") {
                        csv()
                            .fromFile(csvFilePath)
                            .then((jsonObj)=>{
                                console.log(jsonObj);
                                res.end(JSON.stringify(jsonObj));
                            });  
                    } else {
                            res.end("type not defined");
                    }
                });         
        }
        else{
                res.end("Url = " + req.url);
        }
}

http.createServer(handleRequest).listen(PORT, function(){
    console.log("Server listening on: http://localhost:%s", PORT);
});