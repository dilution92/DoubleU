drop table Notice;
drop SEQUENCE seq_Notice_no;
drop table notice_files;
drop SEQUENCE seq_notice_files_no;

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

create table notice_files
(
   notice_files_no NUMBER,
   notice_no NUMBER,
   file_sysfile VARCHAR2(1000),
   file_orifile VARCHAR2(1000)
);

create SEQUENCE seq_notice_files_no;

insert into Notice
values(seq_Notice_no.nextval, '이달의 우수사원(1월)', '관리자', '21/01/04','설정', '2021-01-04', '2021-01-31', '중요공지', '26', 
'이달의 우수사원으로 선정되심을 축하드립니다.'||CHR(10)||CHR(13)||'1. IT개발부 개발팀 송연주 사원'||CHR(10)||CHR(13)||'2. 관리부 경영지원팀 강성연 팀장', null);

insert into Notice
values(seq_Notice_no.nextval, '코로나바이러스 감염증 예방수칙 안내', '관리자', '21/01/04','영구', null, null, '중요공지', '78', 
'정확한 정보를 파악하고 적절한 예방 조치를 취하여 스스로와 주변 사람을 보호하세요. 현지 보건 당국의 지시를 따르세요.'||CHR(10)||CHR(13)||'코로나19 전염을 막는 방법은 다음과 같습니다.'||CHR(10)||CHR(13)||
'1. 손을 자주 씻으세요. 비누와 물 또는 알코올 성분의 손 세정제를 사용하세요.'||CHR(10)||CHR(13)||'기침 또는 재채기하는 사람으로부터 안전한 거리를 유지하세요.'||CHR(10)||CHR(13)||
'물리적 거리두기가 불가능할 땐 마스크를 쓰세요.'||CHR(10)||CHR(13)||'눈, 코 또는 입을 만지지 마세요.'||CHR(10)||CHR(13)||'기침 또는 재채기를 할 때는 화장지를 이용하거나 팔꿈치를 구부려 코와 입을 가리세요.'
||CHR(10)||CHR(13)||'몸이 좋지 않다면 집에서 쉬세요.'||CHR(10)||CHR(13)||'열, 기침, 호흡 곤란 증상이 있다면 의사의 진료를 받아야 합니다.'||CHR(10)||CHR(13)||
'미리 연락하면 의료진이 신속하게 적절한 의료기관으로 연결해 드릴 수 있습니다. 본인을 보호하고 바이러스 확산과 그 밖의 감염을 방지하기 위한 조치입니다.'||CHR(10)||CHR(13)||
'1. 손을 자주 씻으세요. 비누와 물 또는 알코올 성분의 손 세정제를 사용하세요.', null);

insert into Notice
values(seq_Notice_no.nextval, '직장내 괴롭힘 금지 안내', '관리자', '21/01/08','영구', null, null, '일반공지', '12', 
'금일 1월 8일 부터 직장내 괴롭힘 금지법이 시행될 예정입니다.'||CHR(10)||CHR(13)||
'이에 따라 직장내 괴롭힘의 판단기준 및 사례등을 담은 예방교육자료 및 고용노동부 에서 제공하는 직장내 괴롭힘 예방 및 대응 메뉴얼을 배포하오니 참고하시기 바랍니다.', '직장내괴롭힘판단및예방대응메뉴얼.pdf');

insert into Notice
values(seq_Notice_no.nextval, '인사발령', '관리자', '21/01/11','설정', '2021-01-11', '2021-01-22', '중요공지', '25', 
'직원 인사발령을 다음과 같이 알려드립니다.'||CHR(10)||CHR(13)||'- 정희석 : 영업부 영업1팀 대리 -> 영업부 영업1팀 팀장', null);

insert into Notice
values(seq_Notice_no.nextval, '창립기념일 휴무 안내(1월 15일 금)', '관리자', '21/01/12','영구', null, null, '일반공지', '43', 
'휴무 안내'||CHR(10)||CHR(13)||'당사 창립기념일로 인하여 1월 15일 금요일 휴무 안내드립니다.'||CHR(10)||CHR(13)||'감사합니다.', null);

insert into Notice
values(seq_Notice_no.nextval, '주말 사내 대청소 공지', '관리자', '21/01/29','영구', null, null, '일반공지', '46', 
'2월의 첫 시작을 상쾌하게 보내기 위해 금주 주말 사내 대청소를 안내드립니다^^!'||CHR(10)||CHR(13)||'모두 빠짐없이 참석바랍니다.'||CHR(10)||CHR(13)||'한명도 빠짐없이~~~~~', null);

insert into Notice
values(seq_Notice_no.nextval, '이달의 우수사원(2월)', '관리자', '21/02/01','설정', '2021-02-01', '2021-02-28', '중요공지', '52', 
'이달의 우수사원으로 선정되심을 축하드립니다.'||CHR(10)||CHR(13)||'1. IT기술부 유지보수팀 전예린 사원'||CHR(10)||CHR(13)||'2. 영업부 영업1팀 정희석 팀장', null);

insert into Notice
values(seq_Notice_no.nextval, '2021년도 정기 건강검진 안내', '관리자', '21/02/02','영구', null, null, '중요공지', '77', 
'2021년 정기 건강검진 안내'||CHR(10)||CHR(13)||'1. 국민건강보험공단에서 실시하는 (주)DoubleU 소속 직원분들의 건강검진을 다시 한번 안내해드립니다.'
||CHR(10)||CHR(13)||'2. 본사에서 보내드린 건강검진 대상자확인서를 지참하시고 거주지 근처 검진기관을 방문하신 후 검진을 받으시면 됩니다. 2021년 12월까지 검진대상자 전원 실시해야 하며 미실시때는 추후 과태료가 발생 될 수 있음을 알려드립니다.'
||CHR(10)||CHR(13)||'3. 기타 검진실시에 관한 참고사항은 아래와 같으며 다른 궁금한 사항이 있다면 본사로 연락바라겠습니다.'
||CHR(10)||CHR(13)||'◀ 아 래 ▶'
||CHR(10)||CHR(13)||'① 검진전일 - 검진전일 저녁식사는 기름기 없는것으로 가볍게 드시고 저녁 9시 이후에는 금식해주십시오. 검사전일은 음주나 과로를 피하셔야 합니다. (오후1시 이후 검진대상자는 가벼운 아침식사는 가능합니다.)'
||CHR(10)||CHR(13)||'② 검진당일 - 일체 금식(커피, 흡연, 물, 약 등)하시고 예약시간을 준수하여 주십시오'
||CHR(10)||CHR(13)||'※ 검진전에 미리 예약후 방문하시고, 검진기관 안내는 인터넷 (www.nhic.or.kr) 주요메뉴 바로가기를 통해서 안내 받을 수 있습니다.', null);

insert into Notice
values(seq_Notice_no.nextval, '워크샵 일정 공지', '관리자', '21/02/05','설정', '2021-02-05', '2021-02-19', '중요공지', '80', 
'워크샵을 하기와 같이 공지하오니, (주)DoubleU 전 사원븐들은 참고하시기 바랍니다.'
||CHR(10)||CHR(13)||'*********워크샵 공지 ***********'
||CHR(10)||CHR(13)||'일시 : 2021년 2월 18 ~19일 (목, 금)'
||CHR(10)||CHR(13)||'장소 : 경기도 양평'
||CHR(10)||CHR(13)||'출발시간 : 목요일 오전 12시'
||CHR(10)||CHR(13)||'참석자 명단 :  (주)DoubleU 전 직원'
||CHR(10)||CHR(13)||'*******************************', null);

insert into Notice
values(seq_Notice_no.nextval, '이달의 우수사원(3월)', '관리자', '21/03/02','설정', '2021-03-02', '2021-03-31', '중요공지', '23', 
'이달의 우수사원으로 선정되심을 축하드립니다.'||CHR(10)||CHR(13)||'1. 관리부 인사관리팀 김재현 팀장'||CHR(10)||CHR(13)||'2. IT기술부 유지보수팀 정해준 팀장', null);

insert into Notice
values(seq_Notice_no.nextval, 'KH정보교육원 D클래스 수료 안내', '관리자', '21/03/03','설정', '2021-03-01', '2021-03-05', '중요공지', '700', 
'KH정보교육원 D클래스 수강생 여러분 모두들 수료를 축하드립니다.', null);


select * from notice;
select * from notice_files;

commit;

-------------------------------------------------- familyevent

drop table familyevent;
drop SEQUENCE seq_familyeventNo;
drop table familyevent_files;
drop SEQUENCE seq_files_no;

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

CREATE SEQUENCE seq_file_no;

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

select * from Familyevent;
select * from familyevent_files;

commit;