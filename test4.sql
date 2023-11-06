-- 149page => 조건검색
/*
   오라클에서 제공하는 데이터형
   = 문자형
      *** 한글은 한 글자당 3byte   CHAR(4) = '남자' => 오류 발생
      CHAR(1~2000byte) : 고정 바이트
      => data CHAR(100)
           data='A' => 1byte => 메모리는 100byte 설정(지정한 크기만큼) : 메모리 누수현상
                                         모든 값이 동일한 크기를 가지고 있는 경우
      VARCHAR2(1~4000byte) : 가변형
      => data VARCHAR2(100)
           data='A' => 1byte => 메모리는 1byte 설정
      CLOB : 줄거리, 자소서...(4gb 저장) => 가변형
   -------------------------------------------------------- 자바에서 String으로 받는다
   = 숫자형 => 정수, 실수 표현
      NUMBER => 자릿수를 지정하지 않을 시 8자리
      NUMBER(4) => 4자리(0,10,100,1000) -> 9999
      NUMBER(7,2) => 7자리(필요하면 2자리는 소수점으로 사용) => 소수점 사용 시 5자리.2자리
   -------------------------------------------------------- 정수(int), 실수(double)
   = 날짜형 => DATE
   -------------------------------------------------------- YY/MMDD => java.util.Date(java.sql.Date(X))
   = 기타형(4bg => 동영상, 사진, 이미지)
      binary형태 => BLOB
      file형태 => BFILE
   -------------------------------------------------------- java.io.InputStream
   => 중요
        날짜 / 문자열 => ''(싱글)
        저장된 데이터는 대소문자를 구분한다

   오라클에서 제공하는 연산자
   = 산술 연산자(+,-,*,/) => %는 없다(나머지 => MOD())
      => /는 0으로 나눌 수 없다
           정수/정수=실수 => 5/2=2.5
           보통 SELECT 뒤에서 사용(WHERE에서 사용이 안된다 => 조건문의 결과값은 true / false)
           산술연산자는 산술만 할 수 있다
           문자열 결합 : ||
   = 비교 연산자
      	= : 같다
	!=, <>, ^= : 같지 않다(권장 사항 : <>)
	< : 작다
	> : 크다
	<= : 작거나 같다
	>= 크거나 같다
   = 논리 연산자
	AND, OR
	=> &&(입력값 받을 경우), ||(문자열 결합)
   = NOT
      부정연산자
      SELECT * FROM emp WHERE NOT ename='KING';
      SELECT * FROM emp WHERE ename<>'KING';
      => NOT IN(), NOT BETWEEN, NOT LIKE
   = BETWEEN ~ AND : 기간, 범위를 설정   >= AND <=
      BETWEEN 1 AND 10 => 1~10
      >=1 AND <=10 ===> 페이지 나누기, 예약일
   = NULL : 주소가 없는 상태(값 자체가 존재하지 않을때)
      NULL이 있는 경우에는 모든 연산이 수행되지 않는다
      ename=NULL(X)
      NULL인 경우 => IS NULL
      NULL이 아닌 경우 => IS NOT NULL
   = IN
      WHERE deptno=10 OR deptno=20 OR deptno=30
                -------------------------------------------------
                WHERE deptno IN (10,20,30)
   = LIKE : 검색(%, _)
              %는 문자의 갯수를 모르는 경우
      = startsWith => 'A%' => A로 시작
      = endsWith => '%A' => A로 끝
      = contains => '%A%' => A가 포함
      = _ : 한 글자 '___A_' => '__A%' 3번째 글자에 A가 들어간 모든 데이터
      =====> 'A%'(A로 시작하는 데이터(글자수를 모를때)), 'A__'(A로 시작하는 3글자 데이터)
      => REGEXP_LIKE() 함수
   = 사이트 만들기
      ----------------
      => 검색
           -----
           | 사용자 => 검색어 입력
           | 프로그래머 => WHERE title LIKE '%검색어%';
   = 연산자 사용법
      WHERE 컬럼명 연산자 값;
                -------------------- true면 수행 false면 미수행
      WHERE는 if문과 동일
      if(조건문) => 산술연산자(X) => SELECT 뒤에서 사용
*/
-- SELECT ename,sal FROM emp;
-- SELECT ename||' '||job FROM emp;
-- SELECT empno,ename FROM emp WHERE empno=&&sabun;

-- 산술연산자
-- SELECT 5+2,5-2,5*2,5/2 FROM dual;
-- NULL값은 연산처리가 안된다
-- SELECT ename "이름",sal "급여",comm "성과급",sal+comm "실제 총액" FROM emp;
-- SELECT ename "이름",sal "급여",comm "성과급",sal+NVL(comm,0) "실제 총액" FROM emp;
-- NVL(comm,0) => comm이 NULL값이 경우 0으로 변경 후 연산

-- 비교 연산자
-- = 같다
-- SELECT ename,hiredate,job,sal FROM emp WHERE ename='KING';
-- SELECT ename,hiredate,job,sal FROM emp WHERE ename='SCOTT';
-- SELECT ename,hiredate,job,sal FROM emp WHERE hiredate='81/11/17';
-- SELECT ename,hiredate,job,sal FROM emp WHERE hiredate='81/12/11';
-- SELECT ename,hiredate,job,sal FROM emp WHERE empno=7788;
-- SELECT ename,hiredate,job,sal FROM emp WHERE empno=7900;
-- SELECT ename,hiredate,job,sal FROM emp WHERE job='MANAGER';
-- SELECT ename,hiredate,job,sal FROM emp WHERE job='CLERK';

-- 같지 않다   !=, <>, ^=
-- 오라클의 단점은 같은 내용을 출력할 때 경우의 수가 많다(분석이 어렵다)
-- SELECT ename,hiredate,job,sal FROM emp WHERE job<>'CLERK';
-- SELECT ename,hiredate,job,sal FROM emp WHERE NOT job='CLERK';
-- SELECT ename,hiredate,job,sal FROM emp WHERE job!='CLERK';
-- SELECT ename,hiredate,job,sal FROM emp WHERE job^='CLERK';

-- 작다   < (왼쪽 기준) => 숫자, 문자, 날짜
-- SELECT ename,sal FROM emp WHERE sal<2500;
-- SELECT * FROM emp WHERE sal<(SELECT AVG(sal) FROM emp);
-- 81년도 이전에 입사한 사원
-- SELECT ename,sal,hiredate FROM emp WHERE hiredate<'81/01/01';
-- KING보다 작은 사원 출력(알파벳 K보다 작은 데이터)
-- SELECT ename,sal,hiredate FROM emp WHERE ename<'KING';

-- 크다   >
-- 급여가 2500보다 많이 받는 사원의 이름, 급여 출력
-- SELECT ename,sal FROM emp WHERE sal>2500;
-- 81년 이후에 입사 => 이름, 입사일, 직위
-- SELECT ename,hiredate,job FROM emp WHERE hiredate>'81/12/31';

-- 이상,이하   >=,<=
-- 급여가 3000 이하인 사원의 이름, 급여 출력
-- SELECT ename,sal FROM emp WHERE sal<=3000;
-- 급여가 3000 이상인 사원의 이름, 급여 출력
-- SELECT ename,sal FROM emp WHERE sal>=3000;

/*
   논리연산자
   AND => 직렬연산자(범위, 기간에 포함) => ~ AND ~ => BETWEEN
   (조건) AND (조건)
   TRUE         TRUE => TRUE
   TRUE         FALSE => FALSE
   FALSE        TRUE => FALSE
   FALSE        FALSE => FALSE

   OR => 병렬연산자(범위, 기간을 벗어난 경우) => IN
   (조건) OR (조건)
   TRUE         TRUE => TRUE
   TRUE         FALSE => TRUE
   FALSE        TRUE => TRUE
   FALSE        FALSE => FALSE
*/
-- AND
-- 급여가 1500이상 3000이하인 사원의 이름, 급여 출력
-- SELECT ename,sal FROM emp WHERE sal>=1500 AND sal<=3000;

-- BETWEEN ~ AND
-- SELECT ename,sal FROM emp WHERE sal BETWEEN 1500 AND 3000;

-- 81년도에 입사한 사원의 이름, 입사일 출력
-- SELECT ename,hiredate FROM emp WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
-- SELECT ename,hiredate FROM emp WHERE hiredate LIKE '81%';
-- substr(hiredate,1,2) => hiredate의 1자리부터 2글자를 자른다
-- SELECT ename,hiredate FROM emp WHERE substr(hiredate,1,2)=81;

-- OR
-- 부서번호(deptno) 10이거나 20이거나 30인 부서에서 근무하는 사원의 이름, 부서번호 출력
-- SELECT ename,deptno FROM emp WHERE deptno=10 OR deptno=20 OR deptno=30;
-- SELECT ename,deptno FROM emp WHERE deptno IN (10,20,30);
-- 직위가(job) => MANAGER, CLERK인 사원의 이름 모든 정보를 출력
-- SELECT * FROM emp WHERE job='MANAGER' OR job='CLERK';
-- SELECT * FROM emp WHERE job IN ('MANAGER','CLERK');

-- NULL 연산자
-- NULL은 연산처리가 안되는 연산자 => IS NULL(NULL값이면), IS NOT NULL(NULL값이 아니면)
-- 1. IS NULL => 사수가 없는 사원의 이름, 입사일 출력
-- SELECT ename,hiredate FROM emp WHERE mgr IS NULL;
-- 2. 사원중에 성과급이 없는 사원의 이름,급여,성과급 출력
-- SELECT ename,sal,comm FROM emp WHERE comm IS NULL;
-- 3. 사원중에 성과급을 받는 사원의 이름,급여,성과급 출력(단, 0은 포함하지 않는다)
-- 예약이 없는 회원, 책구매를 하지 않은 사람들...
-- SELECT ename,sal,comm FROM emp WHERE comm IS NOT NULL AND comm<>0;

-- BETWEEN AND 급여가 1500이상이고 3000이하가 아닌 사원의 이름,급여 출력
-- SELECT ename,sal FROM emp WHERE sal NOT BETWEEN 1500 AND 3000;
-- job이 MANAGER, CLERK이 아닌 사원의 이름,직위 출력
-- SELECT ename,job FROM emp WHERE job NOT IN ('MANAGER','CLERK');

-- LIKE : 검색
-- 'A%'
-- 사원중에 A로 시작하는 이름의 모든 정보 출력
-- SELECT * FROM emp WHERE ename LIKE 'A%';
-- 사원중에 T로 끝나는 이름의 사원 모든 정보 출력
-- SELECT * FROM emp WHERE ename LIKE '%T';

-- 사원중에 끝나는 이름이 IN,EN인 사원의 모든 정보 출력
-- SELECT * FROM emp WHERE ename LIKE '%IN' OR ename LIKE '%EN';
SELECT * FROM emp WHERE NOT (ename LIKE '%IN' OR ename LIKE '%EN');