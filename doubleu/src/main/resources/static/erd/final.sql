

/* Create Tables */

CREATE TABLE approval_decision_makers
(
	employee_no number NOT NULL,
	form_no number NOT NULL,
	maker_name varchar2(50) NOT NULL,
	maker_position varchar2(100) NOT NULL,
	decision_state varchar2(50),
	PRIMARY KEY (employee_no)
);


CREATE TABLE approval_files
(
	files_no number NOT NULL,
	form_no number NOT NULL,
	file_sysfile varchar2(2000) NOT NULL,
	file_orifile varchar2(2000) NOT NULL,
	PRIMARY KEY (files_no)
);


CREATE TABLE approval_form
(
	form_no number NOT NULL,
	drafter_name varchar2(100) NOT NULL,
	form_date date NOT NULL,
	drafter_department varchar2(100) NOT NULL,
	form_title varchar2(1000) NOT NULL,
	form_doc varchar2(2000) NOT NULL,
	form_type varchar2(100) NOT NULL,
	cooperation_department varchar2(100),
	event_date date,
	drafter_position varchar2(50),
	PRIMARY KEY (form_no)
);


CREATE TABLE approval_form_petition
(
	form_no number NOT NULL,
	form_purpose varchar2(200) NOT NULL,
	budget number NOT NULL,
	PRIMARY KEY (form_no)
);


CREATE TABLE approval_form_vacation
(
	form_no number NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	vacation_cnt number NOT NULL,
	vacation_type varchar2(2000),
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



