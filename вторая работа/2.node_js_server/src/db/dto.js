class Film {
    constructor(db_object) {
        this.id = db_object.id
        this.name = db_object.name
    }
}


class FilmDetail {
    constructor(db_object) {
        this.id = db_object.id
        this.name = db_object.name
        // Add more fields
    }
}

class FilmCreate {
    constructor(body) {
        this.name = body.name
    }
}


exports.Film = Film
exports.FilmDetail = FilmDetail
exports.FilmCreate = FilmCreate
