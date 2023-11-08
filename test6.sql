-- 오라클 2일차 => 정렬 155page
/*
	SELECT * | column1,column2...
	FROM table_name|view_name|SELECT~
	[
		WHERE => 연산자
		GROUP BY => 그룹별 처리
		HAVING => 그룹에 대한 조건
		ORDER BY => 정렬
	]

	=> 오라클은 자동 정렬이 안된다
		    ------------ ORDER BY, INDEX_ASC, INDEX_DESC
	=> ORDER BY의 사용법
	     => SELECT 문장의 맨 마지막에 추가
	     -------------------------------
	     => ORDER BY 컬럼명
	     => ORDER BY 컬럼명 ASC
	     -------------------------------
	     => ORDER BY 컬럼명 DESC
*/
-- 급여가 높은순으로 출력
-- SELECT ename,sal FROM emp;
-- SELECT ename,sal FROM emp ORDER BY sal DESC;
/*
SELECT ename,sal FROM emp ORDER BY 1 DESC;
SELECT ename,sal FROM emp ORDER BY 2 DESC;
              1     2                          컬럼 순서
*/
-- 이중 정렬 => 답변형 게시판, 대댓글
-- SELECT ename,sal FROM emp ORDER BY sal DESC,ename ASC;
-- SELECT ename,sal FROM emp ORDER BY 2 DESC,1;

-- book => 도서명을 내림차순으로 출력
-- SELECT bookname FROM book ORDER BY bookname DESC;
-- 도서명, 가격 => 가격이 낮은순으로 출력(ASC)
-- SELECT bookname,price FROM book ORDER BY price;
/*
emp
 EMPNO		NOT NULL NUMBER(4)	사번
 ENAME		VARCHAR2(10)		이름
 JOB		VARCHAR2(9)		직위
 MGR		NUMBER(4)		사수번호
 HIREDATE	DATE			입사일
 SAL		NUMBER(7,2)		급여
 COMM		NUMBER(7,2)		성과급
 DEPTNO		NUMBER(2)		부서번호
*/
-- 사원의 이름과 부서번호 출력
-- SELECT ename,deptno FROM emp;
-- SELECT ename,deptno FROM emp ORDER BY deptno;
-- 성과급이 없는 사원의 이름,급여,성과급 출력 => 급여가 높은순으로 출력
-- SELECT ename,sal,comm FROM emp WHERE comm IS NULL OR comm=0 ORDER BY sal DESC;
-- SELECT ename,sal,comm FROM emp WHERE NOT (comm IS NOT NULL AND comm<>0) ORDER BY sal DESC;
-- 81년에 입사한 사원의 이름,입사일 => 입사일이 최근인 사원부터 출력
-- SELECT ename,hiredate FROM emp WHERE hiredate LIKE '81%' ORDER BY hiredate DESC;
-- 사원의 이름중에 A자가 없는 사원의 이름과 급여 출력 => 급여가 높은순으로 출력
-- SELECT ename as 이름,sal as 급여 FROM emp WHERE ename NOT LIKE '%A%' ORDER BY sal DESC;
-- 사수가 있는 사원의 이름과 급여,입사일을 출력 => 급여가 높은순으로 출력, 같은 경우에는 이름을 낮은 순으로 출력
-- SELECT ename,sal,hiredate,mgr FROM emp WHERE mgr IS NOT NULL ORDER BY sal DESC,ename;
-- 사수로 일하고 있는 사수번호를 중복없이 출력
-- SELECT DISTINCT mgr FROM emp WHERE mgr IS NOT NULL;
-- 입사일이 82년 이후이거나 직위가 MANAGER인 사원의 이름,직위,입사일 출력
-- SELECT ename,job,hiredate FROM emp WHERE hiredate>'82/12/31' OR job='MANAGER';
-- 이름중에 A자가 3번째에 있는 사원의 모든 정보 출력
-- SELECT * FROM emp WHERE ename LIKE '__A%';