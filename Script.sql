CREATE TABLE "Жанр" (
	жанр_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	жанр varchar(30) NOT NULL,
	CONSTRAINT жанр_id PRIMARY KEY ("жанр_id")
);


CREATE TABLE исполнитель (
	исполнитель_песни_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"Имя исполнителя" varchar(60) NOT NULL,
	CONSTRAINT исполнитель_песни_id PRIMARY KEY ("исполнитель_песни_id")
);


CREATE TABLE "Исполняемые жанры" (
	исполняемые_жанры_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	жанр int4 NOT NULL,
	исполнитель int4 NOT NULL,
	CONSTRAINT исполняемые_жанры_id PRIMARY KEY ("исполняемые_жанры_id"),
	CONSTRAINT исполняемые_жанры_fk FOREIGN KEY (жанр) REFERENCES public."Жанр"(жанр_id),
	CONSTRAINT исполняемые_жанры_fk_1 FOREIGN KEY (исполнитель) REFERENCES public.исполнитель(исполнитель_песни_id)
);


CREATE TABLE альбом (
	альбом_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"название альбома" varchar(60) NULL,
	"год выпуска" date NOT NULL,
	CONSTRAINT альбом_id PRIMARY KEY ("альбом_id")
);


CREATE TABLE "Альбомы исполнителей" (
	альбомы_исполнителей_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	исполнитель int4 NOT NULL,
	альбом int4 NOT NULL,
	CONSTRAINT альбомы_исполнителей_id PRIMARY KEY ("альбомы_исполнителей_id"),
	CONSTRAINT альбомы_исполнителей_fk FOREIGN KEY (альбом) REFERENCES альбом(альбом_id),
	CONSTRAINT альбомы_исполнителей_fk_1 FOREIGN KEY (исполнитель) REFERENCES исполнитель(исполнитель_песни_id)
);


CREATE TABLE трек (
	трек_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"год выпуска" date NOT NULL,
	"название трека" varchar(60) NOT NULL,
	альбом int4 NOT NULL,
	CONSTRAINT трек_id PRIMARY KEY ("трек_id"),
	CONSTRAINT трек_fk FOREIGN KEY (альбом) REFERENCES альбом(альбом_id)
);


CREATE TABLE сборник (
	сборник_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"название сборника" varchar(60) NOT NULL,
	"дата выхода" date NOT NULL,
	CONSTRAINT сборник_id PRIMARY KEY ("сборник_id")
);


CREATE TABLE "Сборник треков" (
	сборник_треков_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	трек int4 NOT NULL,
	сборник int4 NOT NULL,
	CONSTRAINT сборник_треков_id PRIMARY KEY ("сборник_треков_id"),
	CONSTRAINT сборник_треков_fk FOREIGN KEY (трек) REFERENCES трек(трек_id),
	CONSTRAINT сборник_треков_fk_1 FOREIGN KEY (сборник) REFERENCES сборник(сборник_id)
);
