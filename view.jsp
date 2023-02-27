<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<title>
View Student
</title>
<style>
*{font-size:40px;
    background-image: url("https://img.freepik.com/free-vector/stylish-white-background-with-diagonal-lines_1017-33199.jpg");
background-size: cover;
}
.container{
display:flex;
border: 2px solid black;

}
</style>
</head>
<body>
<center>
<div class="container">
<div class="heading">View Student</div>
</div>

<%



try{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/internship_project";
String un="root";
String pw="abcd1234";
Connection con=DriverManager.getConnection(url,un,pw);
String sql="select * from student";
PreparedStatement pst=con.prepareStatement(sql);
ResultSet rst=pst.executeQuery();
%>
<th>
</br>
<td>rno &nbsp &nbsp</td>
<td>name &nbsp &nbsp</td>
<td>s1 &nbsp &nbsp</td>
<td>s2 &nbsp &nbsp</td>
<td>s3 &nbsp &nbsp</td>
</th>
<%
while(rst.next()){
%>
<hr>
<tr>
<td><%=rst.getInt("rno") %> &nbsp&nbsp</td>
<td><%=rst.getString("name") %>&nbsp&nbsp</td>
<td><%=rst.getDouble("s1") %>&nbsp&nbsp</td>
<td><%=rst.getDouble("s2") %>&nbsp&nbsp</td>
<td><%=rst.getDouble("s3") %>&nbsp&nbsp</td>

</tr>
<%

}
con.close();

}
catch(SQLException e){
out.println("issue"+e);
}

%>
<form>
</br>
<button type="button" class="back-btn" onclick="window.location='index.jsp'">Back</button>
</form>
</center>
</body>
</html>