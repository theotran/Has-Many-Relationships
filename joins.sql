-- \i scripts/blog_data.sql (to insert)
--run this file with \i joins.sql



\c has_many_blogs;

--1
--SELECT * FROM users;

-- --2
-- SELECT * FROM posts
-- WHERE user_id = 100;

-- --3   posts.* means (show me all columns of the posts table)
-- SELECT  posts.*, users.first_name, users.last_name 
-- FROM posts 
-- INNER JOIN users ON (posts.user_id = users.id)
-- WHERE posts.user_id = 200;

-- --4
-- SELECT posts.*, users.username 
-- FROM posts 
-- INNER JOIN users ON (posts.user_id = users.id)
-- WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- --5
-- SELECT users.username 
-- FROM users
-- WHERE users.created_at > '2015-01-01';

-- --6 
-- SELECT posts.title, posts.content, users.username
-- FROM posts 
-- INNER JOIN users ON (posts.user_id = users.id)
-- WHERE users.created_at < '2015-01-01';

-- --7
-- SELECT comments.*, posts.title AS "post title"
-- FROM comments INNER JOIN posts ON (posts.id = comments.post_id);

-- --8 
-- SELECT comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments INNER JOIN posts ON (posts.id = comments.post_id)
-- WHERE posts.created_at < '2015-01-01';

-- --9
-- SELECT comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments INNER JOIN posts ON (posts.id = comments.post_id)
-- WHERE posts.created_at > '2015-01-01';

-- --10
-- SELECT comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments 
-- INNER JOIN posts ON (posts.id = comments.post_id)
-- WHERE comments.body LIKE '%USB%';

-- --11
-- SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
-- FROM comments
-- INNER JOIN posts ON (comments.post_id = posts.id)
-- INNER JOIN users ON (comments.user_id = users.id)
-- WHERE comments.body LIKE '%matrix%';

-- --12 
-- SELECT users.first_name, users.last_name, comments.body AS comment_body
-- FROM comments
-- INNER JOIN posts ON (comments.post_id = posts.id)
-- INNER JOIN users ON (comments.user_id = users.id)
-- WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

-- --13 
-- SELECT users.first_name AS "post author first name", users.last_name AS "post author last name",
-- posts.title AS "post title", users.username AS "comment author username", comments.body AS "comment body"
-- FROM comments
-- INNER JOIN posts ON (comments.post_id = posts.id)
-- INNER JOIN users ON (comments.user_id = users.id) 
-- WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';

--ADDITIONAL QUERIES
--1 
SELECT posts.id, posts.title, posts.user_id 
FROM posts
INNER JOIN comments ON (posts.id = comments.post_id)
INNER JOIN users ON (users.id = posts.user_id)
WHERE posts.user_id = comments.user_id;







--https://github.com/theotran/Has-Many-Relationships
