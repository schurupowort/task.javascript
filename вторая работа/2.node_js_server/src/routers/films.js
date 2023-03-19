var express = require("express");

const films = require("../controllers/films");

var router = express.Router();

router.get("/", films.index);
router.post("/", films.create);
router.get("/:film_id", films.get);
router.put("/:film_id", films.update);
router.delete("/:film_id", films.delete);


module.exports = router;
