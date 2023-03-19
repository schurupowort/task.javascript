const filmsRouter = require("./films");

module.exports = function (app) {
    app.use("/films", filmsRouter);
}
