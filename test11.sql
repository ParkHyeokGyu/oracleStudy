-- 테이블 두 개 이상에서 필요한 데이터를 추출 => JOIN
/*
 emp 사원정보
 EMPNO	NOT NULL NUMBER(4)	사번
 ENAME	VARCHAR2(10)		이름
 JOB		VARCHAR2(9)		직위
 MGR		NUMBER(4)			사수번호
 HIREDATE	DATE				입사일
 SAL		NUMBER(7,2)		급여
 COMM		NUMBER(7,2)		성과급
 DEPTNO	NUMBER(2)			부서번호
 ----------------------------------------
 dept 부서정보
 DEPTNO	NOT NULL NUMBER		부서번호
 DNAME	VARCHAR2(20)		부서명
 LOC		VARCHAR2(20)		근무지
 ----------------------------------------
 1. JOIN의 종류
    = INNER JOIN => NULL값이 있는 경우 처리 불가능(사용자)
      = EQUI JOIN
      = NON-EQUI JOIN
      ------------------- 저장된 데이터 값이 동일할 경우, 컬럼명이 달라도 사용 가능
      = NATURAL JOIN
      = JOIN USING
      ------------------- 컬럼명이 동일해야한다
      
      A(a,b,c,d)
      B(b,e,g,h)
      => a,c,e,g
      
      형식)
      	오라클 조인
      	SELECT a,c,e,g
      	FROM A,B
      	WHERE A.b=B.b; => 컬럼명이 동일할 경우 명시적으로 지정해줘야한다
      	
      	ANSI 조인(표준)
      	SELECT a,c,e,g
      	FROM A JOIN B
      	ON A.b=B.b;
      
    = OUTER JOIN => NULL값이 있는 경우 처리 가능(ADMIN)
      = LEFT OUTER JOIN
      = RIGHT OUTER JOIN
      = FULL OUTER JOIN
*/
/*
-- 오라클 조인
-- 사번, 이름, 직위, 입사일, 급여, 부서명, 근무지
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno;
-- ANSI 조인
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
-- 자연 조인
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp NATURAL JOIN dept;
-- JOIN USING
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp JOIN dept USING(deptno);
*/

/*
 orders
 ORDERID		NOT NULL NUMBER(2)
 CUSTID		NUMBER(2)
 BOOKID		NUMBER(2)
 SALEPRICE		NUMBER(8)
 ORDERDATE		DATE
 ---------------------------------
 customer
 CUSTID		NOT NULL NUMBER(2)
 NAME			VARCHAR2(40)
 ADDRESS		VARCHAR2(50)
 PHONE		VARCHAR2(20)
 ---------------------------------
 book
 BOOKID		NOT NULL NUMBER(2)
 BOOKNAME		VARCHAR2(40)
 PUBLISHER		VARCHAR2(40)
 PRICE		NUMBER(8)
*/
-- EQUI JOIN
-- 오라클 조인
/*
SELECT * FROM orders;
SELECT orderid,name,bookname,saleprice,orderdate
FROM orders o,customer c,book b
WHERE o.custid=c.custid AND o.bookid=b.bookid;
*/
-- ANSI 조인
/*
SELECT orderid,name,bookname,saleprice,orderdate
FROM orders o JOIN customer c
ON o.custid=c.custid
JOIN book b
ON o.bookid=b.bookid;
*/
-- 테이블을 한 개만 사용할 수 있다 => SELF JOIN
SELECT e1.ename "본인",e2.ename "사수"
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno(+);