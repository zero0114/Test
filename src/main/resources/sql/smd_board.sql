
-- 게시판 테이블 생성
CREATE TABLE smd_board (
	board_no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	content TEXT NULL,
	writer VARCHAR(50) NOT NULL,
	p_name VARCHAR(50) NOT NULL DEFAULT 'none',
	p_make VARCHAR(50) NOT NULL DEFAULT 'none',
	p_price INT DEFAULT 0,
	reg_date TIMESTAMP DEFAULT NOW(),
	view_cnt INT DEFAULT 0
);

ALTER TABLE smd_board ADD COLUMN Image_file_name varchar(100) DEFAULT 'none';
ALTER TABLE smd_board DROP COLUMN p_price;

select * from smd_board;