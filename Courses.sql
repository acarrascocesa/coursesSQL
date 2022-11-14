-- Utilize la pagina de ED TEAM como ejemplo

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level" varchar,
  "teacher" varchar
);

CREATE TABLE "courses_categories" (
  "id" uuid,
  "course_id" uuid,
  "category_id" integer
);

CREATE TABLE "user_courses" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "users_roles" (
  "id" uuid,
  "user_id" uuid,
  "role_id" integer
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar
);

CREATE TABLE "videos_url" (
  "id" uuid,
  "course_id" uuid,
  "videos_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "user_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "videos_url" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "videos_url" ADD FOREIGN KEY ("videos_id") REFERENCES "courses_videos" ("id");

-- Intrucciones para introducir los datos en cada tabla
insert into users (
id, 
name, 
email, 
"password", 
age
) values (
'5f43941a-192a-4647-aeb4-e49e89829037', 
'Angel', 
'acarrascocesa@gmail.com', 
'estudiante1', 
34
);

insert into users (
id, 
name, 
email, 
"password", 
age
) values (
'e7f03447-9b0d-4fa9-86e6-d3676734415e', 
'Aurea', 
'aureaterrero@gmail.com', 
'estudiante2', 
33
);

insert into courses (
id, 
title, 
description, 
"level", 
teacher
) values (
'1e54b35c-15fa-40c7-8491-4d1d82501630', 
'Python desde 0', 
'Curso de Python desde 0 hasta nivel avanzado.', 
'Principiante', 
'Juan Perez'
);

insert into courses (
id, 
title, 
description, 
"level", 
teacher
) values (
'05f3518d-4779-412b-a1f6-5e06595f6f01', 
'Typescript desde 0', 
'Domina el lenguaje que te da más control sobre tu código JavaScript a través de tipado estático, clases y programación orientada a objetos.', 
'Intermedio', 
'Diego Barra'
);

insert into categories (id, name) values ('247', 'Programacion')

insert into courses_categories (id, course_id, category_id) values ('9b503cc8-95a8-43ab-a6b1-cf49eb0a6d46', '1e54b35c-15fa-40c7-8491-4d1d82501630', '247')
insert into courses_categories (id, course_id, category_id) values ('49193893-9335-4b2f-9b3a-46de6f98f4d0', '05f3518d-4779-412b-a1f6-5e06595f6f01', '247')


insert into roles (id, "name") values ('01', 'Estudiante')
insert into roles (id, "name") values ('02', 'Profesor')

insert into users_roles (id, user_id, role_id) values ('620862c5-9e36-470f-955c-23697d2116ea', '5f43941a-192a-4647-aeb4-e49e89829037', '01')
insert into users_roles (id, user_id, role_id) values ('4512c179-2b6d-4a6e-ac87-96f308949cda', 'e7f03447-9b0d-4fa9-86e6-d3676734415e', '01')

insert into courses_videos (id, title, url) values ('5047a840-4dde-424a-b6c8-df54b610cc87', 'Video Python', 'https://app.ed.team/cursos/python/01/01')
insert into courses_videos (id, title, url) values ('4ee55b2a-8875-4e96-bb09-3d57d9fccf41', 'Video Typescript', 'https://app.ed.team/cursos/typescript/01/01')

insert into videos_url (id, course_id, videos_id) values ('76b9f406-d8f9-43da-96e5-26ab5482e67f', '1e54b35c-15fa-40c7-8491-4d1d82501630', '5047a840-4dde-424a-b6c8-df54b610cc87')
insert into videos_url (id, course_id, videos_id) values ('708c8291-f889-4adb-806f-b2b57f9e7178', '05f3518d-4779-412b-a1f6-5e06595f6f01', '4ee55b2a-8875-4e96-bb09-3d57d9fccf41')



