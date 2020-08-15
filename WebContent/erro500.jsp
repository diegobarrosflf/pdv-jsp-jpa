<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="seguranca.jsp" />

<html>

	<head>
		<title>PDV - Erro</title>

		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<style type="text/css">

		</style>
	</head>
	
	<body>	
		
		<div id="pagina">
			
			<c:import url="topo.jsp" />

			<c:import url="menu.jsp" />
			
			<div id="corpo">				
				<div id="conteudo">
				
					<br />
					<span class="tituloPagina">Bem, algo est&aacute; errado...</span>
					<br clear="all" /><br clear="all" />
					
					Ocorreu um erro interno no servidor durante o processamento da sua requisi&ccedil;&atilde;o.<br/>
					Lamentados o inconveniente. 
										
				</div>
			</div>
		</div>		
	</body>
</html>