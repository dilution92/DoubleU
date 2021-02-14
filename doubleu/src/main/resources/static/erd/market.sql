
/* Drop Indexes */

DROP INDEX repl_seq;



/* Drop Tables */

DROP TABLE market_dib CASCADE CONSTRAINTS;
DROP TABLE market_files CASCADE CONSTRAINTS;
DROP TABLE market_repl CASCADE CONSTRAINTS;
DROP TABLE market CASCADE CONSTRAINTS;
DROP TABLE market_category CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE market
(
	market_no number NOT NULL,
	category_no number NOT NULL,
	members_no varchar2(20) NOT NULL,
	market_subject varchar2(20) NOT NULL,
	market_price number NOT NULL,
	market_account varchar2(20) NOT NULL,
	market_doc varchar2(1000) NOT NULL,
	market_hit number NOT NULL,
	market_date varchar2(20) NOT NULL,
	market_photo varchar2(1000),
	PRIMARY KEY (market_no)
);


CREATE TABLE market_category
(
	category_no number NOT NULL,
	category_name varchar2(20) NOT NULL,
	PRIMARY KEY (category_no)
);


CREATE TABLE market_dib
(
	dib_no number NOT NULL,
	market_no number NOT NULL,
	members_no varchar2(20) NOT NULL,
	PRIMARY KEY (dib_no)
);


CREATE TABLE market_files
(
	files_no number NOT NULL,
	market_no number,
	files_sysfile varchar2(1000),
	files_orifile varchar2(1000),
	PRIMARY KEY (files_no)
);


CREATE TABLE market_repl
(
	repl_no number NOT NULL,
	market_no number,
	members_no varchar2(20) NOT NULL,
	repl_doc number,
	repl_date varchar2(20),
	PRIMARY KEY (repl_no)
);


CREATE TABLE members
(
	members_no varchar2(20) NOT NULL,
	PRIMARY KEY (members_no)
);



/* Create Foreign Keys */

ALTER TABLE market_dib
	ADD FOREIGN KEY (market_no)
	REFERENCES market (market_no)
;


ALTER TABLE market_files
	ADD FOREIGN KEY (market_no)
	REFERENCES market (market_no)
;


ALTER TABLE market_repl
	ADD FOREIGN KEY (market_no)
	REFERENCES market (market_no)
;


ALTER TABLE market
	ADD FOREIGN KEY (category_no)
	REFERENCES market_category (category_no)
;


ALTER TABLE market
	ADD FOREIGN KEY (members_no)
	REFERENCES members (members_no)
;


ALTER TABLE market_dib
	ADD FOREIGN KEY (members_no)
	REFERENCES members (members_no)
;


ALTER TABLE market_repl
	ADD FOREIGN KEY (members_no)
	REFERENCES members (members_no)
;



/* Create Indexes */

CREATE INDEX repl_seq ON market_repl USING BTREE (repl_no);



