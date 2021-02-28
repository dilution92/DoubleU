
DROP TABLE MEMBER;
DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq NOCACHE;



/* 테이블 생성 */
CREATE TABLE MEMBER(

MEMBER_NO NUMBER,
MEMBER_MID VARCHAR2(50) NOT NULL,
MEMBER_PWD VARCHAR2(200) NOT NULL,
MEMBER_NAME VARCHAR2(50) NOT NULL,
MEMBER_EMAIL VARCHAR2(100) NOT NULL,
MEMBER_DEPARTMENT VARCHAR2(50) NOT NULL,
MEMBER_TEAM VARCHAR2(50) NOT NULL,
MEMBER_PHONENUMBER VARCHAR2(50) NOT NULL,
MEMBER_ZIPCODE VARCHAR2(50) NULL, 
MEMBER_ADDRESS VARCHAR2(200) NOT NULL,
MEMBER_POSITION VARCHAR2(200) NOT NULL,

CONSTRAINT member_pk PRIMARY KEY (MEMBER_NO)
);



/* 데이터 */
INSERT INTO member
VALUES(member_seq.nextval, 'song', '1234', '송연주', 
'songsong08@gmail.com', 'IT기술부', '개발팀', '01012341234', 
'06035', '서울특별시 강남구 가로수길 5 (신사동)', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'kimKoding', '1234', '김코딩', 
'kimKoding@gmail.com', '영업부', '영업팀', '01041235123', 
'06013', '서울 강남구 학동로 지하 102 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'kang', '1234', '강성연', 
'angel@gmail.com', '관리부', '경영지원팀', '01010041004', 
'06089', '서울 영등포구 당산로 1004 ', '팀장');

INSERT INTO member
VALUES(member_seq.nextval, 'kim', '1234', '김재현', 
'bose@gmail.com', '관리부', '인사관리팀', '01011111111', 
'05089', '서울 영등포구 당산로 1003 ', '팀장');

INSERT INTO member
VALUES(member_seq.nextval, 'jeonghs', '1234', '정희석', 
'heerock@gmail.com', '영업부', '영업1팀', '01011112222', 
'04052', '서울 관악구 봉천로 80 ', '팀장');

INSERT INTO member
VALUES(member_seq.nextval, 'jeonghj', '1234', '정해준', 
'carrot@gmail.com', 'IT기술부', '유지보수팀', '01022222222', 
'04222', '서울 구로구 구로동 10 ', '팀장');

INSERT INTO member
VALUES(member_seq.nextval, 'kangms', '1234', '강미선', 
'kangms123@gmail.com', '관리부', '영업지원팀', '01012121212', 
'04332', '서울 구로구 구로동 70 ', '팀장');

INSERT INTO member
VALUES(member_seq.nextval, 'yelll', '1234', '전예린', 
'yellll@gmail.com', 'IT기술부', '유지보수팀', '01033333333', 
'04321', '경기 고양시 일산동구 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'kangmj', '1234', '강미진', 
'mmmmm@gmail.com', 'IT기술부', '유지보수팀', '01033334444', 
'04325', '경기 고양시 일산서구 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'jhjh', '1234', '곽재훈', 
'jhjh@gmail.com', 'IT기술부', '개발팀', '01044445555', 
'04325', '경기 안산시 안산로 77 ', '팀장');

INSERT INTO member
VALUES(member_seq.nextval, 'nhnh', '1234', '김남호', 
'nhnh@gmail.com', 'IT기술부', '개발팀', '01044446666', 
'04785', '경기 안산시 안산로 78 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'mjmj', '1234', '김민재', 
'mjmj@gmail.com', 'IT기술부', '개발팀', '01047777777', 
'04593', '경기 안산시 안산로 90 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'mj1234', '1234', '김민진', 
'mj1212@gmail.com', 'IT기술부', '유지보수팀', '01044456125', 
'05321', '경기 고양시 백석중앙로 80 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'bkbkbk', '1234', '김법규', 
'bkbkbk@gmail.com', 'IT기술부', '유지보수팀', '01044456121', 
'01239', '경기 고양시 백석중앙로 77 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'chan', '1234', '김유찬', 
'chan@gmail.com', 'IT기술부', '유지보수팀', '01045456101', 
'05552', '경기 고양시 백석중앙로 78 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'kyu', '1234', '김은규', 
'kkyu@gmail.com', 'IT기술부', '유지보수팀', '01045454545', 
'05442', '경기 고양시 일산로 80 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'jkjk12', '1234', '김종구', 
'jkjk111@gmail.com', '영업부', '영업2팀', '01078787878', 
'01242', '경기 고양시 중앙로 80 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'park', '1234', '박서우', 
'park12@gmail.com', '영업부', '영업2팀', '01012156433', 
'01898', '서울 강서구 중앙로 80 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'hundred', '1234', '백종웅', 
'hundred12@gmail.com', '영업부', '영업2팀', '01010010011', 
'01005', '서울 강서구 중앙로 89 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'won', '1234', '원치호', 
'won@gmail.com', '영업부', '영업1팀', '01012151111', 
'01878', '서울 강서구 중앙로 77 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'lee', '1234', '이민영', 
'lee@gmail.com', '영업부', '영업1팀', '01011235671', 
'01789', '서울 강동구 중앙로 77 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'jjiii', '1234', '이지현', 
'jjiii@gmail.com', '영업부', '영업1팀', '01012151181', 
'01778', '서울 강동구 중앙로 87 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'hyuk', '1234', '정우혁', 
'hyuk@gmail.com', '영업부', '영업1팀', '01012151333', 
'01838', '서울 강서구 중앙로 99 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'yjyj', '1234', '제윤지', 
'yjyj@gmail.com', '관리부', '인사관리팀', '01012154545', 
'01845', '서울 마포구 중앙로 99 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'jjin', '1234', '차예진', 
'jjiiin@gmail.com', '관리부', '인사관리팀', '01012458845', 
'01890', '서울 마포구 중앙로 79 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'jyjy12', '1234', '최주영', 
'jyjy22@gmail.com', '관리부', '인사관리팀', '01078451233', 
'01745', '서울 마포구 중앙로 88 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'choi', '1234', '최현준', 
'choi@gmail.com', '관리부', '인사관리팀', '01045789645', 
'01885', '서울 중구 중앙로 99 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'hyun', '1234', '한아현', 
'hyun@gmail.com', '관리부', '인사관리팀', '01011111115', 
'01115', '서울 중구 중앙로 11 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'hyun', '1234', '함승우', 
'hyun@gmail.com', '관리부', '경영지원팀', '01011111115', 
'01115', '서울 중구 중앙로 11 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'itpark', '1234', '박원기', 
'itpark@gmail.com', '관리부', '경영지원팀', '01011123415', 
'01166', '서울 중구 중앙로 61 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'shin', '1234', '신한수', 
'shin@gmail.com', '관리부', '경영지원팀', '01012145631', 
'02346', '서울 중구 중앙로 100 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'songhee', '1234', '김송희', 
'heeee@gmail.com', '관리부', '경영지원팀', '01012348989', 
'01897', '서울 중구 중앙로 88 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'sang', '1234', '이상학', 
'sang@gmail.com', '관리부', '경영지원팀', '01012789789', 
'01237', '서울 중구 중앙로 55 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'nam', '1234', '남경현', 
'nam@gmail.com', '관리부', '경영지원팀', '01078784459', 
'01556', '서울 노원구 중앙로 88 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'sol', '1234', '서진솔', 
'sol@gmail.com', '관리부', '인사관리팀', '01078884459', 
'01588', '서울 노원구 중앙로 77 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'ysys', '1234', '최윤서', 
'ysys@gmail.com', '영업부', '영업2팀', '01078774459', 
'03058', '서울 노원구 중앙로 12 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'bae', '1234', '배한비', 
'bae@gmail.com', '영업부', '영업1팀', '01076674459', 
'03668', '서울 노원구 중앙로 66 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'yelin', '1234', '김예린', 
'yelin@gmail.com', '영업부', '영업지원팀', '01078456459', 
'04569', '서울 노원구 중앙로 45 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'hzhz', '1234', '남혜지', 
'hzhz@gmail.com', '영업부', '영업지원', '01078785159', 
'03548', '서울 노원구 중앙로 33 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'young', '1234', '이재영', 
'young@gmail.com', 'IT개발부', '개발팀', '01012374459', 
'01278', '서울 은평 중앙로 12 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'cold', '1234', '김석찬', 
'cold@gmail.com', 'IT개발부', '개발팀', '01012787459', 
'07878', '서울 은평 중앙로 78 ', '사원');

INSERT INTO member
VALUES(member_seq.nextval, 'jhjh11', '1234', '이진환', 
'jhjh11@gmail.com', 'IT개발부', '유지보수팀', '01012378759', 
'01788', '서울 은평 중앙로 10 ', '사원');