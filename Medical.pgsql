DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday TEXT NOT NULL
);

CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    visit_date TEXT NOT NULL
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL 
);


CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    visid_id INTEGER REFERENCES visits ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE,
    notes TEXT
);




