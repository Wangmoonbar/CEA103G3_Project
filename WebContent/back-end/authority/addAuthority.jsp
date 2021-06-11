<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.authority.model.*"%>

<%
	AuthorityVO authorityVO = (AuthorityVO) request.getAttribute("authorityVO"); //EmpServlet.java(Concroller), 存入req的authorityVO物件
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料新增 - addAuthority.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>權限資料新增 - addAuthority.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="authority.do" name="form1">
		<table>
			<tr>
				<td>員工編號:</td>
				<td><input type="TEXT" name="empno" size="45"
					value="<%=(authorityVO == null) ? "1" : authorityVO.getEmpno()%>" /></td>
			</tr>
			<tr>
				<td>權限編號:</td>
				<td><input type="TEXT" name="function_no" size="45"
					value="<%=(authorityVO == null) ? "1" : authorityVO.getFunction_no()%>" /></td>
			</tr>
			<tr>
				<td>在職狀態:</td>
				<td>
				<input type="radio" name="status" value="Y" checked>啟用
				<input type="radio" name="status" value="N">下架
				</td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>
</html>