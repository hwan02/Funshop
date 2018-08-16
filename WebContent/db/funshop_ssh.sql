--��ǰ
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
insert into product values(product_seq.nextval,'���θ���','���θ����� ��� �ʹ�?', '�볪������ ���� �� ��',
'../img/portfolio/cabin.png', '�Ǹ���', '���','��ħ','����');



insert into product values(product_seq.nextval,'����ũ','���Ͽ� ����ũ �԰� ���� �ʾ�?', '��ũ���� ������ ����ũ',
'../img/portfolio/cake.png', '�Ǹ�����', '����','����','�ܿ�');


insert into product values(product_seq.nextval,'��Ŀ��','�پ��� �ɷ��� ���� �����', '���� ������ 1�� ��Ŀ����',
'../img/portfolio/circus.png', '�Ǹ���', '���','����','��');


insert into product values(product_seq.nextval,'����','�� ������ �ϰ� �;�?', '���� Ƽ������ ���� �� �ִ� ��ȣ�� ��ȸ',
'../img/portfolio/game.png', '�Ǹ���', '�Ƿ�','��ħ','����');

--�ı�
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