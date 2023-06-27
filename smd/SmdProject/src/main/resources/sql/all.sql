CREATE TABLE smd_board (
	board_no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	content TEXT NULL,
	writer VARCHAR(50) DEFAULT 'none',
	p_name VARCHAR(50) DEFAULT 'none',
	p_make VARCHAR(50) DEFAULT 'none',
	p_price INT DEFAULT 0,
	reg_date TIMESTAMP DEFAULT NOW(),
	view_cnt INT DEFAULT 0
);
ALTER TABLE smd_board MODIFY writer VARCHAR(50) DEFAULT 'none';
ALTER TABLE smd_board drop Image_file_name;
UPDATE smd_board SET title = 'asdf', content = 'gsda', p_name = 'gasd', p_make = 'wgdwg' WHERE board_no = '413';

select * from smd_board;
ALTER TABLE smd_board ADD COLUMN image_file_name varchar(100) DEFAULT 'none';
ALTER TABLE smd_board DROP COLUMN p_price;
create database smd_project;

INSERT INTO smd_board 
		  (title, content, writer, p_name, p_make, image_file_name )
		VALUES ('ad', 'ff', 'dd', 'ss', 'dd', 'asd');

CREATE TABLE smd_user (
	user_no INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(80) UNIQUE NOT NULL,
	pw VARCHAR(80) NOT NULL,
	nick VARCHAR(80) UNIQUE NOT NULL,
	addr VARCHAR(100),
	reg_date TIMESTAMP DEFAULT NOW(),
	session_id VARCHAR(80) NOT NULL DEFAULT 'none',
	limit_time TIMESTAMP
);

INSERT INTO smd_user (email, pw, nick, addr) VALUES ('gsdh23', 'asd', '1sdhsjdsfa', '12af');

select * from smd_user;
SELECT COUNT(*) FROM smd_user WHERE email = '123';
drop table smd_user;

