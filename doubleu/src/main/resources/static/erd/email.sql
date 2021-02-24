
/* seq */

CREATE SEQUENCE EMAIL_MAIN_SEQ;
CREATE SEQUENCE EMAIL_REV_SEQ;
CREATE SEQUENCE EMAIL_FILES_SEQ;

DROP TABLE email;
DROP TABLE email_receiver;
DROP TABLE email_files;



/* 테이블 생성 및 PK, FK 설정 */

CREATE TABLE email
(
  email_no NUMBER ,
  member_no NUMBER,
  member_mid VARCHAR(20),
  email_address VARCHAR(200),
  email_name VARCHAR(100),
  email_title VARCHAR(300),
  email_date date,
  email_contents CLOB,
  email_mailbox NUMBER DEFAULT 3,
  email_chk CHAR(4),
  email_delete NUMBER DEFAULT 0,

CONSTRAINT email_main_pk PRIMARY KEY (email_no)

);

CREATE TABLE email_receiver 
(
    email_rev_no NUMBER,
    email_no NUMBER,
    email_rev_name VARCHAR(100),
    email_rev_address VARCHAR(500),
    email_rev_department VARCHAR(100),
    email_ref NUMBER,
    email_mid VARCHAR(200),

    CONSTRAINT email_rev_pk PRIMARY KEY (email_rev_no),
    CONSTRAINT email_rev_fk FOREIGN KEY (email_no) REFERENCES email (email_no)
);

CREATE TABLE email_files
(
	files_no NUMBER,
	email_no NUMBER,
	file_sysfile VARCHAR(4000),
	file_orifile VARCHAR(4000),

    CONSTRAINT email_files_pk PRIMARY KEY (files_no),
    CONSTRAINT email_files_fk FOREIGN KEY (email_no) REFERENCES email (email_no)
    
);

select * from email;

 /* 데이터 저장 */

/*

INSERT ALL
INTO email VALUES(
    email_main_seq.nextval,
    1, 
    'song', 
    'song@gmail.com', 
    '송연주', 
    '안녕하세요 프론트 작업 중입니다.', 
    sysdate, 
    '내용', 
    DEFAULT, 
    '', 
    DEFAULT)

-- 받은 사람
INTO email_receiver (
    email_rev_no,
    email_no,
    email_rev_address,
    email_ref
    )
VALUES(emailMainSeq(), email_main_seq.currval, 'song1234@gmail.com', 0)

-- 파일
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')



SELECT * FROM dual;

 */


commit;
