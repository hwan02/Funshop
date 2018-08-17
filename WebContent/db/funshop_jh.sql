-----------------------------------주문내역--------------------------------------------
drop table buyHis;
create table buyHis (
	buyHis_no number constraints buyHis_pk primary key, --주문번호
	buyHis_date date not null, --날짜
	member_id varchar2(20) not null, --구매자아이디
	product_no number not null, --물품번호
	buyHis_addr varchar2(300) not null,--배송지주소
	buyHis_payment number not null, --결제금액
	buyHis_payType varchar2(30), --결제종류
	buyHis_payInfo varchar2(30), --결제정보
	buyHis_discount number default 0, --할인금액
	buyHis_cond varchar2(30) --상태
);

drop sequence buyHis_seq;
create sequence buyHis_seq
start with 1
increment by 1
nocycle
nocache;

--sample data
insert into buyHis(buyHis_no,buyHis_date,member_id,product_no,buyHis_payment, buyHis_addr) values(buyHis_seq.nextval,sysdate,'gildong',1,1000,'서울시');
insert into buyHis(buyHis_no,buyHis_date,member_id,product_no,buyHis_payment, buyHis_addr) values(buyHis_seq.nextval,sysdate,'gildong',2,2000,'서울시');
insert into buyHis(buyHis_no,buyHis_date,member_id,product_no,buyHis_payment, buyHis_addr) values(buyHis_seq.nextval,sysdate,'gildong',3,3000,'서울시');

-----------------------------------장바구니--------------------------------------------
drop table basket;
create table basket(
	basket_no number constraints basket_pk primary key, --장바구니번호
	member_id varchar2(20) not null, --구매자아이디
	product_no number not null --물품번호
);

drop sequence basket_seq;
create sequence basket_seq
start with 1
increment by 1
nocycle
nocache;

--sample data
insert into basket(basket_no,member_id,product_no) values(basket_seq.nextval,'gildong',1);
insert into basket(basket_no,member_id,product_no) values(basket_seq.nextval,'gildong',2);
insert into basket(basket_no,member_id,product_no) values(basket_seq.nextval,'gildong',3);

-----------------------------------정기구매--------------------------------------------
drop table regBuy;
create table regBuy(
	regBuy_no number constraints regBuy_pk primary key, --정기구매번호
	regBuy_date date not null, --신청날짜
	member_id varchar2(20) not null, --구매자아이디
	product_no number not null --물품번호
);

drop sequence regBuy_seq;
create sequence regBuy_seq
start with 1
increment by 1
nocycle
nocache;

--sample data
insert into regBuy(regBuy_no,regBuy_date,member_id,product_no) values(regBuy_seq.nextval,sysdate,'gildong',1);
insert into regBuy(regBuy_no,regBuy_date,member_id,product_no) values(regBuy_seq.nextval,sysdate,'gildong',2);
insert into regBuy(regBuy_no,regBuy_date,member_id,product_no) values(regBuy_seq.nextval,sysdate,'gildong',3);

-----------------------------------포인트--------------------------------------------
drop table point;
create table point(
	point_no number constraints point_pk primary key, --포인트번호
	point_date date not null, --포인트 적립날짜
	member_id varchar2(20) not null, --구매자아이디
	point_point number --포인트
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

-----------------------------------실시간문의--------------------------------------------
drop table asking;
create table asking (
	asking_no number constraints asking_pk primary key, --문의번호
	asking_date date not null, --문의 날짜
	member_id_from varchar2(20) not null, --보내는아이디
	member_id_to varchar2(20) not null, --받는아이디
	asking_content varchar2(300) not null, --문의내용
	asking_check varchar2(30) default '읽지 않음' --확인여부
);

drop sequence asking_seq;
create sequence asking_seq
start with 1
increment by 1
nocycle
nocache;