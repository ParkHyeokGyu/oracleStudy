-- ����Ŭ 1����
/*
   23page => �����ͺ��̽��� �����ͺ��̽� �ý���
                                       ------------------------ ����Ŭ
             �����ͺ��̽� : �ʿ��� ������ ��� ���� ���������� ������ �����͸� ��Ƽ� ����
            ---------------- �迭 / Ŭ���� / ���� / ����ϱ� ���� ���� ������ �����ͺ��̽�
   24page => �����ͺ��̽� �ý���
                  => ���õ� �����͸� ��Ƽ� ���� : �˻�, �߰�, ����, ������ �����ϰ� ���� �ý���
                                ------------------------- CRUD
                                CRUD => Create Read Update Delete
                                                 |        |
                                              �߰�    �б�(�˻�)
                                            INSERT  SELECT  UPDATE  DELETE => DML(������ ���۾��)
                  => Oralce / MYSQL / MSSQL / DB2 / MariaDB
                       -------   ---------                      ----------- �ǹ�(MYSQL,MariaDB)
   25page => �����ͺ��̽� ����� Ư¡
                  1) ���յ� ������(�����ͺ��̽� => ����)
                     ���� : �����ͺ��̽�
                     ���� : ���̺�
                     -----
                     ���� ���� => 1|aaa|aaa|aaa|aaa\n
                                       ----------------------- ROW => �����Ͱ� ������ �Ǿ��ִ�
                                                                  ROW => �� ��, �� ���� ���� ������ ������ �ִ�
                                                                  => Record / Tuple => �ڹٴ� ��ü
                                                                  => ����Ŭ�� ������ ROW
                  2) ����� ������ : ������ �̹��� ������(������ �پ��, ���� �뷮�� �۴�) => �ϵ��ũ�� ����
                     �����ͺ��̽� �ý���
                     ------------------------
                     ���� ���α׷�(Ŭ���̾�Ʈ)
                              | => ��û => SQL(����Ŭ ���) => JDBC
                              |      = DML(SELECT, INSERT, UPDATE, DELETE)
                              |      = DDL(CREATE, DROP, ALTER, TRUNCATE, RENAME)
                              |      = DCL(GRANT, REVOKE)
                              |      = TCL(COMMIT, ROLLBACK)
                              |      = PL/SQL(�Լ��� �ڵ�����)
                         ����Ŭ(����)
                              | => ������ ����
                     �ϵ� ��ũ
                  3) ������� : ����Ʈ�� �ʿ��� �����͸� �˻��� �������� ����� �����Ϳ� ������ �� �ְ� ����
                  4) ������ ������ : ������ ��� ����� ��� �����͸� ����
                                          => ����(����Ŭ�� 1���� ���) => �ڹ�(static)
   26page => �����ͺ��̽��� Ư¡
                   1) �ǽð� ���ټ�(����Ŭ�� �׻� ����д�) => ������ ���� �� �ڵ� ����
                       => �� �� �����ϸ� ���� �������� �ʴ´�(����ڿ� ���� ������ �����ϴ�)
                   2) ��ӵ� ��ȭ(��ȭ ���,�Խ��� ����...)
                   3) ���� ����
                   4) ���� ���� ����(�ڹ� => �޸� �ּ�)
   27page => �����ͺ��̽� �ý����� ����
                   DBMS : ���� ����� �����Ϳ� ���� ���α׷��� ���� => ����Ŭ
                   �����ͺ��̽� : ���� ����� ������ => XE
                                       �ڹٿ��� ����Ŭ ����
                                       jdbc:oracle:thin:@localhost:1521:XE => �ڵ����� �����Ǵ� �����ͺ��̽���
                                             ------------  ���� �ּ� ��Ʈ ����� ��ġ
                                             | ��ü��(mysql, microsoft...)
                                             => thin(����) => ���Ḹ ����(�ӵ��� ������)
                                             => oci(����) => �����͸� �о ���� �� ����(�ӵ��� ������)
                   ������ �� : �����͸� �����ϴ� ���
                           |
                       ����Ŭ => ���� ����(����, ����, ��¥)
                                      ���� => CHAR, VARCHAR2, CLOB(����, 4gb)
                                                     |           | ������(1~4000byte)
                                                  1~2000byte => ���� => CHAR(2000) => 'A'(1byte�� �ƴ� 2000byte�� ����ȴ�)
                                                  => �ѱ��� 3byte
                                                  => 'ȫ�浿' => 9byte�̻� Ȯ��
                                      ���� => NUMBER => 38�ڸ� ����� ����
                                                  NUMBER(4) => int, NUMBER(7,2) => double
                                      ��¥ => DATE, TIMESTAMP
                                      ------------------------------- �ڹ� ��������
                                      => � �����Ͱ� ����Ǿ����� Ȯ�� ���� : DESC table��
                                      => Ű�� ����
                                           �⺻Ű(�ߺ��� ������� �ʴ� Ű) => ID, �Խù� ��ȣ => PRIMARY KEY
                                           => ��� ���̺��� ROW������ ���ؼ� 1�� �̻� ����
                                           => ���Ἲ�� ��Ģ
                                           �ĺ�Ű(�⺻Ű�� ��ü�ϴ� Ű) => email,phone => UNIQUE KEY
                                           �ܷ�Ű(����Ű) => FOREIGN KEY
                                           NOT NULL, CHECK, DEFAULT
                                      => DDL(������ �𵨸�)
   28page~34page => �����ͺ��̽��� ���� ����
                   1) ���� �ý��� : ������ ���� => �����ϱ� ��ƴ�(�ٸ� ���ϰ� �����ؼ� ����� ��ƴ�)
                                                              ������ ����ϴ�
                   2) �����ͺ��̽� �ý��� : ������ �ִ�, ������ ����, ������ �پ��, �����ؼ� ����ϱ� �����ϴ�(JOIN, SUBQUERY)
                       => 1�� ���� => ����(�����ͺ��̽� ����, ȭ�� UI, SQL...)
                   3) �� �����ͺ��̽� �ý���
                       ������ ========== �ڹ� ========== ����Ŭ
                        | ȭ�� ���                   | JDBC(SQL)             | ������ ����
                          Front-End                    Back-End                 DBA
                   4) �л� �����ͺ��̽� �ý��� : ���
                       => ���� : �ߺ��� �ּ�ȭ, �ϰ���, ������, ���� ��� => MSA
   35page => ���� �ý��� => ��Ʈ��ũ => ���� �����
   44page => DBMS�� ����
                   1) ������ �ߺ��� �ּ�ȭ => ����ȭ
                   2) �ϰ���, ������, ����, ���� ���
   45page => �����ͺ��̽� �ý��� ����
                   -----------------------------
                   ���� ���α׷� : �ڹ�
                            | => ����Ŭ ���ɾ �̿� => SQL
                   �����ͺ��̽� : ����Ŭ
                            | => read / write
                   �ϵ��ũ : ������ ������ ����
   46page => �����ͺ��̽� ���(SQL) => ���ڿ��� ������� �ִ�
                   SQL�� ����
                   -------------
                   1) DML(������ ���۾��)
                      SELECT(������ �˻�) => ���� ���� ���
                               ȸ�� ���� ����
                      INSERT(������ �߰�) : ȸ�� ����
                      UPDATE(������ ����) : ȸ�� ����
                      DELETE(������ ����) : ȸ�� Ż��
                   2) DDL(������ �𵨸�) : ���� ���� ����(Ŭ���� ����)
                      CREATE : ���̺�, ��, ������, �ó���, �ε���, �Լ�, ���ν���, Ʈ���� ����
                      ALTER : ����
                      DROP : ����
                      TRUNCATE : ������ �߶󳻱�
                      RENAME : �̸� ����
                   3) DCL(������ ������)
                      GRANT : ���� �ο� => system
                      REVOKE : ���� ����
                   4) TCL(Ʈ����� ���)
                      COMMIT : ���������� ����
                      ROLLBACK : ���ɹ� ���
--------------------------------------------------------------------------------------
   46page : SELECT
               => ������ �˻�
               => ����)
                    *** SQL������ ��ҹ��� ������ ���� �ʴ´�
                    *** ��� : Ű����� �빮�ڷ� ����Ѵ�
                    SELECT *(ALL) | ���ϴ� �����͸�(column1,column2,...) ----- 5
                    FROM table�� ----- 1
                    [
                        WHERE ������ ----- 2
                        GROUP BY �׷��÷� ----- 3
                        HEVING �׷� ���� => GROUP BY�� �ִ� ��쿡�� ��� ���� ----- 4
                        ORDER BY ����(ASC|DESC) ----- 6
                    ]
   Book ���̺�
   �÷�(�ڹ��� �������)		��������
   BOOKID                                    	NOT NULL NUMBER(2)
   BOOKNAME                               	VARCHAR2(40)
   PUBLISHER                                 	VARCHAR2(40)
   PRICE                                       	NUMBER(8)
*/
-- select LENGTHB('ȫ�浿') FROM dual;
-- ����� ��ü �����͸� �о�´�
-- SELECT * FROM book;
-- ���ϴ� �����͸� ���
-- SELECT bookid,bookname FROM book;
-- å�̸�,����
-- SELECT bookname,price FROM book;
-- �÷� / ���̺�
/*
   emp ���̺� => ��� ����
   1) �÷�
       empno : ���
       ename : �̸�
       job : ����
       hiredate : �Ի���
       mgr : �����ȣ
       sal : �޿�
       comm : ������
       deptno : �μ���ȣ
       ===============> 14�� ����
*/
-- ������� ���,�̸�,���� ���
-- SELECT empno,ename,job FROM emp;
-- ��� ��ü ������ ���
-- SELECT * FROM emp;
-- sal���� 2000�̻��� ����� ��� ����
-- SELECT * FROM emp WHERE sal>=2000;
-- sal���� 1500������ ����� �̸�,�޿�,�Ի��� ���
-- SELECT ename,sal,hiredate FROM emp WHERE sal<=1500;
-- ���ڿ� => ''(�̱�), ""�� �ο��ȣ�θ� ��� ���� => CHAR, VARCHAR2
-- ����̸��� SCOTT�� ����� ��� ������ ���
-- SELECT * FROM emp WHERE ename='SCOTT';
-- ����Ŭ�� SQL������ ��ҹ��ڸ� �������� �ʴ´�(��, ����� �����ʹ� ��ҹ��ڸ� �����Ѵ�)
-- ��¥�� ���ڿ��� ''(�̱�)�� �̿��ؾߵȴ�, ���ڴ� �׳� ����� ����
-- SELECT hiredate FROM emp;
-- SELECT * FROM emp WHERE hiredate='81/11/17';
/*
   �����ͺ��̽� ��� => �˻�, �߰�, ����, ����
                                 | SELECT
   => ������ �˻�
        1) ���̺��� Ȯ��
        2) �÷���
        3) �������� : ������(����, �Ǽ�), ������(����, ���ڿ�), ��¥��
                                                  --------------------------------
                                                  | ''�� �̿��Ѵ�, ��¥�� => YY/MM/DD
                                                                                     23/11/06
        4) SELECT ���� => ��� ��� / �󼼺��� / �˻� ������ ���
        
        ���̺�
        member => 2���� ����(ROW + COLUMN)
        ----------------------------------------------
	id	pwd	name	sex => �÷�, �Ӽ�, �ʵ� => �ڹ�(�������)
        ----------------------------------------------
	aaa	1234	ȫ�浿	���� => ROW, Record, Tuple => new Member()
             => �ν��Ͻ�(����� ������)
	bbb	1234	��û��	����
	ccc	1234	�̼���	����
        ROW => �Ѹ��� ��� ������ ����Ǿ��ִ�(���� ROW)
        
        47page
        �����ͺ��̽� �����
        �Ϲ� ����� : �̹� ������� ���α׷��� ���(USER)
        SQL ����� : ������Ʈ �� �ַ� SQL�� ���
        ���� ���α׷��� => �̹� ������� ���̺��� �̿��Ͽ� �����͸� �����Ѵ�(SELECT, INSERT, UPDATE, DELETE)
        �����ͺ��̽� ������(DBA) => �䱸���� �м� => �ʿ��� �����͸� ���̺��� ����

        49page ���
        --------------
        ������ ���� : DDL(CREATE, ALTER, DROP, TRUNCATE, RENAME)
                          => ���� ���� ����, �Լ� ����, �ڵ� ���� ��ȣ, ���̺� ��Ī, �ڵ� ����
                                  | table             | function  | sequence        | �ó���     | Ʈ����
        ������ ���� : DML(SELECT, INSERT, UPDATE, DELETE)
                                  | �˻�    | �߰�   | ����    | ����
        ������ ���� : DCL(GRANT, REVOKE)
                                  | ���� �ο�  | ���� ����
        ����(Ʈ����� => �ϰ� ó��) : COMMIT, ROLLBACK
                                                 | ���� ����   | ������ ���� => ���ɹ� ���
        50page ������ ��
        -----------------------
        ���� ������ ��(������)
        ��Ʈ��ũ ��(C/S)
        ��ü ��(�ڹ�)
        ��ü ������ �� => ���̺����� ���� => JOIN => RDBMS => ERD
                                    1:1 / 1:N

        53page �����ͺ��̽� ������ ����
        ---------------------------------------
        ���佺Ű�� : ���踸 �� ���� => � �����Ͱ� �ִ��� Ȯ��
                         ��) ���� => �̸�, ��ȭ, �ּ�, �޴� => ������ ����
        ������Ű�� : �������� ����(�̸� : ���ڿ�, ��ȣ : ����...)
        ������Ű�� : ����޸� ũ�� ����(name VARCHAR2(100))

        DDL
        ------------------------------------------------------------------------------
	�÷���		id		sex
        ------------------------------------------------------------------------------
	Ű����		pk		ck
        ------------------------------------------------------------------------------
	�������̺�	X		X
        ------------------------------------------------------------------------------
	�����÷�		X		X
        ------------------------------------------------------------------------------
	üũ�Ӽ�		X		CHECK('����','����')
        ------------------------------------------------------------------------------
	��������		VARCHAR2	CHAR
        ------------------------------------------------------------------------------
	������ũ��	20		6
        ------------------------------------------------------------------------------
*/

-- C:\app\parkh\product\21c\dbhomeXE\bin