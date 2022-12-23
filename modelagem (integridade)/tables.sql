CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TYPE "phoneType" AS ENUM ('landline', 'mobile')

CREATE TABLE "customerPhones" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    number TEXT NOT NULL,
    type "phoneType" NOT NULL
);

CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerAddresses" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
    street VARCHAR(30) NOT NULL,
    number INTEGER NOT NULL,
    complement TEXT DEFAULT '-',
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL UNIQUE,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL DEFAULT NOW(),
    "closeDate" DATE
);

CREATE TYPE "transactionType" AS ENUM ('deposit', 'withdraw')

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    amount BIGINT NOT NULL,
    type "transactionType" NOT NULL,
    "time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards" (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    name VARCHAR(30) NOT NULL,
    number TEXT NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL DEFAULT 0
);