CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"mainAddressId" integer NOT NULL
);

CREATE TABLE "products" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"mainPhotoId" integer NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL
);

CREATE TABLE "photos" (
	"id" serial PRIMARY KEY,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL
);

CREATE TABLE "purchases" (
	"id" serial PRIMARY KEY,
	"userId" integer NOT NULL,
	"date" DATE NOT NULL,
	"addressId" integer NOT NULL,
	"state" TEXT NOT NULL
);

CREATE TABLE "productsPurchases" (
	"id" serial PRIMARY KEY,
	"productId" integer NOT NULL,
	"purchaseId" integer NOT NULL,
	"amount" integer NOT NULL,
	"currentPrice" integer NOT NULL,
	"paidPrice" integer NOT NULL
);

CREATE TABLE "addresses" (
	"id" serial PRIMARY KEY,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"zipCode" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"district" TEXT NOT NULL,
	"userId" integer NOT NULL,
	"cityId" integer NOT NULL
); 

CREATE TABLE "cities" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" integer NOT NULL
);

CREATE TABLE "states" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "categories" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "sizes" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL
);

ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("mainAddressId") REFERENCES "addresses"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainPhotoId") REFERENCES "photos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");

ALTER TABLE "photos" ADD CONSTRAINT "photos_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("addressId") REFERENCES "addresses"("id");

ALTER TABLE "products_purchases" ADD CONSTRAINT "products_purchases_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "products_purchases" ADD CONSTRAINT "products_purchases_fk1" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id");

ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");