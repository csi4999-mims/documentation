CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    password VARCHAR(255),
    email VARCHAR(128),
    phone VARCHAR(15),
    role VARCHAR (20),
    created DATETIME DEFAULT NULL,
    modified DATETIME DEFAULT NULL,
    status tinyint(1) NOT NULL,
    PRIMARY KEY(id));
