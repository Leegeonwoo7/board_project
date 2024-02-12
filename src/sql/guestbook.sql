use board_project;
CREATE TABLE guestbook(
    seq INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    email VARCHAR(30),
    homepage VARCHAR(40),
    title VARCHAR(500) NOT NULL ,
    content VARCHAR(4000) NOT NULL ,
    logtime TIMESTAMP DEFAULT NOW()
);