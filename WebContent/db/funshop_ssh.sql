--��ǰ
DROP TABLE PRODUCT CASCADE CONSTRAINT;
CREATE TABLE PRODUCT (
	PRODUCT_NO NUMBER PRIMARY KEY, /* ��ǰ��ȣ */
	PRODUCT_NAME VARCHAR2(150) NOT NULL, /* ��ǰ�� */
	PRODUCT_SUMMARY VARCHAR2(150) NOT NULL, /* ��ǰ��� */
	PRODUCT_DESCRIPTION VARCHAR2(3000) NOT NULL, /* ��ǰ���� */
	PRODUCT_MAINIMG VARCHAR2(100) NOT NULL, /* ��ǳ�����̹��� */
	PRODUCT_STATE VARCHAR2(20) NOT NULL, /* ��ǰ���� */
	PRODUCT_TYPE VARCHAR2(20) DEFAULT '�Ǹ���', /* ��ǰ�з� */
	PRODUCT_TIME VARCHAR2(20), /* ��ǰ�ð� */
	PRODUCT_SEASON VARCHAR2(20) /* ��ǰ���� */
);


drop sequence product_seq;
create sequence product_seq
start with 1
increment by 1 
nocache
nocycle;
delete from product;
insert into product values(product_seq.nextval,'���θ���','���θ����� ��� �ʹ�?', '�볪������ ���� �� ��',
'portfolio/cabin.png', '�Ǹ���', '���','��ħ','����');
insert into product values(product_seq.nextval,'����ũ','���Ͽ� ����ũ �԰� ���� �ʾ�?', '��ũ���� ������ ����ũ',
'portfolio/cake.png', '�Ǹ�����', '����','����','�ܿ�');
insert into product values(product_seq.nextval,'��Ŀ��','�پ��� �ɷ��� ���� �����', '���� ������ 1�� ��Ŀ����',
'portfolio/circus.png', '�Ǹ���', '���','����','��');
insert into product values(product_seq.nextval,'����','�� ������ �ϰ� �;�?', '���� Ƽ������ ���� �� �ִ� ��ȣ�� ��ȸ',
'portfolio/game.png', '�Ǹ���', '�Ƿ�','��ħ','����');
select * from product;

/* ��ǰ�� */
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

delete from pdetail;
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '�ƹ��� �̳��� �ʾҴ� ���� ������ �װ� ���ƿͼ� �Ծ��� ���̶�� �ұ�? ���� �� �� �ִٴ� �� ��ü�� ���̷Ӵ�',
'�ƺ�����15��ġ',3500000, 70, '�� �������� 70% ���� ���񽺸� ü���غ�����','picture1.jpg', 1);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '�ƹ��� �̳��� �ʾҴ� ���� ������ �װ� ���ƿͼ� �Ծ��� ���̶�� �ұ�? ���� �� �� �ִٴ� �� ��ü�� ���̷Ӵ�',
'�ƺ�����13��ġ',2700000, 50, '�� �������� 70% ���� ���񽺸� ü���غ�����','picture1.jpg', 1);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '�ƹ��� �̳��� �ʾҴ� ���� ������ �װ� ���ƿͼ� �Ծ��� ���̶�� �ұ�? ���� �� �� �ִٴ� �� ��ü�� ���̷Ӵ�',
'�ƺ�����17��ġ',3900000, 30, '�� �������� 70% ���� ���񽺸� ü���غ�����','picture1.jpg', 1);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '�ƹ��� �̳��� �ʾҴ� ���� ������ �װ� ���ƿͼ� �Ծ��� ���̶�� �ұ�? ���� �� �� �ִٴ� �� ��ü�� ���̷Ӵ�',
'�ƺ�����17��ġ',3900000, 30, '�� �������� 70% ���� ���񽺸� ü���غ�����','picture1.jpg', 4);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '�ƹ��� �̳��� �ʾҴ� ���� ������ �װ� ���ƿͼ� �Ծ��� ���̶�� �ұ�? ���� �� �� �ִٴ� �� ��ü�� ���̷Ӵ�',
'�ƺ�����17��ġ',3900000, 30, '�� �������� 70% ���� ���񽺸� ü���غ�����','picture1.jpg', 3);
insert into PDETAIL(PDETAIL_NO, PDETAIL_DESCRIPTION, PDETAIL_NAME, PDETAIL_PRICE, PDETAIL_NUM, PDETAIL_SUMMARY, PDETAIL_PDIMG, PRODUCT_NO)
values(PDETAIL_SEQ.NEXTVAL, '�ƹ��� �̳��� �ʾҴ� ���� ������ �װ� ���ƿͼ� �Ծ��� ���̶�� �ұ�? ���� �� �� �ִٴ� �� ��ü�� ���̷Ӵ�',
'�ƺ�����17��ġ',3900000, 30, '�� �������� 70% ���� ���񽺸� ü���غ�����','picture1.jpg', 2);