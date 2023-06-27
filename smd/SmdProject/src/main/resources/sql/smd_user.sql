
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