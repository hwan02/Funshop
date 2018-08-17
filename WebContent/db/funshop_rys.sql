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


------------------------회원가입 테이블 전체 조회(관리자 회원관리) : 작성자 이예린
------------------------번호, 날짜 추가 : 작성자 류영석
select * from member;					--회원가입 테이블 전체 조회

drop table member;

create table member(
	no number,							--번호(삭제 편리) : 추가
	id varchar2(30),					--회원 아이디
	pw varchar2(30),					--회원 비번
	name varchar2(30),					--회원 이름
	email varchar2(50), 				--회원 이메일
	phone varchar2(15),					--회원 폰 번호
	addr varchar2(80),					--회원 주소
	wdate date -- default sysdate		--언제 가입 했는지 확인 : 추가
);