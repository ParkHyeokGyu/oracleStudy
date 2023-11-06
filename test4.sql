-- 149page => ���ǰ˻�
/*
   ����Ŭ���� �����ϴ� ��������
   = ������
      *** �ѱ��� �� ���ڴ� 3byte   CHAR(4) = '����' => ���� �߻�
      CHAR(1~2000byte) : ���� ����Ʈ
      => data CHAR(100)
           data='A' => 1byte => �޸𸮴� 100byte ����(������ ũ�⸸ŭ) : �޸� ��������
                                         ��� ���� ������ ũ�⸦ ������ �ִ� ���
      VARCHAR2(1~4000byte) : ������
      => data VARCHAR2(100)
           data='A' => 1byte => �޸𸮴� 1byte ����
      CLOB : �ٰŸ�, �ڼҼ�...(4gb ����) => ������
   -------------------------------------------------------- �ڹٿ��� String���� �޴´�
   = ������ => ����, �Ǽ� ǥ��
      NUMBER => �ڸ����� �������� ���� �� 8�ڸ�
      NUMBER(4) => 4�ڸ�(0,10,100,1000) -> 9999
      NUMBER(7,2) => 7�ڸ�(�ʿ��ϸ� 2�ڸ��� �Ҽ������� ���) => �Ҽ��� ��� �� 5�ڸ�.2�ڸ�
   -------------------------------------------------------- ����(int), �Ǽ�(double)
   = ��¥�� => DATE
   -------------------------------------------------------- YY/MMDD => java.util.Date(java.sql.Date(X))
   = ��Ÿ��(4bg => ������, ����, �̹���)
      binary���� => BLOB
      file���� => BFILE
   -------------------------------------------------------- java.io.InputStream
   => �߿�
        ��¥ / ���ڿ� => ''(�̱�)
        ����� �����ʹ� ��ҹ��ڸ� �����Ѵ�

   ����Ŭ���� �����ϴ� ������
   = ��� ������(+,-,*,/) => %�� ����(������ => MOD())
      => /�� 0���� ���� �� ����
           ����/����=�Ǽ� => 5/2=2.5
           ���� SELECT �ڿ��� ���(WHERE���� ����� �ȵȴ� => ���ǹ��� ������� true / false)
           ��������ڴ� ����� �� �� �ִ�
           ���ڿ� ���� : ||
   = �� ������
      	= : ����
	!=, <>, ^= : ���� �ʴ�(���� ���� : <>)
	< : �۴�
	> : ũ��
	<= : �۰ų� ����
	>= ũ�ų� ����
   = �� ������
	AND, OR
	=> &&(�Է°� ���� ���), ||(���ڿ� ����)
   = NOT
      ����������
      SELECT * FROM emp WHERE NOT ename='KING';
      SELECT * FROM emp WHERE ename<>'KING';
      => NOT IN(), NOT BETWEEN, NOT LIKE
   = BETWEEN ~ AND : �Ⱓ, ������ ����   >= AND <=
      BETWEEN 1 AND 10 => 1~10
      >=1 AND <=10 ===> ������ ������, ������
   = NULL : �ּҰ� ���� ����(�� ��ü�� �������� ������)
      NULL�� �ִ� ��쿡�� ��� ������ ������� �ʴ´�
      ename=NULL(X)
      NULL�� ��� => IS NULL
      NULL�� �ƴ� ��� => IS NOT NULL
   = IN
      WHERE deptno=10 OR deptno=20 OR deptno=30
                -------------------------------------------------
                WHERE deptno IN (10,20,30)
   = LIKE : �˻�(%, _)
              %�� ������ ������ �𸣴� ���
      = startsWith => 'A%' => A�� ����
      = endsWith => '%A' => A�� ��
      = contains => '%A%' => A�� ����
      = _ : �� ���� '___A_' => '__A%' 3��° ���ڿ� A�� �� ��� ������
      =====> 'A%'(A�� �����ϴ� ������(���ڼ��� �𸦶�)), 'A__'(A�� �����ϴ� 3���� ������)
      => REGEXP_LIKE() �Լ�
   = ����Ʈ �����
      ----------------
      => �˻�
           -----
           | ����� => �˻��� �Է�
           | ���α׷��� => WHERE title LIKE '%�˻���%';
   = ������ ����
      WHERE �÷��� ������ ��;
                -------------------- true�� ���� false�� �̼���
      WHERE�� if���� ����
      if(���ǹ�) => ���������(X) => SELECT �ڿ��� ���
*/
-- SELECT ename,sal FROM emp;
-- SELECT ename||' '||job FROM emp;
-- SELECT empno,ename FROM emp WHERE empno=&&sabun;

-- ���������
-- SELECT 5+2,5-2,5*2,5/2 FROM dual;
-- NULL���� ����ó���� �ȵȴ�
-- SELECT ename "�̸�",sal "�޿�",comm "������",sal+comm "���� �Ѿ�" FROM emp;
-- SELECT ename "�̸�",sal "�޿�",comm "������",sal+NVL(comm,0) "���� �Ѿ�" FROM emp;
-- NVL(comm,0) => comm�� NULL���� ��� 0���� ���� �� ����

-- �� ������
-- = ����
-- SELECT ename,hiredate,job,sal FROM emp WHERE ename='KING';
-- SELECT ename,hiredate,job,sal FROM emp WHERE ename='SCOTT';
-- SELECT ename,hiredate,job,sal FROM emp WHERE hiredate='81/11/17';
-- SELECT ename,hiredate,job,sal FROM emp WHERE hiredate='81/12/11';
-- SELECT ename,hiredate,job,sal FROM emp WHERE empno=7788;
-- SELECT ename,hiredate,job,sal FROM emp WHERE empno=7900;
-- SELECT ename,hiredate,job,sal FROM emp WHERE job='MANAGER';
-- SELECT ename,hiredate,job,sal FROM emp WHERE job='CLERK';

-- ���� �ʴ�   !=, <>, ^=
-- ����Ŭ�� ������ ���� ������ ����� �� ����� ���� ����(�м��� ��ƴ�)
-- SELECT ename,hiredate,job,sal FROM emp WHERE job<>'CLERK';
-- SELECT ename,hiredate,job,sal FROM emp WHERE NOT job='CLERK';
-- SELECT ename,hiredate,job,sal FROM emp WHERE job!='CLERK';
-- SELECT ename,hiredate,job,sal FROM emp WHERE job^='CLERK';

-- �۴�   < (���� ����) => ����, ����, ��¥
-- SELECT ename,sal FROM emp WHERE sal<2500;
-- SELECT * FROM emp WHERE sal<(SELECT AVG(sal) FROM emp);
-- 81�⵵ ������ �Ի��� ���
-- SELECT ename,sal,hiredate FROM emp WHERE hiredate<'81/01/01';
-- KING���� ���� ��� ���(���ĺ� K���� ���� ������)
-- SELECT ename,sal,hiredate FROM emp WHERE ename<'KING';

-- ũ��   >
-- �޿��� 2500���� ���� �޴� ����� �̸�, �޿� ���
-- SELECT ename,sal FROM emp WHERE sal>2500;
-- 81�� ���Ŀ� �Ի� => �̸�, �Ի���, ����
-- SELECT ename,hiredate,job FROM emp WHERE hiredate>'81/12/31';

-- �̻�,����   >=,<=
-- �޿��� 3000 ������ ����� �̸�, �޿� ���
-- SELECT ename,sal FROM emp WHERE sal<=3000;
-- �޿��� 3000 �̻��� ����� �̸�, �޿� ���
-- SELECT ename,sal FROM emp WHERE sal>=3000;

/*
   ��������
   AND => ���Ŀ�����(����, �Ⱓ�� ����) => ~ AND ~ => BETWEEN
   (����) AND (����)
   TRUE         TRUE => TRUE
   TRUE         FALSE => FALSE
   FALSE        TRUE => FALSE
   FALSE        FALSE => FALSE

   OR => ���Ŀ�����(����, �Ⱓ�� ��� ���) => IN
   (����) OR (����)
   TRUE         TRUE => TRUE
   TRUE         FALSE => TRUE
   FALSE        TRUE => TRUE
   FALSE        FALSE => FALSE
*/
-- AND
-- �޿��� 1500�̻� 3000������ ����� �̸�, �޿� ���
-- SELECT ename,sal FROM emp WHERE sal>=1500 AND sal<=3000;

-- BETWEEN ~ AND
-- SELECT ename,sal FROM emp WHERE sal BETWEEN 1500 AND 3000;

-- 81�⵵�� �Ի��� ����� �̸�, �Ի��� ���
-- SELECT ename,hiredate FROM emp WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
-- SELECT ename,hiredate FROM emp WHERE hiredate LIKE '81%';
-- substr(hiredate,1,2) => hiredate�� 1�ڸ����� 2���ڸ� �ڸ���
-- SELECT ename,hiredate FROM emp WHERE substr(hiredate,1,2)=81;

-- OR
-- �μ���ȣ(deptno) 10�̰ų� 20�̰ų� 30�� �μ����� �ٹ��ϴ� ����� �̸�, �μ���ȣ ���
-- SELECT ename,deptno FROM emp WHERE deptno=10 OR deptno=20 OR deptno=30;
-- SELECT ename,deptno FROM emp WHERE deptno IN (10,20,30);
-- ������(job) => MANAGER, CLERK�� ����� �̸� ��� ������ ���
-- SELECT * FROM emp WHERE job='MANAGER' OR job='CLERK';
-- SELECT * FROM emp WHERE job IN ('MANAGER','CLERK');

-- NULL ������
-- NULL�� ����ó���� �ȵǴ� ������ => IS NULL(NULL���̸�), IS NOT NULL(NULL���� �ƴϸ�)
-- 1. IS NULL => ����� ���� ����� �̸�, �Ի��� ���
-- SELECT ename,hiredate FROM emp WHERE mgr IS NULL;
-- 2. ����߿� �������� ���� ����� �̸�,�޿�,������ ���
-- SELECT ename,sal,comm FROM emp WHERE comm IS NULL;
-- 3. ����߿� �������� �޴� ����� �̸�,�޿�,������ ���(��, 0�� �������� �ʴ´�)
-- ������ ���� ȸ��, å���Ÿ� ���� ���� �����...
-- SELECT ename,sal,comm FROM emp WHERE comm IS NOT NULL AND comm<>0;

-- BETWEEN AND �޿��� 1500�̻��̰� 3000���ϰ� �ƴ� ����� �̸�,�޿� ���
-- SELECT ename,sal FROM emp WHERE sal NOT BETWEEN 1500 AND 3000;
-- job�� MANAGER, CLERK�� �ƴ� ����� �̸�,���� ���
-- SELECT ename,job FROM emp WHERE job NOT IN ('MANAGER','CLERK');

-- LIKE : �˻�
-- 'A%'
-- ����߿� A�� �����ϴ� �̸��� ��� ���� ���
-- SELECT * FROM emp WHERE ename LIKE 'A%';
-- ����߿� T�� ������ �̸��� ��� ��� ���� ���
-- SELECT * FROM emp WHERE ename LIKE '%T';

-- ����߿� ������ �̸��� IN,EN�� ����� ��� ���� ���
-- SELECT * FROM emp WHERE ename LIKE '%IN' OR ename LIKE '%EN';
SELECT * FROM emp WHERE NOT (ename LIKE '%IN' OR ename LIKE '%EN');