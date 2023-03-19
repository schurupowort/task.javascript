const { Client } = require("pg")

const client = new Client({
    user: process.env.db_user,
    password: process.env.db_password,
    host: process.env.db_host,
    port: process.env.db_port,
    database: process.env.db_database
})

client.connect()

exports.client = client
