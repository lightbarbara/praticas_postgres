CREATE TABLE companhias (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    sigla VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE aeroportos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    sigla VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE voos (
    id SERIAL PRIMARY KEY,
    "companhiaId" INTEGER NOT NULL REFERENCES companhias(id),
    sigla TEXT NOT NULL,
    "aeroportoChegadaId" INTEGER NOT NULL REFERENCES aeroportos(id),
    "aeroportoSaidaId" INTEGER NOT NULL REFERENCES aeroportos(id),
    "horaChegada" TIMESTAMP NOT NULL,
    "horaSaida" TIMESTAMP NOT NULL
);