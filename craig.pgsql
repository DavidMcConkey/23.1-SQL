DROP DATABASE craig_db;
CREATE DATABASE craig_db;
\c craig_db;

CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    pref_region INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT UNIQUE NOT NULL,
    text TEXT NOT NULL,
    curr_location TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES region ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE
);
