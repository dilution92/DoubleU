
/* Drop Tables */

DROP TABLE approval_decision_makers CASCADE CONSTRAINTS;
DROP TABLE approval_files CASCADE CONSTRAINTS;
DROP TABLE approval_form_petition CASCADE CONSTRAINTS;
DROP TABLE approval_form_vacation CASCADE CONSTRAINTS;
DROP TABLE approval_form CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE approval_decision_makers
(
	member_no number NOT NULL,
	form_no number NOT NULL,
	maker_name varchar2(50) NOT NULL,
	maker_position varchar2(100) NOT NULL,
	decision_state varchar2(50) NOT NULL,
	maker_comment nvarchar2(2000),
	maker_order number NOT NULL,
	PRIMARY KEY (member_no)
);


CREATE TABLE approval_files
(
	files_no number NOT NULL,
	form_no number NOT NULL,
	file_sysfile varchar2(2000),
	file_orifile varchar2(2000) NOT NULL,
	PRIMARY KEY (files_no)
);


CREATE TABLE approval_form
(
	form_no number NOT NULL,
	member_no number NOT NULL,
	drafter_name varchar2(100) NOT NULL,
	form_date date NOT NULL,
	drafter_department varchar2(100) NOT NULL,
	form_title varchar2(1000),
	form_doc varchar2(2000),
	form_type varchar2(100) NOT NULL,
	cooperation_department varchar2(100),
	event_date date,
	drafter_position varchar2(50) NOT NULL,
	approval_state varchar2(100) NOT NULL,
	modify_date timestamp,
	PRIMARY KEY (form_no)
);


CREATE TABLE approval_form_petition
(
	form_no number NOT NULL,
	form_purpose varchar2(200),
	budget number,
	PRIMARY KEY (form_no)
);


CREATE TABLE approval_form_vacation
(
	form_no number NOT NULL,
	start_date date,
	end_date date,
	vacation_cnt number,
	vacation_type varchar2(2000),
	half_day_type varchar2(50),
	PRIMARY KEY (form_no)
);



/* Create Foreign Keys */

ALTER TABLE approval_decision_makers
	ADD FOREIGN KEY (form_no)
	REFERENCES approval_form (form_no)
;


ALTER TABLE approval_files
	ADD FOREIGN KEY (form_no)
	REFERENCES approval_form (form_no)
;


ALTER TABLE approval_form_petition
	ADD FOREIGN KEY (form_no)
	REFERENCES approval_form (form_no)
;


ALTER TABLE approval_form_vacation
	ADD FOREIGN KEY (form_no)
	REFERENCES approval_form (form_no)
;



CREATE SEQUENCE seq_approval_form;
CREATE SEQUENCE seq_approval_decision_makers;
CREATE SEQUENCE seq_approval_files;

-- 첨부파일 함수
--create or replace FUNCTION getApprovalAttSeq
--RETURN number
--IS
--    seq NUMBER;
--BEGIN
--    SELECT seq_approval_files.nextval into seq FROM dual;
--    RETURN seq;
--END;

-- 결재권자 함수
--create or replace FUNCTION getApprovalADMSeq
--RETURN number
--IS
--    seq NUMBER;
--BEGIN
--    SELECT seq_approval_decision_makers.nextval into seq FROM dual;
--    RETURN seq;
--END;
