-----------------------------------�ֹ�����--------------------------------------------
drop table buyHis;
create table buyHis (
	buyHis_no number constraints buyHis_pk primary key, --�ֹ���ȣ
	buyHis_date date not null, --��¥
	member_id varchar2(20) not null, --�����ھ��̵�
	pdetail_no number not null constraint buyHis_pdetail_no_fk references pdetail(pdetail_no), --�ɼǹ�ȣ
	buyHis_num number not null, --�ֹ�����
	buyHis_payment number not null, --�����ݾ�
	buyHis_addr varchar2(300) not null,--������ּ�
	buyHis_payType varchar2(30), --��������
	buyHis_payInfo varchar2(30), --��������
	buyHis_discount number default 0, --���αݾ�
	buyHis_cond varchar2(30) --����
);

drop sequence buyHis_seq;
create sequence buyHis_seq
start with 1
increment by 1
nocycle
nocache;

--sample data
insert into buyHis values(buyHis_seq.nextval,sysdate,'gildong',1,1,1000,'�����','ī�����','�Ͻú�',0,'');
insert into buyHis values(buyHis_seq.nextval,sysdate,'gildong',2,2,2000,'�����','ī�����','�Ͻú�',0,'');
insert into buyHis values(buyHis_seq.nextval,sysdate,'gildong',3,3,3000,'�����','ī�����','�Ͻú�',0,'');
insert into buyHis values(buyHis_seq.nextval,sysdate,'gildong',4,2,4000,'�����','������ü','�츮����',0,'');
insert into buyHis values(buyHis_seq.nextval,sysdate,'gildong',5,3,9000,'�����','ī�����','2����',0,'');

-----------------------------------��ٱ���--------------------------------------------
drop table basket;
create table basket(
	basket_no number constraints basket_pk primary key, --��ٱ��Ϲ�ȣ
	member_id varchar2(20) not null, --�����ھ��̵�
	product_no number not null --��ǰ��ȣ
);

drop sequence basket_seq;
create sequence basket_seq
start with 1
increment by 1
nocycle
nocache;

--sample data
insert into basket(basket_no,member_id,product_no) values(basket_seq.nextval,'gildong',3);
insert into basket(basket_no,member_id,product_no) values(basket_seq.nextval,'gildong',4);

-----------------------------------���ⱸ��--------------------------------------------
drop table regBuy;
create table regBuy(
	regBuy_no number constraints regBuy_pk primary key, --���ⱸ�Ź�ȣ
	regBuy_date date not null, --��û��¥
	member_id varchar2(20) not null, --�����ھ��̵�
	product_no number not null --��ǰ��ȣ
);

drop sequence regBuy_seq;
create sequence regBuy_seq
start with 1
increment by 1
nocycle
nocache;

--sample data
insert into regBuy(regBuy_no,regBuy_date,member_id,product_no) values(regBuy_seq.nextval,sysdate,'gildong',3);
insert into regBuy(regBuy_no,regBuy_date,member_id,product_no) values(regBuy_seq.nextval,sysdate,'gildong',4);

-----------------------------------����Ʈ--------------------------------------------
drop table point;
create table point(
	point_no number constraints point_pk primary key, --����Ʈ��ȣ
	point_date date not null, --����Ʈ ������¥
	member_id varchar2(20) not null, --�����ھ��̵�
	point_point number --����Ʈ
);

drop sequence point_seq;
create sequence point_seq
start with 1
increment by 1
nocycle
nocache;

--sample data
insert into point(point_no,point_date,member_id,point_point) values(point_seq.nextval,sysdate,'gildong',100);
insert into point(point_no,point_date,member_id,point_point) values(point_seq.nextval,sysdate-1,'gildong',200);
insert into point(point_no,point_date,member_id,point_point) values(point_seq.nextval,sysdate-2,'gildong',300);

-----------------------------------�ǽð�����--------------------------------------------
drop table asking;
create table asking (
	asking_no number constraints asking_pk primary key, --���ǹ�ȣ
	asking_date date not null, --���� ��¥
	member_id_from varchar2(20) not null, --�����¾��̵�
	member_id_to varchar2(20) not null, --�޴¾��̵�
	asking_content varchar2(300) not null, --���ǳ���
	asking_check varchar2(30) default '���� ����' --Ȯ�ο���
);

drop sequence asking_seq;
create sequence asking_seq
start with 1
increment by 1
nocycle
nocache;

-----------------------------------�ı�--------------------------------------------
DROP TABLE REVIEW;
CREATE TABLE REVIEW (
	REVIEW_NO NUMBER PRIMARY KEY,  --�����ȣ
	REVIEW_NAME VARCHAR2(150) NOT NULL, --����
	REVIEW_CONTENT VARCHAR2(3000) NOT NULL, --����
	REVIEW_IMG VARCHAR2(100) NOT NULL,  --�̹���
	REVIEW_DATE DATE NOT NULL,  --��¥
	MEMBER_ID VARCHAR2(20) NOT NULL --�ۼ��ھ��̵�
);

DROP SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-----------------------------------��ȸ--------------------------------------------
select * from member;
select * from product;
select * from pdetail;
select * from review;
select * from buyHis;