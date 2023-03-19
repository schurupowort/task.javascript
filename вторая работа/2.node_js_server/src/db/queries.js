// FILM
module.exports.select_films = "SELECT * FROM film ORDER BY film.id OFFSET $1::INTEGER LIMIT $2::INTEGER";
module.exports.select_film_by_id = "SELECT * FROM film WHERE film.id = $1::INTEGER";
module.exports.insert_film = "INSERT INTO film(name) VALUES ($1::text) RETURNING *";
module.exports.update_film = "UPDATE film SET name=$1::text WHERE film.id = $2::INTEGER RETURNING *";
module.exports.delete_film = "DELETE FROM film WHERE film.id = $1::INTEGER";
// /FILM
