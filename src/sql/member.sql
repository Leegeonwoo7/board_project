CREATE DATABASE board_project;

USE board_project;

CREATE TABLE member(
       id VARCHAR(50) PRIMARY KEY,
       name VARCHAR(20) NOT NULL,
       password VARCHAR(50) NOT NULL,
       gender VARCHAR(50),
       email VARCHAR(50),
       email_addr VARCHAR(50),
       phone VARCHAR(15) NOT NULL,
       address_code VARCHAR(50),
       address_address VARCHAR(50),
       address_address_detail VARCHAR(50)
);
ALTER table member add column logtime date;
insert into member (id, name, password, gender, email, email_addr, phone, address_code, address_address,address_address_detail)
values ('sky8713','이건우', 'rjsdn123', '1', 'tldysqldys', 'naver.com', '01042313323', null, null, null);