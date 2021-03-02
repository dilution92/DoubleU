
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
  member_mid VARCHAR2(20),
  email_address VARCHAR2(200),
  email_name VARCHAR2(100),
  email_title VARCHAR2(300),
  email_date timestamp,
  email_contents CLOB,
  email_mailbox NUMBER DEFAULT 3,
  email_chk CHAR(4),
  email_delete NUMBER DEFAULT 0,

CONSTRAINT email_main_pk PRIMARY KEY (email_no)
CONSTRAINT email_main_fk FOREIGN KEY (member_no) REFERENCES member (member_no)

);

CREATE TABLE email_receiver 
(
    email_rev_no NUMBER,
    email_no NUMBER,
    email_rev_name VARCHAR2(100),
    email_rev_address VARCHAR2(500),
    email_rev_department VARCHAR2(100),
    email_ref NUMBER,
    email_mid VARCHAR2(200),

    CONSTRAINT email_rev_pk PRIMARY KEY (email_rev_no),
    CONSTRAINT email_rev_fk FOREIGN KEY (email_no) REFERENCES email (email_no)
);

CREATE TABLE email_files
(
	files_no NUMBER,
	email_no NUMBER,
	file_sysfile VARCHAR2(4000),
	file_orifile VARCHAR2(4000),

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
    'gamcho@gmail.com', 
    '송연주', 
    '안녕하세요 프론트 작업 중입니다.', 
    systempsdate, 
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
VALUES(emailMainSeq(), email_main_seq.currval, 'angel@@gmail.com', 0)
VALUES(emailMainSeq(), email_main_seq.currval, 'boss@@gmail.com', 0)
VALUES(emailMainSeq(), email_main_seq.currval, 'heerock@gmail.com', 0)
VALUES(emailMainSeq(), email_main_seq.currval, 'carrot@gmail.com', 1)
VALUES(emailMainSeq(), email_main_seq.currval, 'yellll@gmail.com', 1)

-- 파일
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')



SELECT * FROM dual;

 */



-- 시퀀스 함수
CREATE OR REPLACE FUNCTION emailMainSeq 
RETURN NUMBER 
IS
    seq NUMBER;
BEGIN
    SELECT EMAIL_MAIN_SEQ.nextval INTO seq FROM dual;
    RETURN seq;
END;

commit;
