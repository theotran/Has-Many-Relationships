--psql has_many_blogs, \i has_many_blogs.sql

--\c to connect, then SELECT * from users, posts, etc

CREATE USER has_many_user;

CREATE DATABASE has_many_blogs OWNER has_many_user;

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  --SERIAL MEANS AUTO INCREMENTING
  id serial PRIMARY KEY   NOT NULL,
  username  CHAR (90)     NOT NULL,
  first_name CHAR (90)    NULL,
  last_name  CHAR (90)    NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);
--created_at and updated_at were not needed since they had defined 'DEFAULT' values
--INSERT INTO users (username, first_name, last_name)
--VALUES ( 'theotran', 'Theo', 'Tran');


CREATE TABLE posts (
  id serial PRIMARY KEY                NOT NULL,
  title CHAR (180)                     NULL,
  url   CHAR (510)                     NULL,
  content TEXT                         NULL,
  created_at timestamp with time zone  NOT NULL DEFAULT now(),
  updated_at timestamp with time zone  NOT NULL DEFAULT now(), 
  --foreign key is user_id references users (id)
  user_id Int REFERENCES users (id)
);
--single quotes for values, double quotes for system references (column name, table name)
--INSERT INTO posts (title, url, content)
--VALUES ('Range day', 'www.2ahawaii.com', 'Hey man wanna go shoot today?');


CREATE TABLE comments (
  id serial PRIMARY KEY                 NOT NULL,
  body CHAR (510)                       NULL DEFAULT NULL,
  created_at timestamp with time zone   NOT NULL DEFAULT now(),
  updated_at timestamp with time zone   NOT NULL DEFAULT now(),
  user_id Int REFERENCES users (id),
  post_id Int REFERENCES posts (id)
)




