<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>ALL NOTES:</h1>
		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();

				Query q = s.createQuery("from Note",Note.class);
				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-3" >
					<img src="img/pencil.png" style="max-width:50px" class="card-img-top m-2" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
						<%=note.getContent()%>
						</p>
						<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Edit</a>
					</div>
				</div>

				<%
				}
				s.close();
				%>




			</div>
		</div>
	</div>
</body>
</html>