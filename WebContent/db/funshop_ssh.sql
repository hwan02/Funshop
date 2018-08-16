--상품
DROP TABLE PRODUCT;
CREATE TABLE PRODUCT (
	PRODUCT_NO NUMBER NOT NULL, /* PRODUCT_NO */
	PRODUCT_NAME VARCHAR2(50) NOT NULL, /* PRODUCT_NAME */
	PRODUCT_SUMMARY VARCHAR2(500) NOT NULL, /* PRODUCT_SUMMARY */
	PRODUCT_DESCRIPTION VARCHAR2(100) NOT NULL, /* PRODUCT_DESCRIPTION */
	PRODUCT_MAINIMG VARCHAR2(100) NOT NULL, /* PRODUCT_MAINIMG */
	PRODUCT_STATE VARCHAR2(15) NOT NULL, /* PRODUCT_STATE */
	PRODUCT_TYPE VARCHAR2(15), /* PRODUCT_TYPE */
	PRODUCT_TIME VARCHAR2(20), /* PRODUCT_TIME */
	PRODUCT_SEASON VARCHAR2(20) /* PRODUCT_SEASON */
);

DROP SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE PRODUCT_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
delete from product;
insert into product values(product_seq.nextval,'오두막집','오두막에서 살고 싶니?', '통나무향이 가득 밴 집',
'../img/portfolio/cabin.png', '판매중', '장소','아침','여름');



insert into product values(product_seq.nextval,'케이크','생일에 케이크 먹고 싶지 않아?', '생크림이 가득한 케이크',
'../img/portfolio/cake.png', '판매종료', '음식','저녁','겨울');


insert into product values(product_seq.nextval,'서커스','다양한 능력을 가진 사람들', '세계 전지역 1위 서커스단',
'../img/portfolio/circus.png', '판매중', '장소','점심','봄');


insert into product values(product_seq.nextval,'게임','늘 게임을 하고 싶어?', '게임 티셔츠를 가질 수 있는 절호의 기회',
'../img/portfolio/game.png', '판매중', '의류','아침','가을');

--후기
DROP TABLE FUNSHOP_REMOTE.REVIEW;
CREATE TABLE FUNSHOP_REMOTE.REVIEW (
	REVIEW_NO NUMBER NOT NULL, 
	REVIEW_NAME VARCHAR2(50) NOT NULL, 
	REVIEW_CONTENT VARCHAR2(300) NOT NULL, 
	REVIEW_IMG VARCHAR2(100) NOT NULL, 
	REVIEW_DATE DATE NOT NULL 
);
DROP SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;