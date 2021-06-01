<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib  prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html "about:legacy-compat">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="author" content="ask" />
		
		<title><tiles:insertAttribute name="title" ignore="true" /></title>
		<link href="images/favicon1.ico" rel="icon" type="image/x-icon">
		<!-- CSS Section -->
		<common:styleSheets/>
		
	</head>
	
	<sec:authorize access="isAuthenticated()">
		<c:set var="isAuthenticated" value="true"/>
	</sec:authorize>
	<body class="navbar-fixed ${isAuthenticated ? 'sidebar-nav' : '' } fixed-nav">
	<!-- JavaScript Section -->
		<common:javaScripts/>
		
		<div id="wrapper">
			<!-- Header Section -->
			<tiles:insertAttribute name="header" />
			
			<!-- Sidebar Nav : Section -->
			<tiles:insertAttribute name="sidebar-nav" />
			
			<!-- Body : Section -->
			<!-- Main content -->
			<main class="main">
				<div class="container">
					<tiles:insertAttribute name="body" />
				</div>
			</main>
		<!-- Footer Section -->
			<tiles:insertAttribute name="footer" />
		</div>
	</body>

</html>