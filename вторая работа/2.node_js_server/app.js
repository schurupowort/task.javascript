require('dotenv').config();

var path = require("path");
var express = require("express");
var bodyParser = require("body-parser");
var db = require("./src/db/client");

var app = express();

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

require("./src/routers/routeManager")(app);


app.listen(8000);
