
drop table member;
/*
create table member(
	id varchar2(20) constraint member_id_pk primary key,
	pw varchar2(20) not null,
	name varchar2(30) not null,
	email varchar2(100) not null,
	phone varchar2(80) not null,
	addr varchar2(300),
	wdate date
);
*/

create table member(
	id varchar2(20) constraint member_id_pk primary key, --회원아이디
	pw varchar2(20) not null, --패스워드
	name varchar2(30) not null, --이름
	email varchar2(100) not null, --이메일
	phone varchar2(80) not null, --핸드폰
	addr varchar2(300), --주소(회원가입시 기재X)
	wdate date, --회원가입일
	question varchar2(300), --id,pw찾기 질문
	answer varchar2(300), --id,pw찾기 답변
	rank varchar2(50) default '브론즈' --회원등급,회원가입시 브론즈로 자동 등록
);

insert into member(id,pw,name,email,phone,wdate,question,answer) values ('test','1234','테스트','test@naver.com','010-1234-5678',sysdate,'1','노랑');
insert into member(id,pw,name,email,phone,wdate,question,answer) values ('gildong','1234','홍길동','test@naver.com','010-1235-5678',sysdate,'1','노랑');

--관리자 id 등록
insert into member(id,pw,name,email,phone,wdate,rank) values ('admin','admin','관리자','admin@naver.com','010-1234-5678',sysdate,'admin');

select * from member;

select * from tab;