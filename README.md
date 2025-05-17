# 📘 백엔드 개발 학습 아카이브

![Java](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/SpringBoot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![Web](https://img.shields.io/badge/Web-333333?style=for-the-badge&logo=html5&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)

---

## 📝 개요 및 학습 단위 구성

이 저장소는 **백엔드 개발 역량 강화를 위한 학습 기록**을 모은 공간입니다.  
기초 문법부터 실전 웹 개발까지, 단계별로 정리된 학습 내용과 예제 코드를 통해 체계적으로 성장할 수 있습니다.  
모든 파트는 독립적인 흐름과 학습 목표를 가지며, 향후 지속적으로 확장될 예정입니다.

| 폴더명           | 설명                                  | 상태        |
|----------------|--------------------------------------|------------|
| [`java`](./01_java) | Java 기초 문법과 객체지향 프로그래밍 학습           | ✅ 완료     |
| [`database`](./02_database) | SQL 기초와 MariaDB 기반의 데이터베이스 실습       | 🛠️ 진행 예정 |
| [`front`](./03_front) | HTML/CSS/JS 기반의 프론트엔드 구조 및 DOM 조작 학습 | 🛠️ 진행 예정 |
| [`server`](./04_server) | Spring Boot를 활용한 REST API 서버 구축 및 테스트   | 🛠️ 진행 예정 |


---

## ✅ 01. Java 기초

> 자바의 기본 문법부터 객체지향 개념, 컬렉션, 예외처리 등 백엔드 개발의 기반이 되는 내용을 다룹니다.

**📘 주요 학습 내용**
- **기본 문법 이해**  
  변수와 자료형을 선언하고, 연산자와 제어문을 활용하여 프로그램의 흐름을 제어할 수 있다.

- **메서드와 클래스 구조 설계**  
  메서드를 정의하고 매개변수와 반환값을 다루는 구조를 이해하여, 반복되는 코드를 모듈화할 수 있다.

- **객체지향 프로그래밍(OOP)**  
  클래스, 생성자, 상속, 다형성, 캡슐화 등을 활용하여 유지보수 가능한 구조의 프로그램을 설계할 수 있다.

- **컬렉션 프레임워크 활용**  
  `List`, `Set`, `Map` 등의 자료구조를 활용하여 데이터를 효율적으로 저장하고 검색할 수 있다.

- **예외 처리 및 디버깅**  
  `try-catch` 문을 활용하여 예외 발생 시 프로그램의 흐름을 제어하고, 안정적으로 실행될 수 있도록 설계할 수 있다.

- **파일 입출력(IO)**  
  `File`, `BufferedReader`, `BufferedWriter` 등의 클래스를 활용하여 텍스트 파일을 읽고 쓰는 기능을 구현할 수 있다.

### 🛠 사용 기술

![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=openjdk&logoColor=white)
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255?style=flat-square&logo=eclipseide&logoColor=white)

---

## 🔄 02. Database

> SQL 기초 문법부터 데이터베이스 설계, 데이터 조작 및 조회까지 실습 중심으로 학습합니다.

**📘 주요 학습 내용**
- **기본 SQL 문법 이해**  
  `SELECT`, `INSERT`, `UPDATE`, `DELETE` 구문을 활용하여 데이터를 생성, 수정, 삭제, 조회할 수 있다.

- **조건절과 정렬 처리**  
  `WHERE`, `ORDER BY`, `BETWEEN`, `LIKE` 등을 활용하여 원하는 조건의 데이터를 필터링하고 정렬할 수 있다.

- **함수 및 그룹 연산**  
  `COUNT`, `AVG`, `SUM`, `GROUP BY`, `HAVING` 등을 활용하여 통계 데이터를 집계하고 분석할 수 있다.

- **서브쿼리 및 조인 이해**  
  서브쿼리와 `INNER JOIN`, `LEFT JOIN` 등을 활용하여 여러 테이블에서 복합적인 데이터를 조회할 수 있다.

- **데이터베이스 객체 생성**  
  `CREATE TABLE`, `ALTER TABLE`, `DROP` 등을 활용하여 테이블을 생성하거나 수정하고, 스키마를 관리할 수 있다.

- **실전 ERD 기반 설계 및 테스트**  
  ERD를 바탕으로 데이터베이스 구조를 설계하고, 병원 진료 데이터 등의 시나리오 기반 SQL을 작성할 수 있다.

### 🛠 사용 기술
![SQL](https://img.shields.io/badge/SQL-336791?style=flat-square&logo=postgresql&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=mariadb&logoColor=white)
![DBeaver](https://img.shields.io/badge/DBeaver-372923?style=flat-square&logo=data&logoColor=white)

---

## 🔄 03. Front

> HTML, CSS, JavaScript의 기초부터 DOM 조작, 이벤트 처리, jQuery 활용까지 웹 UI 구현의 기초를 실습합니다.

**📘 주요 학습 내용**
- **HTML 문서 구조 설계**  
  `<!DOCTYPE>`, `head`, `body`, `form`, `table` 태그 등을 활용하여 웹 페이지의 기본 구조를 작성할 수 있다.

- **CSS 스타일링 기초**  
  `class`, `id`, `color`, `position`, `box model` 등의 속성을 활용하여 레이아웃과 스타일을 정의할 수 있다.

- **JavaScript 문법 이해**  
  변수 선언, 조건문, 반복문, 함수 등 JS의 기본 문법을 활용하여 동적인 로직을 작성할 수 있다.

- **DOM 조작 및 이벤트 처리**  
  `document.querySelector`, `addEventListener` 등을 활용하여 페이지 요소에 동적으로 접근하고 이벤트를 제어할 수 있다.

- **jQuery 사용법**  
  `$()`, `.on()`, `.hide()`, `.css()` 등의 jQuery 문법을 활용하여 DOM을 간결하게 조작할 수 있다.

- **실습 중심 웹 예제 구현**  
  메뉴북, 배너 슬라이드, 윈도우 팝업 등 다양한 미니 프로젝트를 통해 실무형 프론트 기능을 직접 구현할 수 있다.

### 🛠 사용 기술
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black)
![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jquery&logoColor=white)

--- 

## 🔄 04. Server

> JSP와 Servlet을 활용하여 동적인 웹 페이지를 구현하고, HTTP 요청-응답의 흐름과 세션 관리 개념을 학습합니다.

**📘 주요 학습 내용**
- **웹 서버 구조 이해**  
  WAS의 역할과 Servlet, JSP의 동작 원리를 이해하고, 클라이언트 요청에 대한 서버의 처리 흐름을 설명할 수 있다.

- **Servlet 기본 구현**  
  `HttpServlet`, `doGet()`, `doPost()` 메서드를 활용하여 HTTP 요청을 처리하고 응답을 반환할 수 있다.

- **JSP 페이지 작성 및 스크립트 처리**  
  JSP에서 자바 코드를 삽입하고 `EL`, `스크립틀릿`, `지시자` 등을 활용하여 동적인 페이지를 구현할 수 있다.

- **폼 데이터 처리 및 응답 전송**  
  `request.getParameter()`를 활용하여 사용자의 입력을 받고, `response.sendRedirect()` 등을 통해 결과를 전달할 수 있다.

- **세션과 쿠키 활용**  
  `HttpSession`과 `Cookie` 객체를 활용하여 로그인 상태 유지, 사용자 인증 등의 기능을 구현할 수 있다.

- **간단한 서버 기능 구현**  
  게시글 등록, 쿠키 삭제, 스크립트 테스트 등 실습 위주의 예제를 통해 서버-클라이언트 구조를 직접 구현할 수 있다.

### 🛠 사용 기술
![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=openjdk&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-E84D3D?style=flat-square&logo=java&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=black)
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255?style=flat-square&logo=eclipseide&logoColor=white)

---


> 📌 각 파트는 학습 흐름에 따라 독립적으로 구성되며, 지속적인 확장을 통해 백엔드 개발 역량을 강화합니다.
