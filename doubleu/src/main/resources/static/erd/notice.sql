drop table Notice;
drop SEQUENCE seq_Notice_no;
drop table notice_files;

create table Notice(
    Notice_no NUMBER,
    Notice_subject NVARCHAR2(200),
    Notice_mid NVARCHAR2(50),
    Notice_reportingDate DATE,
    Notice_postType NVARCHAR2(20),
    Notice_postStartDate NVARCHAR2(50),
    Notice_postEndDate NVARCHAR2(50),
    Notice_type NVARCHAR2(20),
    Notice_hit NUMBER,
    Notice_doc NVARCHAR2(2000),
    Notice_file NVARCHAR2(800)
);

create SEQUENCE seq_Notice_no;

insert into Notice
values(seq_Notice_no.nextval, '이달의 우수사원', '관리자', '21/01/04','영구', null, null, '일반공지', '1', 
'이달의 우수사원으로 선정되심을 축하드립니다.'||CHR(10)||CHR(13)||'1. 관리부 인사관리팀 김재현 팀장'||CHR(10)||CHR(13)||'2. IT기술부 유지보수팀 정해준 팀장', null);

create table notice_files
(
   notice_files_no NUMBER,
   notice_no NUMBER,
   file_sysfile VARCHAR2(1000),
   file_orifile VARCHAR2(1000)
);

create SEQUENCE seq_notice_files_no;

select * from Familyevent;
select * from familyevent_files;
select * from notice;
select * from notice_files;

commit;

-------------------------------------------------- familyevent

drop table familyevent;
drop SEQUENCE seq_familyeventNo;
drop table familyevent_files;

create table Familyevent(
    familyeventNo NUMBER,
    familyeventSubject NVARCHAR2(200),
    familyeventMid NVARCHAR2(50),
    familyeventReportingDate DATE,
    familyeventType NVARCHAR2(20),
    familyeventHit NUMBER,
    familyeventDoc NVARCHAR2(2000),
    familyeventFile NVARCHAR2(800)
);

create SEQUENCE seq_familyeventNo;

CREATE TABLE familyevent_files
(
   files_no NUMBER,
   familyevent_no NUMBER,
   file_sysfile VARCHAR2(1000),
   file_orifile VARCHAR2(1000)
);

insert into familyevent
values(seq_familyeventNo.nextval, '유지보수팀 이진환 사원 결혼', '관리자', '21/01/04', '결혼', '1', 
'- 일   시 : 2021. 2. 6.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 평택 T웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 유지보수팀 이진환 사원 01012378759', null);
insert into familyevent
values(seq_familyeventNo.nextval, '영업지원팀 김예린 사원 결혼', '관리자', '21/01/04', '결혼', '1', 
'- 일   시 : 2021. 2. 13.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 수원 w웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 영업지원팀 김예린 사원 01078456459', null);
insert into familyevent
values(seq_familyeventNo.nextval, '영업1팀 배한비 사원 결혼', '관리자', '21/01/05', '결혼', '1', 
'- 일   시 : 2021. 2. 20.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 서울 j웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 영업1팀 배한비 사원 01076674459', null);
insert into familyevent
values(seq_familyeventNo.nextval, '영업2팀 최윤서 사원 결혼', '관리자', '21/01/05', '결혼', '1', 
'- 일   시 : 2021. 2. 20.(토) 13:00'||CHR(10)||CHR(13)||'- 장   소 : 서울 w웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 영업2팀 최윤서 사원 01078774459', null);
insert into familyevent
values(seq_familyeventNo.nextval, '인사관리팀 서진솔 사원 결혼', '관리자', '21/01/05', '결혼', '1', 
'- 일   시 : 2021. 2. 27.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 평택 T웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 인사관리팀 서진솔 사원 01078884459', null);
insert into familyevent
values(seq_familyeventNo.nextval, '영업1팀 김코딩 사원 빙부상', '관리자', '21/01/07', '부고', '1', 
'- 별   세 : 2021. 1. 6.(수)'||CHR(10)||CHR(13)||'- 빈   소 : 서울 강동성심병원 장례식장 지하2층 2호실'||CHR(10)||CHR(13)||'- 발   인 : 2021. 1. 8.(금)'||CHR(10)||CHR(13)||'- 연락처 : 영업1팀 김코딩 사원 01041235123', null);
insert into familyevent
values(seq_familyeventNo.nextval, '경영지원팀 신한수 사원 결혼', '관리자', '21/01/14', '결혼', '1', 
'- 일   시 : 2021. 2. 28.(일) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 서울 K웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 경영지원팀 신한수 사원 01012145631', null);
insert into familyevent
values(seq_familyeventNo.nextval, '경영지원팀 남경현 사원 결혼', '관리자', '21/02/05', '결혼', '1', 
'- 일   시 : 2021. 3. 1.(월) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 아만티 호텔 서울 2층, 아만티홀'||CHR(10)||CHR(13)||'- 연락처 : 경영지원팀 남경현 사원 01078784459', null);
insert into familyevent
values(seq_familyeventNo.nextval, '개발팀 김석찬 사원 결혼', '관리자', '21/02/05', '결혼', '1', 
'- 일   시 : 2021. 2. 13.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 웨딩시그니처'||CHR(10)||CHR(13)||'- 연락처 : 개발팀 김석찬 사원 01012787459', null);
insert into familyevent
values(seq_familyeventNo.nextval, '개발팀 이재영 사원 결혼', '관리자', '21/02/15', '결혼', '1', 
'- 일   시 : 2021. 2. 20.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 더뉴컨벤션웨딩 1층 르노브 (강서구 공항대로36길 57)'||CHR(10)||CHR(13)||'- 연락처 : 개발팀 이재영 사원 01012374459', null);
insert into familyevent
values(seq_familyeventNo.nextval, '영업지원팀 남혜지 사원 결혼', '관리자', '21/02/15', '결혼', '1', 
'- 일   시 : 2021. 2. 21.(일) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 아만티 호텔 부산 3층, 아만티홀'||CHR(10)||CHR(13)||'- 연락처 : 영업지원팀 남혜지 사원 01078785159', null);
insert into familyevent
values(seq_familyeventNo.nextval, '경영지원팀 이상학 사원 결혼', '관리자', '21/02/17', '결혼', '1', 
'- 일   시 : 2021. 2. 27.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 강남 웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 경영지원팀 이상학 사원 01012789789', null);
insert into familyevent
values(seq_familyeventNo.nextval, '경영지원팀 김송희 사원 결혼', '관리자', '21/02/24', '결혼', '1', 
'- 일   시 : 2021. 3. 6.(토) 11:00'||CHR(10)||CHR(13)||'- 장   소 : 신도림 웨딩홀'||CHR(10)||CHR(13)||'- 연락처 : 경영지원팀 김송희 사원 01012348989', null);