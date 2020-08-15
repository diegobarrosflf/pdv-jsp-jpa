<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="seguranca.jsp" />

<html>
	<head>
		<title>PDV - Ponto de Vendas</title>

		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<style type="text/css">

		</style>
	</head>
	<body>	
		
		<div id="pagina">
			<jsp:include page="topo.jsp" />
			<jsp:include page="menu.jsp" />
			<div id="corpo">				
				<div id="conteudo">
					<br/>
					<span class="tituloPagina">Bem vindo.</span>			
				</div>
			</div>
		</div>		
	</body>
</html>