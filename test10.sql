-- 오라클 GROUP BY / JOIN / SUBQUERY
/*
	ORDERID	NOT NULL NUMBER(2) => 구매번호(중복 없는 데이터)
 	CUSTID	NUMBER(2) => 고객번호
 	BOOKID	NUMBER(2) => 책번호
 	SALEPRICE	NUMBER(8) => 가격
 	ORDERDATE	DATE => 구매일
*/
/*
   ORDERID     CUSTID     BOOKID  SALEPRICE ORDERDAT
---------- ---------- ---------- ---------- --------
         1          1          1       6000 20/07/01
         2          1          3      21000 20/07/03
         3          2          5       8000 20/07/03
         4          3          6       6000 20/07/04
         5          4          7      20000 20/07/05
         6          1          2      12000 20/07/07
         7          4          8      13000 20/07/07
         8          3         10      12000 20/07/08
         9          2         10       7000 20/07/09
        10          3          8      13000 20/07/10
*/
-- SUM : 총합 => 구매한 책의 총 가격
-- SELECT SUM(saleprice) FROM orders;
-- COUNT : 갯수 => 구매한 사람의 수
/*
SELECT COUNT(*) FROM orders;
SELECT custid FROM orders;
SELECT DISTINCT custid FROM orders;
SELECT COUNT(DISTINCT custid) FROM orders;
*/
-- 구매된 책중에 가장 비싼책은 얼마인가
/*
SELECT MAX(saleprice) FROM orders;
SELECT MIN(saleprice) FROM orders;
SELECT ROUND(AVG(saleprice)) FROM orders;
*/
/*
	GROUP BY : 지정된 그룹별로 따로 통계
	           ------------ 같은 값을 가지고 있는 경우
	emp : 부서번호별, 입사년도별, 직위별
	-- 부서별로 인원수, 급여의 총합, 급여 평균, 최대값, 최소값
*/
-- 10,20,30
/*
SELECT COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값" FROM emp WHERE deptno=10;
SELECT COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값" FROM emp WHERE deptno=20;
SELECT COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값" FROM emp WHERE deptno=30;
*/
-- GROUP BY
/*
SELECT deptno,COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값" FROM emp GROUP BY deptno ORDER BY deptno;
SELECT job,COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값" FROM emp GROUP BY job ORDER BY job;
*/
-- 입사년도별
/*
SELECT TO_CHAR(hiredate,'YYYY'),COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값" 
FROM emp 
GROUP BY TO_CHAR(hiredate,'YYYY') 
ORDER BY TO_CHAR(hiredate,'YYYY');
*/
-- 요일별
/*
SELECT TO_CHAR(hiredate,'DY'),COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값" 
FROM emp 
GROUP BY TO_CHAR(hiredate,'DY');
*/
-- 부서별 전체 급여의 평균보다 작은 부서만 출력
/*
SELECT deptno,COUNT(*) "인원수",SUM(sal) "급여 총합",AVG(sal) "급여 평균",MAX(sal) "최대값",MIN(sal) "최소값"
FROM emp
GROUP BY deptno
HAVING AVG(sal)<2073;
*/
-- 각 부서별 성과급을 받는 인원수 출력
/*
SELECT deptno,COUNT(*) "인원수"
FROM emp
WHERE comm IS NOT NULL AND comm<>0
GROUP BY deptno;
*/
-- WHERE 문장은 GROUP BY에서 사용할 수 없다(GROUP BY는 HAVING)
-- GROUP BY 사용시에는 출력 컬럼명과 GROUP BY 컬럼명이 동일해야한다
/*
SELECT deptno,job,COUNT(*),AVG(sal),SUM(sal)
FROM emp
GROUP BY deptno,job
ORDER BY deptno,job DESC;
*/
SELECT custid,COUNT(*) "도서수량"
FROM orders
WHERE saleprice>=8000
GROUP BY custid
HAVING COUNT(*)>=2;