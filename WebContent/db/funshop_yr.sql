
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
	id varchar2(20) constraint member_id_pk primary key, --ȸ�����̵�
	pw varchar2(20) not null, --�н�����
	name varchar2(30) not null, --�̸�
	email varchar2(100) not null, --�̸���
	phone varchar2(80) not null, --�ڵ���
	addr varchar2(300), --�ּ�(ȸ�����Խ� ����X)
	wdate date, --ȸ��������
	question varchar2(300), --id,pwã�� ����
	answer varchar2(300), --id,pwã�� �亯
	rank varchar2(50) default '�����' --ȸ�����,ȸ�����Խ� ������ �ڵ� ���
);

insert into member(id,pw,name,email,phone,wdate,question,answer) values ('test','1234','�׽�Ʈ','test@naver.com','010-1234-5678',sysdate,'1','���');
insert into member(id,pw,name,email,phone,wdate,question,answer) values ('gildong','1234','ȫ�浿','test@naver.com','010-1235-5678',sysdate,'1','���');

--������ id ���
insert into member(id,pw,name,email,phone,wdate,rank) values ('admin','admin','������','admin@naver.com','010-1234-5678',sysdate,'admin');

select * from member;

select * from tab;