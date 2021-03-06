<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.report_article.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	Report_ArticleService report_articleSvc = new Report_ArticleService();
    List<Report_ArticleVO> list = report_articleSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllReport_Article.jsp</title>

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
	width: 1300px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有員工資料 - listAllReport_Article.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/report_article/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>檢舉編號</th>
		<th>文章編號</th>
		<th>檢舉內容</th>
		<th>新增檢舉時間</th>
		<th>會員編號</th>
		<th>更新檢舉時間</th>
		<th>檢舉狀態</th>
		<th>備註</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="report_articleVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${report_articleVO.reportno}</td>
			<td>${report_articleVO.articleno}</td>
			<td>${report_articleVO.content}</td>	
			<td><fmt:formatDate value="${report_articleVO.crtdt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
			<td>${report_articleVO.memberno}</td>
			<td><fmt:formatDate value="${report_articleVO.executedt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
			<td>${report_articleVO.status}</td>
			<td>${report_articleVO.desc}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/report_article/report_article.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="reportno"  value="${report_articleVO.reportno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/report_article/report_article.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="reportno"  value="${report_articleVO.reportno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>