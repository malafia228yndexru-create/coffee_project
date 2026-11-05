CREATE TABLE "должность" (
    "id_должности" SERIAL PRIMARY KEY,
    "наименование_должности" VARCHAR(100) NOT NULL
);
CREATE TABLE "категория" (
    "id_категории" SERIAL PRIMARY KEY,
    "название_категории" VARCHAR(100) NOT NULL
);
CREATE TABLE "основа" (
    "id_основы" SERIAL PRIMARY KEY,
    "название_основы" VARCHAR(100) NOT NULL
);
CREATE TABLE "добавка" (
    "id_добавки" SERIAL PRIMARY KEY,
    "название_добавки" VARCHAR(100) NOT NULL
);
CREATE TABLE "сотрудник" (
    "id_сотрудника" SERIAL PRIMARY KEY,
    "фамилия" VARCHAR(100) NOT NULL,
    "имя" VARCHAR(100) NOT NULL,
    "отчество" VARCHAR(100),
    "id_должности" INT REFERENCES "должность"("id_должности"),
    "телефон" VARCHAR(20)
);
CREATE TABLE "товар" (
    "id_товара" SERIAL PRIMARY KEY,
    "id_категории" INT REFERENCES "категория"("id_категории"),
    "название_товара" VARCHAR(150) NOT NULL,
    "описание" TEXT,
    "id_основы" INT REFERENCES "основа"("id_основы"),
    "id_добавки" INT REFERENCES "добавка"("id_добавки"),
    "стоимость" NUMERIC(10, 2) NOT NULL
);
CREATE TABLE "заказ" (
    "id_заказа" SERIAL PRIMARY KEY,
    "id_сотрудника" INT REFERENCES "сотрудник"("id_сотрудника"),
    "дата_и_время" TIMESTAMP NOT NULL,
    "итоговая_сумма" NUMERIC(10, 2) NOT NULL,
    "количество" INT NOT NULL
);
CREATE TABLE "оформление_заказа" (
    "id_оформления" SERIAL PRIMARY KEY,
    "id_товара" INT REFERENCES "товар"("id_товара"),
    "id_заказа" INT REFERENCES "заказ"("id_заказа")
);

INSERT INTO "должность" ("наименование_должности") VALUES ('Бариста'), ('Менеджер');
INSERT INTO "категория" ("название_категории") VALUES ('Кофе'), ('Чай');
INSERT INTO "сотрудник" ("фамилия", "имя", "id_должности", "телефон") VALUES ('Иванов', 'Иван', 1, '12345');
INSERT INTO "товар" ("id_категории", "название_товара", "стоимость") VALUES (1, 'Латте', 250), (2, 'Зеленый чай', 150);
INSERT INTO "заказ" ("id_сотрудника", "дата_и_время", "итоговая_сумма", "количество") VALUES (1, '2024-05-20 14:30:00', 250, 1);