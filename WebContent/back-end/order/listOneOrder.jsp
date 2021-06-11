<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.ord_ticket_type.model.*"%>
<%@ page import="com.ord_food.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.employee.model.*"%>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"></jsp:useBean>
<jsp:useBean id="ord_ticket_typeSvc" scope="page" class="com.ord_ticket_type.model.Ord_ticket_typeService"></jsp:useBean>
<jsp:useBean id="ord_foodSvc" scope="page" class="com.ord_food.model.Ord_foodService"></jsp:useBean>
<jsp:useBean id="orderSvc" scope="page" class="com.order.model.OrderService"></jsp:useBean>
<jsp:useBean id="foodSvc" scope="page" class="com.food.model.FoodService"></jsp:useBean>
<jsp:useBean id="ticket_typeSvc" scope="page" class="com.ticket_type.model.Ticket_typeService"></jsp:useBean>
<% 
	Integer order_no = new Integer(request.getParameter("order_no"));
	OrderVO orderVO = orderSvc.getOneOrder(order_no);
	List<Ord_ticket_typeVO> list = ord_ticket_typeSvc.getAll();
	for(int i = 0; i < list.size(); i++){
		if(orderVO.getOrder_no().intValue() != list.get(i).getOrder_no().intValue()){
			list.remove(i);
			i--;
		}
	}

	List<Ord_foodVO> list1 = ord_foodSvc.getAll();
	for(int i = 0; i < list1.size(); i++){
		if(orderVO.getOrder_no().intValue() != list1.get(i).getOrder_no().intValue()){
			list1.remove(i);
			i--;
		}
	}

	request.setAttribute("orderVO", orderVO);
	request.setAttribute("list", list);
	request.setAttribute("list1", list1);

	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:00");; 
	pageContext.setAttribute("df",df);
%>
<%
    EmployeeVO employeeVO = (EmployeeVO) session.getAttribute("employeeVO");
%>


<!DOCTYPE html>
<html>
    <head>
    	<title>MoviesHit</title>
        <meta charset="big5" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="<%=request.getContextPath()%>/back-home/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
    </head>
     <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    	<a class="navbar-brand" href="<%=request.getContextPath()%>/back-home/index2.jsp">MOVIESHIT��x�t��</a>
    	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
    	<!-- Navbar Search-->
    	<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        	<div class="input-group">
        	</div>
    	</form>
    	<!-- Navbar-->
      	<ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle1" id="userDropdown" href="<%=request.getContextPath()%>/back-end/employee/empLogin.jsp" role="button"><i class="fas fa-user fa-fw"></i>${employeeVO.empname}</a>
        </li>
        <a class="nav-link" href="<%=request.getContextPath()%>/back-end/employee/empLogout.jsp">
           	 �n�X
        </a>
	</nav>
    
    
    
    
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <img src="<%=request.getContextPath()%>/back-home/img/logo2-1-6.png">
	                         <h1 style="text-align: center;color: white;font-weight: bold ;font-size:35px">
	                         	<span style="color: #02a388; font-size: 1em;">M</span>ovies<span style="color: #02a388; font-size: 1em;">H</span>it
	                         </h1>
<!--                         <a class="nav-link collapsed" href="tables3.html"> -->
<!--                             <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div> -->
<!--                            	 �򥻸�� -->
<!--                         </a> -->
                        <a id="employee_management"class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts1">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-cog"></i></div>
                           	 ���u�޲z�t��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a  class="nav-link nav-link function" href="<%=request.getContextPath()%>/back-end/employee/listAllEmployee2.jsp">���u�޲z</a>
                            </nav>
                        </div>
                        <a id="movie_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-video"></i></div>
                         	   �v���򥻸�ƨt��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/movie/backEndlistAllMovie.jsp">�q�v��ƺ޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/showtime/listAllShowtime.jsp">�����޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/theater/listAllTheater.jsp"> �U�|�޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/ticket_type/listAllTicket_type.jsp">���غ޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/food/listAllFood.jsp">�\�I�޲z</a>
                            </nav>
                        </div>
                        <a id="member_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages2">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-clock"></i></div>
                            	�|���޲z�t��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages2" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/mem/listAllMem2.jsp">�|����ƺ޲z</a>
                            </nav>
                        </div>
                        <a id="ticket_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="false" aria-controls="collapsePages3">
                            <div class="sb-nav-link-icon"><i class="fas fa-ticket-alt"></i></div>
                        	    �Ⲽ�޲z
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages3" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/order/onSite.jsp">�{������</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/order/listAllOrder.jsp">�q��޲z</a>
                            </nav>
                        </div>
           				 <a id="comment_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="false" aria-controls="collapsePages4">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-alt-slash"></i></div>
                          	  ���|�޲z
                          	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages4" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/report_comment/listAllReportComment.jsp">�������|</a>
                            </nav>
                        </div>
                        <a id="news_management" class="nav-link function" href="tables1.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-bullhorn"></i></div>
                           	 �޲z�̷s����
                        </a>
                        <a id="customer_service" class="nav-link function" href="tables2.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-hands-helping"></i></div>
                       	     	�^���ȪA�p����
                        </a>
                    </div>
                </div>
            </nav>
        </div>
            
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
<%--                         <a href="<%=request.getContextPath()%>/back-end/order/addOrder.jsp" class="btn btn-primary btn-lg" ><i class="material-icons">&#xE147;&ensp;</i><span>�s�W�q��</span></a> --%>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                                        <thead style="background-color:#9099AA; color:white;; white-space: nowrap;" >
                                            <tr>
                                           		<th>�q��<br>�s��</th>
												<th>�|��<br>�s��</th>
												<th>����<br>�s��</th>
												<th>����<br>�ɶ�</th>
												<th>�q��<br>���A</th>
												<th>�q��<br>����</th>
												<th>�I��<br>�覡</th>
												<th>�q��<br>�`��</th>
												<th>�y��</th>
<!-- 												<th>�d��</th> -->
												<th>����</th>
												<th>�h��</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<tr  ${(orderVO.order_no == param.order_no) ? 'style="background-color:#C9B8DC;"':''}>
												<td>${orderVO.order_no}</td>
												<td>${memSvc.getOneMem(orderVO.member_no).mb_name}</td>
												<td>${orderVO.showtime_no}</td>
												<td>${df.format(orderVO.crt_dt)}</td>
												<td id="order_status">
													<c:choose>
														<c:when test="${orderVO.order_status == 0 }">
															���I��
														</c:when>
														<c:when test="${orderVO.order_status == 1 }">
															�w�I��
														</c:when>
														<c:when test="${orderVO.order_status == 2 }">
															�w����
														</c:when>
														<c:when test="${orderVO.order_status == 3 }">
															�w����
														</c:when>
													</c:choose>
												</td>
												<td id="order_type">${orderVO.order_type == 0 ? "�{��" : "�u�W"}</td>
												<td>
													<c:choose>
														<c:when test="${orderVO.payment_type == 0 }">
															�H�Υd
														</c:when>
														<c:when test="${orderVO.payment_type == 1 }">
															�{��
														</c:when>
														<c:when test="${orderVO.payment_type == 2 }">
															�{���I��
														</c:when>
													</c:choose>
												</td>
												<td>${orderVO.total_price }</td>
												<td>${orderVO.seat_name}</td>
											
<!-- 											<td> -->
<%-- 											  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" style="margin-bottom: 0px;"> --%>
<!-- 											     <input type="submit" value="�d��" -->
<!-- 											     class="btn btn-outline-danger" style="border:2px #B7B7B7 solid;border-radius:10px; background-color:#F5CA5E; font-weight:bold; color:white;"> -->
<%-- 											     <input type="hidden" name="order_no"  value="${orderVO.order_no}"> --%>
<!-- 											     <input type="hidden" name="action"	value="getOne_For_Order"></FORM> -->
<!-- 											</td> -->
											
											<td>
											     <input type="button" value="����" id="btn"
											     class="btn btn-outline-danger" style="border:2px #B7B7B7 solid;border-radius:10px; background-color:#73BDBE; font-weight:bold; color:white;">
											     <input type="hidden" name="order_no"  value="${orderVO.order_no}">
											     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
											</td>
											
											<td>
<%-- 											  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" style="margin-bottom: 0px;"> --%>
											     <input type="submit" name="cancel" value="�h��"
											     class="btn btn-outline-danger" style="border:2px #B7B7B7 solid;border-radius:10px; background-color:#FC9C9D; font-weight:bold; color:white;">
											     <input type="hidden" name="order_no"  value="${orderVO.order_no}">
											</td>
										</tr>
                                            <tr>
<!--                                                 <td></td> -->
<!--                                                 <td></td> -->
<!--                                                 <td></td> -->
<!--                                                 <td></td> -->
<!--                                                 <td></td> -->
<!--                                                 <td></td> -->
                                            </tr>
                                         
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>
                    
                    
                   <div class="container-fluid">
                        <h1 class="mt-4" style="text-align:center; font-weight:bolder;">����</h1>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                                        <thead style="background-color:#707070; color:white;; white-space: nowrap;" >
                                            <tr>
                                           		<th>�q��<br>�s��</th>
												<th>����<br>�s��</th>
												<th>����<br>�ƶq</th>
												<th>����<br>����</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="ord_ticket_typeVO" items="${list}">
											<c:forEach var="ticket_typeVO" items="${ticket_typeSvc.all}">
												<c:if test="${ord_ticket_typeVO.ticket_type_no == ticket_typeVO.ticket_type_no}">
		                                        	<tr>
														<td>${ord_ticket_typeVO.order_no}</td>
														<td>${ticket_typeVO.ticket_desc}</td>
														<td>${ord_ticket_typeVO.ticket_count}</td>
														<td>${ord_ticket_typeVO.price}</td>
													</tr>
											 	</c:if>
											</c:forEach>
										</c:forEach>
<!-- 										<tr> -->
<!-- 										</tr> -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>
                    
                    
                    
                   <div class="container-fluid">
                        <h1 class="mt-4" style="text-align:center; font-weight:bolder;">�\�I</h1>
<%--                         <a href="<%=request.getContextPath()%>/back-end/order/addOrder.jsp" class="btn btn-primary btn-lg" ><i class="material-icons">&#xE147;&ensp;</i><span>�s�W�q��</span></a> --%>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                                        <thead style="background-color:#9099AA; color:white;; white-space: nowrap;" >
                                            <tr>
                                           		<th>�q��<br>�s��</th>
												<th>�\�I<br>�s��</th>
												<th>�\�I<br>�ƶq</th>
												<th>�\�I<br>����</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="ord_foodVO" items="${list1}">
											<c:forEach var="foodVO" items="${foodSvc.all}">
												<c:if test="${ord_foodVO.food_no == foodVO.food_no}">
		                                        	<tr>
														<td>${ord_foodVO.order_no}</td>
														<td>${foodVO.food_name}</td>
														<td>${ord_foodVO.food_count}</td>
														<td>${ord_foodVO.price}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:forEach>
<!-- 										<tr> -->
<!-- 										</tr> -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>
                    
                </main>
            </div>
        
        
        </div>
 		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/back-home/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/back-home/dist/assets/demo/datatables-demo.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
		
 <script>
 	$("input[name=cancel]").click(function(){
 		
 		let $status = $(this);
 		$.ajax({
			url: "<%=request.getContextPath()%>/order/order.do",
			type: "POST",
			data:{
				action: "cancel_booking",
				order_no: $(this).next().val(),
			},
			success: function(data){
				swal.fire({
					icon:'success',
					text:'�h�����\',
					showConfirmButton: false,
					timer: 1000
				});
				$("#order_status").text("�w����");
				}
		});
 		
 	})
 	
 	$("#btn").click(function(){
    	$.ajax({
    		url: "<%=request.getContextPath()%>/order/order.do",
    		type: "POST",
    		data: {	action: "update_status", 
    			   	order_no: "${orderVO.order_no}"
    		},
    		success: function(){
    			}
    	});
    	
		swal.fire({
			icon:'success',
			text:'�������\',
			showConfirmButton: false,
			timer: 1500
			
		});
		$("#order_status").text("�w����")
		$("#order_type").text("�H�Υd")
		$("#button").hide();
	});
 	
 	
 </script>
</body>
    

</html>