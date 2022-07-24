-- �ּ�ó��

-- ����Ŭ �ڷ���
-- ���� ������Ÿ��
-- char(n) : �������� ����. n : ����
-- varchar2(n) : �������� ����
-- ��) char(3), varchar2(3) : �ִ� 3����Ʈ���� ������ �� �ִ� ���ڿ�
-- ���������� ��� ����������� ���� �����Ͱ� �ԷµǴ���,
-- ��������� �������� �ʴ´ٴ� Ư¡�� �ִ�.

-- nchar(n) : �������� �����ڵ� ����
-- nvarchar2(n) : �������� �����ڵ� ����
-- ��) nchar(3), nvarchar2(3) : 3���ڱ��� ������ �� �ִ� ���ڿ�

-- n�� �������� : �����ڵ� ���� �ϳ� ���ϳ� > �����ڵ�� ��� ���ڸ� 2����Ʈ�� ����
-- �ѱ��� ������ -> n�� ���δ�.

-- ���� ������ Ÿ��
-- number(p,s) : +-38�ڸ����� ���ڸ� ����
-- ��) number(3) : �ִ� 3�ڸ����� ǥ�������� ���� (-999 ~ 999)
-- ��) number(4,2) : �ִ� 4�ڸ�, �Ҽ� �����ڸ� ����(-99.99~99.99)


-- LOB ������Ÿ�� (�ִ� 4GB) Large Object
-- CLOB : ������ ��뷮 Ÿ��
-- NCLOB : �����ڵ带 ������ ������ ��뷮 Ÿ��
-- BLOB : ������, ���� �� ��뷮�� ���̳ʸ� ������Ÿ��

-- ��¥�� ������Ÿ��
-- DATE : ��¥������ �ڷ������� ��, ��, �ʱ��� ǥ�� ����
-- TIMESTAMP : �и��ʱ��� ǥ�� ����

-- SQL : ���������̽� ���Ǿ���̴�.

-- SELECT : �˻�(�����ִ� ��)
-- WHERE : ����
-- * : ��� ��
-- INSERT : ������ ����(����)
-- UPDATE : ������ ����
-- DELETE : ������ ����
-- COMMIT : ��������
-- ROLLBACK : ���(�ǵ�����)

--COMMIT, ROLLBACK�� INSERT, UPDATE, DELETE ������ ���밡��

-- ���̺� �����
-- CREATE TABLE {���̺��} ( {�÷���} {������Ÿ��} {�⺻��-��������} {NULL��뿩�� - ��������} . . . );

CREATE TABLE member ( 
    name NVARCHAR2(10) NOT NULL, --�̸� �ʼ�
    id VARCHAR2(10) PRIMARY KEY, --���Ἲ ���� ����(������ Ű), �ΰ� ��� �ȵ�. ����� �� �����ϰ� �˻��� �� �ִ� Ű
    pw VARCHAR2(10) NOT NULL,
    phone char(13),     -- 010-1111-1111 -> - ���� 13����
    admin number(1) default 0 --0�� �����, 1�� ������
);


SELECT * from tab;
-- �ش� �����ͻ��� ��� ���̺� ����� ��µȴ�.

-- ������ �߰��ϱ�
-- INSERT INTO {���̺��} {Į����1, Į����2, ...} VALUES {������1, ������2, . . .};
-- Į������ ������ �� �ִµ� ���� �� ������� �÷����� �־��ָ� �ȴ�.
-- ����Ŭ �����ͺ��̽��� �����÷��� ���� ��������ǥ�� ����Ѵ�.

INSERT INTO member(name, id, pw, phone, admin) VALUES ('ȫ�浿', 'hong', '1234', '010-1231-1111',1);
INSERT INTO member VALUES ('������', 'sung', '5678', '010-1231-2111',0);
INSERT INTO member VALUES ('�̼���', 'lee', '8888', '010-1231-8888',0);

--�����͸� ���� �Ŀ��� ���������� ���־�� �Ѵ�. (����, ����)
COMMIT;

-- ������ ��ü ��ȸ�ϱ�
SELECT * from member;

-- ���ǿ� �°� ��ȸ�ϱ�
-- SELECT [�÷���] FROM [���̺��] WHERE [����]

SELECT * FROM member where admin=1;

-- ���̵� sung�� ����� ��� ������ ��ȸ�ϱ�
select * from member where id='sung';

-- ������ �����ϱ�
-- UPDATE {���̺��} SET {�÷���} = {������ ��} WHERE {����}

UPDATE member SET phone='010-1234-1234' where name='������';
COMMIT;
SELECT * FROM member;

-- ������ �����ϱ�
-- DELETE FROM {���̺��} WHERE {����}
DELETE FROM member WHERE id='lee';
COMMIT;

select *from member;

-- DROP : ���̺� ��ü�� ����
-- DROP TABLE {���̺��}

DROP table member;
select * from tab;

-- member2 ���̺� �����ϱ� > ������ �ֱ� > (���ǿ� �°�) ������ ��ȸ�ϱ�> ������ �����ϱ� > ������ �����ϱ� > ���̺� ����

CREATE TABLE member2(
    name NVARCHAR2(10) NOT NULL,
    id VARCHAR2(30) PRIMARY KEY,
    pw VARCHAR(20) NOT NULL,
    studentId number(8)
);
COMMIT;

INSERT INTO member2(name, id, pw, studentId) VALUES ('������', 'joohyun282', 'kk1234', 11112222);
INSERT INTO member2 VALUES('������', 'jinsang123', 'kk1234', 22223333);
INSERT INTO member2 VALUES('������', 'yunhmg345', 'kk121234', 11113333);

COMMIT;

SELECT * FROM member2;

SELECT * FROM member2 where name='������';

DELETE FROM member2 where name='������';
COMMIT;

