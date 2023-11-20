-- 157page
/*
	집합 함수 => 단위 COLUMN
	단일행 함수나 컬럼은 집합함수와 같이 사용할 수 없다
	SELECT ename,COUNT() => 오류
	=> 단일행 함수, 컬럼과 동시에 사용 가능한 경우는 GROUP BY로 그룹을 잡았을 경우이다
	
	COUNT : ROW의 갯수 => 로그인, 아이디 중복, 장바구니...
	=> COUNT(컬럼명) => NULL값을 제외
	=> COUNT(*) => NULL값을 포함
	MAX : 지정된 컬럼의 최대값 => 자동 증가 번호(MAX+1)
	=> MAX(sal), MAX(empno) => MAX(empno)+1(신입사원의 사번)
	MIN : 지정된 컬럼의 최소값
	AVG : 평균
	=> AVG(sal) => 전체 사원의 급여 평균
	SUM : 합
	=> SUM(sal)
	----------------------------------> 구매한 금액
	RANK : 순위
	=> 1
	   2
	   2
	   4
	=> RANK() OVER(ORDER BY 컬럼명) => 자동으로 정렬이 된다
	DENSE_RANK : 순위
	=> 1
	   2
	   2
	   3
	----------------------------------
	GROUP => 같은 데이터끼리 모아서 따로 관리
	CUBE : ROW단위로 계산
	ROLLUP : ROW,COLUMN 모두 계산
*/
-- SELECT COUNT(*) FROM emp;
-- SELECT deptno,COUNT(*) FROM emp GROUP BY deptno;
-- SELECT COUNT(mgr),COUNT(comm),COUNT(*) FROM emp;
-- SELECT MAX(sal) FROM emp;
-- SELECT MIN(sal) FROM emp;
-- SELECT AVG(sal) FROM emp;
-- SELECT SUM(sal) FROM emp;
SELECT ename,sal,RANK() OVER(ORDER BY sal DESC) "RANK" FROM emp;
SELECT ename,sal,DENSE_RANK() OVER(ORDER BY sal DESC) "RANK" FROM emp;
