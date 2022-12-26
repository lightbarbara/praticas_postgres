CREATE TABLE modulos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
);

CREATE TABLE projetos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    "moduloId" INTEGER NOT NULL REFERENCES modulos(id)
);

CREATE TYPE "notaType" AS ENUM ('Abaixo das expectativas', 'Dentro das expectativas', 'Acima das expectativas')

CREATE TABLE avaliacao (
    id SERIAL PRIMARY KEY,
    tipo "notaType" NOT NULL UNIQUE
);

CREATE TABLE "alunosProjetos" (
    id SERIAL PRIMARY KEY,
    "alunoId" INTEGER NOT NULL REFERENCES alunos(id),
    "projetoId" INTEGER NOT NULL REFERENCES projetos(id),
    "dataEntrega" DATE WITHOUT TIME ZONE NOT NULL,
    nota INTEGER NOT NULL REFERENCES avaliacao(id)
);

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE turmas (
    id SERIAL PRIMARY KEY,
    codigo TEXT NOT NULL UNIQUE
);

CREATE TABLE "alunosTurmas" (
    id SERIAL PRIMARY KEY,
    "alunoId" INTEGER NOT NULL REFERENCES alunos(id),
    "turmaId" INTEGER NOT NULL REFERENCES turmas(id),
    "dataEntrada" DATE NOT NULL DEFAULT NOW(),
    "dataSaida" DATE
);