-----------------------------------�ֹ�����--------------------------------------------
drop table buyHis;
create table buyHis (
	buyHis_no number constraints buyHis_pk primary key, --�ֹ���ȣ
	buyHis_date date not null, --��¥
	member_id varchar2(20) not null, --�����ھ��̵�
	pdetail_no number not null constraint buyHis_pdetail_no_fk references pdetail(pdetail_no), --�ɼǹ�ȣ
	product_no number not null constraint buyHis_product_no_fk references product(product_no), --��ǰ��ȣ
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
insert into buyHis(buyHis_no,buyHis_date,member_id,pdetail_no,product_no,buyHis_num,buyHis_payment,buyHis_addr) values(buyHis_seq.nextval,sysdate,'gildong',1,3,1,2000,'�����');
insert into buyHis(buyHis_no,buyHis_date,member_id,pdetail_no,product_no,buyHis_num,buyHis_payment,buyHis_addr) values(buyHis_seq.nextval,sysdate,'gildong',2,3,2,3000,'�����');
insert into buyHis(buyHis_no,buyHis_date,member_id,pdetail_no,product_no,buyHis_num,buyHis_payment,buyHis_addr) values(buyHis_seq.nextval,sysdate,'gildong',3,4,3,1000,'�����');
insert into buyHis(buyHis_no,buyHis_date,member_id,pdetail_no,product_no,buyHis_num,buyHis_payment,buyHis_addr) values(buyHis_seq.nextval,sysdate,'gildong',4,4,4,1000,'�����');

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

-----------------------------------��ǰ�ɼ�--------------------------------------------
DROP TABLE PDETAIL CASCADE CONSTRAINT;
CREATE TABLE PDETAIL (
	PDETAIL_NO NUMBER PRIMARY KEY, --�ɼǹ�ȣ
	PDETAIL_NAME VARCHAR2(150) NOT NULL, --�̸�
	PDETAIL_SUMMARY VARCHAR2(150) NOT NULL, --���
	PDETAIL_DESCRIPTION VARCHAR2(3000) NOT NULL, --����
	PDETAIL_PDIMG VARCHAR2(100), --�̹���
	PDETAIL_PRICE NUMBER NOT NULL, --����
	PDETAIL_NUM NUMBER NOT NULL, --����
	PRODUCT_NO NUMBER CONSTRAINT PDETAIL_PRODUCT_NO_FK REFERENCES PRODUCT(PRODUCT_NO) --��ǰ��ȣ
);

DROP SEQUENCE PDETAIL_SEQ;
CREATE SEQUENCE PDETAIL_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-----------------------------------��ȸ--------------------------------------------
select * from product;
select * from pdetail;