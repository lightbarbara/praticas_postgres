CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "customerPhones" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    number TEXT NOT NULL,
    type TEXT NOT NULL ENUM ('landline', 'mobile')
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
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    street VARCHAR(30) NOT NULL,
    number INTEGER NOT NULL,
    complement TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL DEFAULT NOW(),
    "closeDate" DATE NOT NULL
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    amount INTEGER NOT NULL DEFAULT 0,
    type TEXT NOT NULL ENUM ('deposit', 'withdraw'),
    time DATE NOT NULL,
    description TEXT NOT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards" (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    name VARCHAR(30) NOT NULL,
    number TEXT NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" TEXT NOT NULL,
    "expirationYear" TEXT NOT NULL,
    password TEXT NOT NULL,
    "cardLimit" INTEGER NOT NULL DEFAULT 0
);