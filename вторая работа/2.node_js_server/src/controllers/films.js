const { client } = require("../db/client");
const { Film, FilmCreate, FilmDetail } = require("../db/dto");
var quiries = require("../db/queries");


module.exports.index = async function(req,res) {
    let query_response = await client.query(quiries.select_films, [0, 10])
    let films = query_response.rows.map(item => new Film(item))

    res.json(films);
}


module.exports.get = async function(req, res) {
    let query_response = await client.query(quiries.select_film_by_id, [req.params.film_id])
    let films = query_response.rows

    if (films.length === 0)
        return res.sendStatus(404);

    res.json(new FilmDetail(films[0]));
}


module.exports.create = async function(req, res) {
    let body = new FilmCreate(req.body)
    let query_response = await client.query(quiries.insert_film, [body.name])

    res.status(201).json(new FilmDetail(query_response.rows[0]));
}


module.exports.update = async function(req, res) {
    let query_response = await client.query(quiries.select_film_by_id, [req.params.film_id])
    if (query_response.rows.length === 0)
        return res.sendStatus(404);

    let body = new FilmCreate(req.body)

    query_response = await client.query(
        quiries.update_film,
        [body.name, req.params.film_id]
    )

    let response_model = new FilmDetail(query_response.rows[0])

    res.json(response_model);
}


module.exports.delete = async function(req, res) {
    let query_response = await client.query(quiries.select_film_by_id, [req.params.film_id])
    if (query_response.rows.length === 0)
        return res.sendStatus(404);

    await client.query(
        quiries.delete_film,
        [req.params.film_id]
    )

    res.sendStatus(204);
}
