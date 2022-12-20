CREATE TABLE "usuários" (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    ENDEREÇO TEXT NOT NULL
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    "preço" INT NOT NULL,
    foto TEXT NOT NULL,
    categoria INTEGER NOT NULL REFERENCES "categorias"("id")
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE tamanhos (
    id SERIAL PRIMARY KEY,
    tamanho VARCHAR(1) UNIQUE NOT NULL
);

CREATE TABLE compras (
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES "usuários"("id"),
    "produtoId" INTEGER NOT NULL REFERENCES "produtos"("id"),
    "tamanhoId" INTEGER NOT NULL REFERENCES "tamanhos"("id"),
    status VARCHAR(15) DEFAULT 'criada',
    data TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);