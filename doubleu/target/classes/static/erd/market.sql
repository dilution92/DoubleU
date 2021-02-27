중고시장 DB

/* Create Tables */

CREATE TABLE market
(
	market_no number NOT NULL,
	market_category varchar2(50) NOT NULL,
	market_writer varchar2(50 NOT NULL),
	market_subject varchar2(100) NOT NULL,
	market_price number NOT NULL,
	market_account varchar2(100) NOT NULL,
	market_doc varchar2(1000) NOT NULL,
	market_hit number NOT NULL,
	market_date date NOT NULL,
	market_bank varchar2(50) NOT NULL,
	PRIMARY KEY (market_no)
);





CREATE TABLE market_files
(
	files_no number NOT NULL,
	market_no number,
	files_sysfile varchar2(1000),
	files_orifile varchar2(1000),
	PRIMARY KEY (files_no)
);





/* Create Foreign Keys */

ALTER TABLE market_files
	ADD FOREIGN KEY (market_no)
	REFERENCES market (market_no)
;

/*사진추가함수*/
CREATE OR REPLACE FUNCTION getMarketAttSeq
RETURN NUMBER 
IS
    seq NUMBER;
BEGIN
    SELECT market_seq_SEQ.nextval INTO seq FROM dual;
    RETURN seq;
END;

CREATE SEQUENCE market_seq NOCACHE;



/*market 게시물 샘플데이터*/
insert into market values(market_seq.nextval, '뷰티/미용', '김재현' ,'수분크림', 2000 ,'3561054852535','화장품팔아요',0, '21/01/01', '신한');
insert into market values(market_seq.nextval, '뷰티/미용', '강성연' ,'미스트', 1000 ,'3561054851234','화장품팔아요',0, '21/01/01', '신한');
insert into market values(market_seq.nextval, '뷰티/미용', '송연주' ,'화장솜', 3000 ,'1231054852535','화장솜팔아요',0, '21/01/02', '국민');
insert into market values(market_seq.nextval, '뷰티/미용', '송연주' ,'립스틱', 9000 ,'3561051232535','화장품팔아요',0, '21/01/02', '케이뱅크');
insert into market values(market_seq.nextval, '뷰티/미용', '정해준' ,'선크림', 2000 ,'1234054852535','화장품팔아요',0, '21/01/03', '신한');
insert into market values(market_seq.nextval, '뷰티/미용', '정희석' ,'마스크팩', 3000 ,'35610548234535','화장품팔아요',0, '21/01/04', '국민');

insert into market values(market_seq.nextval, '식품', '김재현' ,'원두', 7000 ,'3561054852335','원두팔아요',0, '21/01/05', '신한');
insert into market values(market_seq.nextval, '식품', '강성연' ,'초코파이2박스', 2000 ,'3561054232535','초코파이2박스 팔아요',0, '21/01/06', '카카오뱅크');
insert into market values(market_seq.nextval, '식품', '전예린' ,'사과', 2000 ,'3561054852535','사과팔아요',0, '21/01/06', '국민');
insert into market values(market_seq.nextval, '식품', '정희석' ,'고디바초콜릿', 2000 ,'3561054852535','고디바초콜릿팔아요',0, '21/01/10', '케이뱅크');
insert into market values(market_seq.nextval, '식품', '정해준' ,'생수', 2000 ,'3561054822535','생수팔아요',0, '21/01/11', '국민');
insert into market values(market_seq.nextval, '식품', '송연주' ,'녹차티백', 2000 ,'3561054823535','녹차티백팔아요',0, '21/01/12', '신한');


insert into market values(market_seq.nextval, '의류', '김재현' ,'니트', 13000 ,'3561054852535','니트팔아요',0, '21/01/13', '신한');
insert into market values(market_seq.nextval, '의류', '강성연' ,'롱스커트', 7000 ,'3561054852535','롱스커트팔아요',0, '21/01/13', '국민');
insert into market values(market_seq.nextval, '의류', '정해준' ,'바람막이', 13000 ,'3561054852535','바람막이팔아요',0, '21/01/14', '농협');
insert into market values(market_seq.nextval, '의류', '정희석' ,'패딩', 25000 ,'3561054852535','패딩팔아요',0, '21/01/14', '신한');
insert into market values(market_seq.nextval, '의류', '전예린' ,'양말', 3000 ,'3561054852535','양말팔아요',0, '21/01/15', '농협');
insert into market values(market_seq.nextval, '의류', '송연주' ,'핸드메이드코트', 12000 ,'3561054852535','핸드메이드코트팔아요',0, '21/01/17', '농협');

insert into market values(market_seq.nextval, '전자제품', '김재현' ,'아이패드', 130000 ,'3561054852535','아이패드팔아요',0, '21/01/18', '신한');
insert into market values(market_seq.nextval, '전자제품', '강성연' ,'갤럭시탭', 70000 ,'3561054852535','갤럭시탭팔아요',0, '21/01/18', '국민');
insert into market values(market_seq.nextval, '전자제품', '정해준' ,'아이폰6s', 300000 ,'3561054852535','아이폰6s팔아요',0, '21/01/19', '농협');
insert into market values(market_seq.nextval, '전자제품', '정희석' ,'스탠드', 15000 ,'3561054852535','스탠드팔아요',0, '21/01/20', '신한');
insert into market values(market_seq.nextval, '전자제품', '전예린' ,'삼성모니터', 20000 ,'3561054852535','삼성모니터팔아요',0, '21/01/21', '농협');
insert into market values(market_seq.nextval, '전자제품', '송연주' ,'키보드', 11000 ,'3561054852535','키보드팔아요',0, '21/01/21', '농협');


insert into market values(market_seq.nextval, '도서/티켓', '김재현' ,'자우림콘서트티켓', 80000 ,'3561054852535','자우림콘서트티켓팔아요',0, '21/01/22', '신한');
insert into market values(market_seq.nextval, '도서/티켓', '강성연' ,'영어단어책', 7000 ,'3561054852535','영어단어책팔아요',0, '21/01/22', '국민');
insert into market values(market_seq.nextval, '도서/티켓', '정해준' ,'중국어회화책', 3000 ,'3561054852535','중국어회화책팔아요',0, '21/01/23', '신한');
insert into market values(market_seq.nextval, '도서/티켓', '정희석' ,'스페인어책', 5000 ,'3561054852535','스페인어책팔아요',0, '21/01/24', '신한');
insert into market values(market_seq.nextval, '도서/티켓', '전예린' ,'총균쇠 책', 10000 ,'3561054852535','총균쇠 책팔아요',0, '21/01/25', '농협');
insert into market values(market_seq.nextval, '도서/티켓', '송연주' ,'정보처리기사 필기책', 11000 ,'3561054852535','정보처리기사 필기책',0, '21/01/25', '농협');

insert into market values(market_seq.nextval, '기타 중고물품', '김재현' ,'몬스테라', 9000 ,'3561054852535','몬스테라팔아요',0, '21/01/26', '신한');
insert into market values(market_seq.nextval, '기타 중고물품', '강성연' ,'마스크', 7000 ,'3561054852535','마스크팔아요',0, '21/01/27', '국민');
insert into market values(market_seq.nextval, '기타 중고물품', '정해준' ,'필통', 3000 ,'3561054852535','필통팔아요',0, '21/01/27', '농협');
insert into market values(market_seq.nextval, '기타 중고물품', '정희석' ,'볼펜', 1500 ,'3561054852535','볼펜팔아요',0, '21/01/28', '신한');
insert into market values(market_seq.nextval, '기타 중고물품', '전예린' ,'핸드폰케이스', 2000 ,'3561054852535','핸드폰케이스팔아요',0, '21/01/29', '농협');
insert into market values(market_seq.nextval, '기타 중고물품', '송연주' ,'바디필로우', 10000 ,'3561054852535','바디필로우팔아요',0, '21/01/30', '농협');

