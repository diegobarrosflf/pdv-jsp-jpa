<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="seguranca.jsp" />

<html>

	<head>
		<title>PDV - Erro</title>

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
				
					<br />
					<span class="tituloPagina">Bem, algo est&aacute; errado...</span>
					<br clear="all" /><br clear="all" />
					
					Alguma p&aacute;gina que voc&ecirc; est&aacute; tentando acessar n&atilde;o existe no
					nosso servidor.<br>Por favor, verifique o endere&ccedil;o da p&aacute;gina ou comece novamente
					a navega&ccedil;&atilde;o.<br/>Lamentados o inconveniente. 
										
				</div>
			</div>
		</div>		
	</body>
</html>