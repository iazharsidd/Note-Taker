<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@include file="all_js_css.jsp"%>
<style>
.form-wrapper {
	max-width: 600px;
	margin: 40px auto;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>


</head>
<body>
	<div>
		<%@include file="navbar.jsp"%>
		<h1 style="text-align: center;">Edit Your Note</h1>
		<br>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>
		<div class="form-wrapper">
			<form action="UpdateServlet" method="post">
			<input value = "<%=note.getId() %>" name = "noteId" type = "hidden"/>
			
				<div class="mb-3">
					<label for="title" class="form-label">Note Title</label> <input
						name="title" required type="text" class="form-control" id="title"
						aria-describedby="emailHelp" value="<%=note.getTitle()%>" />

				</div>
				<div class="mb-3">
					<label for="content">Note Content</label>
					<textarea name="content" required id="content"
						placeholder="Enter your content here" class="form-control"
						style="height: 300px"><%=note.getContent()%>
					</textarea>

				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-success">Save</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>