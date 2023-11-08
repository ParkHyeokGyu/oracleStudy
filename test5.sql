-- ����Ŭ 2���� => ������ / �����Լ� / ORDER BY
/*
   => ����
   => ��������
   => DDL(Table ����)
   1) DQL : �˻�(������Ʈ�� �ٽɱ��)
                     ��� ���, �α���, �󼼺���, ����, ����, ����¡...
      => ��ɾ� : SELECT
           ���̺��� ���� : �����͸� �����ϴ� ����(����)
           �����ͺ��̽� : ���� => �ڵ� ����(XE)
           ���̺� : ����(���Ͻý��� => DBMS)
           1. ���̺��� ����
              => COLUMN + ROW => 2���� ����
              CREATE TABLE member(
                  id VARCHAR2(10),
                  name VARCHAR2(50),
                  sex VARCHAR2(10),
                  phone VARCHAR2(20),
                  address VARCHAR2(100)
              )          ||
              class Member{
                  String id;
                  String name;
                  String sex;
                  String phone;
                  String address;
              }
              -----------------------------------------------------------------
	    id	name	sex	phone		address	=> COLUMN
              -----------------------------------------------------------------
	    aaa	ȫ�浿	����	1111-1111	����	=> ROW(�ν��Ͻ�)
	    Member m1=new Member();
	    m1.id="aaa";
              -----------------------------------------------------------------
	    bbb	��û��	����	2222-2222	���	=> ROW(�ν��Ͻ�)
              -----------------------------------------------------------------
              => �����ͺ��� ������ �Ǿ��ִ�(������ ����)
              => ������ �б� / ���Ⱑ ���ϴ�
              => ��ü ������ �б� / ���ϴ� �����͸� ���� / ������ �����͸� ����
                   SELECT * / SELECT column1,column2 / SELECT * FROM emp WHERE...
              
              �˻��ϴ� ��ɾ� SELECT�� ����
              SELECT * | column1,column2...
              FROM table_name
              [
                  WHERE ������ => ������
                  -------------------------------------
                  GROUP BY �׷� => �׷캰 ó�� => �ܵ����� ��� ����
                  HAVING => �ܵ����� ��� �Ұ���(GROUP BY�� �־�� ��� ����)
                  -------------------------------------
                  ORDER BY �÷��� => ����(ASC|DESC)
              ]

              => ����ó��(���ǹ�)
                   1. ���������(+, -, *, /)
                      + : ����� �����ϴ�(���ڿ� ���� X => ||)
                      / : ����/����=�Ǽ�
                      => ���ǹ����� SELECT �ڿ��� �ַ� ��� (�÷������� ����ó���Լ��� ������, �ο������ ���� => ��������ڷ� �ؾ��Ѵ�)
                   2. �񱳿����� : =, <>(!=), <, >, <=, >=
                   3. �������� : AND, OR
                   4. ���Կ����� : =
                      => WHERE �ڿ� = (����)
                      => �ٸ� ���� = (����)
                           UPDATE table_name
                           SET name='' => ����
                           WHERE id=''; => ����
                   5. IN : OR�� ������ ���
                            deptno=10 OR deptno=20 OR deptno=30 OR deptno=40 OR deptno=50
                            => deptno IN (10,20,30,40,50)
                            => �ִ��� SQL������ �ٿ����Ѵ�, �˻� �ӵ�
                   6. NULL : �����Ͱ� ���� ����
                                => �����Ͱ� NULL�϶��� ����ó���� �ȵȴ�
                                => IS NULL => NULL�̶��
                                => IS NOT NULL => NULL�� �ƴ϶��
                                => �ڹٿ����� NULL�� �����ϸ� ���� �߻�
                                     String name=null;
                                     if(name.equals("aaa")) => NullPointerException
                   7. BETWEEN : >= AND <=
                                     �Ⱓ, ���� => ����¡
                   8. NOT : ���� �ݴ��� ȿ��
                              NOT IN, NOT BETWEEN, NOT LIKE
                   9. LIKE : ���繮�ڿ� �˻�
                              % => ������ ���� ������ ����
                              _ => �� ����
                              'A%' => A�� �����ϴ� ��� ���ڿ�
                              '%A' => A�� ������ ��� ���ڿ�
                              '%A%' => A�� �����ϴ� ��� ���ڿ� => �˻�, �����ȣ ã��
                              => 1��(����Ŭ => SQL) : �����ȣ�� ���� ó��
                              => 2��(���) : Daum���� �����ϴ� ���̺귯�� ���
                              '_A%' => �� ��° ���ڰ� A�� ��� ���ڿ�
                              '__A__' => �� ��° ���ڰ� A�� �ټ� ���ڸ� ���� ���ڿ�

                   ���߰˻�
                   ----------
                   A, B, C, D, E
                   WHERE ename LIKE '%A%'
                   OR ename LIKE '%B%'
                   OR ename LIKE '%C%'
                   OR ename LIKE '%D%'
                   OR ename LIKE '%E%'

                   WHERE REGEXP_LIKE(ename,'A|B|C|D|E')

              => �����Լ�

   2) DDL : ���̺� ����, �� ����, ������ ����, �ε��� ����
              ���� : CREATE
              ���� : DROP
              ���� : ALTER
   3) DML : �߰�, ����, ����
               INSERT, UPDATE, DELETE
   4) TCL : �ϰ� ó�� => �� ���� ����, ��ɾ� ���
                                COMMIT, ROLLBACK
   5) DCL : ����� ����(hr)
              ------------------ ������ ���� �ִ�
              GRANT(���� �ο�), REVOKE(���� ����)
              -------------------------------------------
              system / sysdba => ���� �ο�
              conn system/happy
              conn hr/happy
*/
-- 1. �����͸� �˻� => table, column, �������� Ȯ�� => DESC table_name
-- �� => tomcat => web.xml(�����ӿ�ũ ���)
-- DESC book;
/*
BOOKID		NOT NULL NUMBER(2) => ������(primary key) �ߺ��� ����
BOOKNAME	VARCHAR2(40)
PUBLISHER	VARCHAR2(40)
PRICE		NUMBER(8)

	A~Z
	A B C
	SELECT * FROM board;
	--------------------------
	�ڹٷ� ���� => �������� ����
	setA()~setZ()
*/
-- SELECT : ���ϴ� �����͸� ��� => å�̸��� ������ ���
-- SELECT bookname,price FROM book;
-- ������ 20000�� �̸��� ������ ���
-- SELECT bookname FROM book WHERE price<20000;
-- ������ 12000�̻� 20000������ å�̸�,������ ���
/*
SELECT bookname,price FROM book WHERE price>=12000 AND price<=20000;
SELECT bookname,price FROM book WHERE price BETWEEN 12000 AND 20000;
BETWEEN~AND���� >=, <=�� �ӵ��� ������
*/
/*
-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻�
SELECT bookname FROM book WHERE publisher='�½�����' OR publisher='���ѹ̵��';
SELECT bookname FROM book WHERE publisher IN ('�½�����','���ѹ̵��');
-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻�
SELECT publisher FROM book WHERE bookname='�౸�� ����';
-- �����̸��� '�౸'�� ���Ե� ���ǻ縦 �˻�
SELECT publisher FROM book WHERE bookname LIKE '%�౸%';
-- �����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻�
SELECT bookname FROM book WHERE bookname LIKE '_��%';
-- �౸�� ���� ������ ������ 20000�� �̻��� ������ �˻�
SELECT bookname FROM book WHERE price>=20000 AND bookname LIKE '%�౸%';
*/
