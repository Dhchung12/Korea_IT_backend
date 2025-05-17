<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<h1>Welcome to My Page!!</h1>
	<hr>
	<!--  JSP declaration Tag -->
	<%!
		// int count = 10;
		String color = "magenta";
		String makeLower(String data){
			return data.toLowerCase();
		}
	%>
	
	<!-- JSP Scriptlet -->
	<%
		int count = 10;
		out.println("This is my first JSP page!!<br>");
		System.out.println("드디어 출력했다...");
		out.println("Total count is "+count + "<br>");
		for(int i=0; i<count; i++){
			out.println("Current i is " + i + "<br>");
			// out.println("<hr>");
		}
	%>
	
	<br><br>
	
	<!-- JSP Expression -->
	<!--  절대 세미콜론을 넣으시면 안됩니다. -->
	<input type="text" value="My name is Mr.Owen"><br>
	<input type="text" style='color: <%=color%>' value='<%=makeLower("My name is Mr.Owen")%>'><br>
</body>
</html>