------------------------관리자 전용 DB
------------------------공지사항 테이블(작성자 : 류영석)
drop table notice;

create table notice(
	no number constraint notice_pk primary key, 	--번호(삭제 편리)
	write  		varchar2(1000)  not null,			--제목
	contents 	varchar2(1000) not null,			--공지사항 내용
	wdate date -- default sysdate					--언제 작성했는지 확인
);

------------------------상품 번호(테이블에 number생성시 짝궁)
drop sequence notice_seq;

create sequence notice_seq
   start with 1
   increment by 1
   nocache
   nocycle;

------------------------공지사항 테이블 전체 조회
select * from notice;

------------------------매출(결제금액 - 할인금액)
select buyHis_payment,buyHis_discount from buyHis;