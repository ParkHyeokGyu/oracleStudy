package com.sist.main;
/*
   1)
       Web 개발(사이트)
       출력 위치 => 브라우저
                 ------ 오라클 연동하는 프로그램이 없다
                 HTML / CSS / JavaScript
                 => 외의 모든 언어는 브라우저에서 일반 텍스트
                 
       브라우저 ===== 자바 ===== 오라클
              전송       읽기
                       JDBC(Java Database Connective)
                       java.sql
                       => 오라클 연결하는 프로그램은
                          자바에서 제공하지 않는다
                          => 외부 라이브러리 사용 => ojdbc8.jar
                       파일 : xml, json, csv
    
    1차 프로젝트 : 화면 UI / 데이터베이스(SQL)
                HTML / CSS / JavaScript
                => JSP => MVC / Ajax
    --------------------------------- 흐름
    2차 프로젝트 : Spring(의존성 약한)
                보안 / 권한부여 / ORM(MyBatis)
                => JSP => MVC / VueJS
                => MyBatis
    3차 프로젝트 : 신기술(Back / Front)
                    --------------
                    | 여러개의 서버(MSA) => 기능별로 서버를 나눠 처리
                => Spring Boot / Spring Cloud(MSA)
                => MySQL, React(Redux), JPA
    ---------------------------------
    => 자바
       프로그램의 핵심 : 데이터 관리
           변수 / 배열 / 클래스 / 파일 / 오라클 / XML / JSON
           => 데이터베이스
           => 머신러닝 / 딥러닝
              => 데이터 수집 / 데이터 전처리 / 분석
    => 프로젝트
       => 벤치마킹(아이템)
          => 예약(예매), 추천, 결제
             -----------------
             | 출력할 데이터
       => 요구사항 분석
          --------- 필요한 데이터(크롤링)
       => 오라클에 저장(데이터베이스 설계)
       => 화면 UI
       => 구현
       => 테스트
       => 배포 => 호스팅(AWS)
    => 문법
       = 연산자 / 제어문
       = 재사용 => 메소드
       --------------
       같은 기능끼리 묶어주는 역할
       ------------------- 한개로 통합(클래스) 
       클래스 : 관련된 데이터를 묶는다 => VO
              => 캡슐화 => 변수 은닉화(private)
                 => 다른 클래스나 브라우저에서 접근 불가
                 => 사용 => 일기 / 쓰기 => getter / setter
              => 사용자 정의 데이터형
                 => CRUD => 액션 클래스
                    => 메소드로만 만든다
                    => ~Manager
                    => ~DAO(오라클 연동)
              관련된 기능을 묶는다
              => 핵심 => 재사용(상속/포함)
                                --- 포함클래스가 주로 쓰인다
              => 상속/포함 상관없이 수정,추가를 할 수 있게 만든다 => POJO(상속이나 인터페이스 없이 단독으로 수행하는 방식)
              ---------------------------------------- 객체지향의 3대 요소
              => 관련된 클래스가 여러개 있는 경우
                 => 인터페이스를 이용하여 1개로 제어할 수 있게 한다
                    List list=new ArrayList()
                         list=new Vector()
                         list=new LinkedList()
              => 여러개의 데이터
                 => 변수 / 배열 / 클래스 => 1개로 어떻게 제어할 것인지
              
       리턴형 => 1개
       emp => 사원 정보
       => empno 사번 => int
       => ename 이름 => String
       => job   직위 => String
       => hitedate 입사일 => Date
       => sal   급여 => int
       => comm  성과급 => int
       => mgr   사수의 사번 => int
       => deptno 부서번호 => int
       
       => public int getEmpno()
          public String getEname()
          public String getJob()
          public Date getHiredate()
          public int getSal()
          public int getMgr()
          public int getComm()
          public int getDeptno()
          
       => public EmpVO getEmpData()
       
 */
public class MainClass_2 {
	public static void main(String[] args) {
		
	}
}
