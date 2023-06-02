-- Active: 1685390521787@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);
-- DROP TABLE users;

INSERT INTO users (id, name, email, password, role)
VALUES
	('u001', 'labov', 'labov@email.com', '$2a$12$fM9Oy1gZJpsMMxnKitmn8.ybo.SSrpI9L4dCeRiTfMDyElIJN62wq
', 'NORMAL'),
	('u002', 'chomsky', 'chomsky@email.com', '$2a$12$p1G./H/oekZ7hk161neID.RHmuY0wnY7RNFg5tFrZeOPhzxz77vnW
', 'NORMAL'),
	('u003', 'saussure', 'saussure@email.com', '$2a$12$YFMjqF8TyOjMEDW6SctcX.XvA/NKHI65EtjLptDraA3uesc9kkEF.
', 'ADMIN');

-- usuario123

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT UNIQUE NOT NULL,
    content TEXT UNIQUE NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL, 
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


INSERT INTO posts (id, creator_id, content)
VALUES
('p001', 'u001', 'Primeiro post!'),
('p002', 'u002', 'Segundo post!');


CREATE TABLE likes_dislikes (
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);



