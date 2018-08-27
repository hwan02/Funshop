--상품
DROP TABLE PRODUCT CASCADE CONSTRAINT;
CREATE TABLE PRODUCT (
	PRODUCT_NO NUMBER PRIMARY KEY, /* 상품번호 */
	PRODUCT_NAME VARCHAR2(150) NOT NULL, /* 상품명 */
	PRODUCT_SUMMARY VARCHAR2(150) NOT NULL, /* 상품요약 */
	PRODUCT_DESCRIPTION VARCHAR2(3000) NOT NULL, /* 상품설명 */
	PRODUCT_MAINIMG VARCHAR2(100) NOT NULL, /* 상풍메인이미지 */
	PRODUCT_STATE VARCHAR2(20) NOT NULL, /* 상품상태 */
	PRODUCT_TYPE VARCHAR2(20) DEFAULT '판매중', /* 상품분류 */
	PRODUCT_TIME VARCHAR2(20), /* 상품시간 */
	PRODUCT_SEASON VARCHAR2(20) /* 상품계절 */
);


drop sequence product_seq;
create sequence product_seq
start with 1
increment by 1 
nocache
nocycle;
delete from product;
insert into product values(product_seq.nextval,'오두막집','오두막에서 살고 싶니?', '통나무향이 가득 밴 집',
'portfolio/cabin.png', '판매중', '장소','아침','여름');
insert into product values(product_seq.nextval,'케이크','생일에 케이크 먹고 싶지 않아?', '생크림이 가득한 케이크',
'portfolio/cake.png', '판매종료', '음식','저녁','겨울');
insert into product values(product_seq.nextval,'서커스','다양한 능력을 가진 사람들', '세계 전지역 1위 서커스단',
'portfolio/circus.png', '판매중', '장소','점심','봄');
insert into product values(product_seq.nextval,'게임','늘 게임을 하고 싶어?', '게임 티셔츠를 가질 수 있는 절호의 기회',
'portfolio/game.png', '판매중', '의류','아침','가을');
select * from product;

/* 상품상세 */
DROP TABLE PDETAIL CASCADE CONSTRAINT;
CREATE TABLE PDETAIL (
	PDETAIL_NO NUMBER PRIMARY KEY, --옵션번호
	PDETAIL_NAME VARCHAR2(150) NOT NULL, --이름
	PDETAIL_SUMMARY VARCHAR2(150) NOT NULL, --요약
	PDETAIL_DESCRIPTION VARCHAR2(3000) NOT NULL, --설명
	PDETAIL_PDIMG VARCHAR2(100), --이미지
	PDETAIL_PRICE NUMBER NOT NULL, --가격
	PDETAIL_NUM NUMBER NOT NULL, --수량
	PRODUCT_NO NUMBER CONSTRAINT PDETAIL_PRODUCT_NO_FK REFERENCES PRODUCT(PRODUCT_NO) --상품번호
);

DROP SEQUENCE PDETAIL_SEQ;
CREATE SEQUENCE PDETAIL_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

delete from pdetail;
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '아무도 겁내지 않았던 적이 없었던 그가 돌아와서 먹었던 것이라고나 할까? 지금 볼 수 있다는 것 자체가 경이롭다',
'맥북프로15인치',3500000, 70, '전 기종보다 70% 빠른 서비스를 체험해보세요','picture1.jpg', 1);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '아무도 겁내지 않았던 적이 없었던 그가 돌아와서 먹었던 것이라고나 할까? 지금 볼 수 있다는 것 자체가 경이롭다',
'맥북프로13인치',2700000, 50, '전 기종보다 70% 빠른 서비스를 체험해보세요','picture1.jpg', 1);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '아무도 겁내지 않았던 적이 없었던 그가 돌아와서 먹었던 것이라고나 할까? 지금 볼 수 있다는 것 자체가 경이롭다',
'맥북프로17인치',3900000, 30, '전 기종보다 70% 빠른 서비스를 체험해보세요','picture1.jpg', 1);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '아무도 겁내지 않았던 적이 없었던 그가 돌아와서 먹었던 것이라고나 할까? 지금 볼 수 있다는 것 자체가 경이롭다',
'맥북프로17인치',3900000, 30, '전 기종보다 70% 빠른 서비스를 체험해보세요','picture1.jpg', 4);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '아무도 겁내지 않았던 적이 없었던 그가 돌아와서 먹었던 것이라고나 할까? 지금 볼 수 있다는 것 자체가 경이롭다',
'맥북프로17인치',3900000, 30, '전 기종보다 70% 빠른 서비스를 체험해보세요','picture1.jpg', 3);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '아무도 겁내지 않았던 적이 없었던 그가 돌아와서 먹었던 것이라고나 할까? 지금 볼 수 있다는 것 자체가 경이롭다',
'맥북프로17인치',3900000, 30, '전 기종보다 70% 빠른 서비스를 체험해보세요','picture1.jpg', 2);