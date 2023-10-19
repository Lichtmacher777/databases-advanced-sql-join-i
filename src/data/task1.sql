CREATE TABLE mentor (
    id serial PRIMARY KEY,
    name varchar(25),
    city varchar(25)
);

CREATE TABLE student (
    id serial PRIMARY KEY,
    name varchar(25),
    city varchar(25),
    mentor_id integer,
    FOREIGN KEY (mentor_id) REFERENCES mentor(id)
);

INSERT INTO mentor(id, name, city) VALUES
    (1, 'Peter Smith', 'New York'),
    (2, 'Laura Wild', 'Chicago'),
    (3, 'Julius Maxim', 'Berlin'),
    (4, 'Melinda O''Connor', 'Berlin'),
    (5, 'Patricia Boulard', 'Marseille'),
    (6, 'Julia Vila', 'Barcelona'),
    (7, 'Fabienne Martin', 'Paris');

INSERT INTO student(id, name, city, mentor_id) VALUES
    (1, 'Dolores Perez', 'Barcelona', 2),
    (2, 'Maria Highsmith', 'New York', 3),
    (3, 'Aimaar Abdul', 'Chicago', 1),
    (4, 'Gudrun Schmidt', 'Berlin', 5),
    (5, 'Gerald Hutticher', 'Berlin', 6),
    (6, 'Itzi Elizabal', 'Barcelona', 4),
    (7, 'Irmgard Seekircher', 'Berlin', 7),
    (8, 'Christian Blanc', 'Paris', 4),
    (9, 'Alex Anjou', 'Paris', 3),
    (10, 'John Goldwin', 'Chicago', 6);
