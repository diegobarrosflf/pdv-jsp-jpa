<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="seguranca.jsp" />

<html>

	<head>
		<title>PDV - Usuários</title>

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
					<span class="tituloPagina">Lista de Usu&aacute;rios</span>
					<br clear="all" />
					
					<jsp:useBean id="usuarioDAO" class="pdv.db.UsuarioDAO" />
					
					<form action="Usuarios" method="post" >
					<table id="tabela">
						<tr>
							<td><strong>Nome</strong></td>
							<td><strong>Perfil</strong></td>
							<td><strong>A&ccedil;&otilde;es</strong></td>
						</tr>
						<c:set var="sombra" value="${false}" />
						<c:forEach var="u" items="${usuarioDAO.usuarios}">
							<tr class="${sombra ? 'linhaSombreada' : ''}" >
								<td>${u.nome}</td>
								<td>${u.perfil.nome}</td>
								<td>
									<a href="cadastrarUsuario.jsp?id=${u.id}"><img class="icone" alt="Editar" src="img/icones/1341275872_gtk-edit.png"></a>
									<a href="excluirUsuario.jsp?id=${u.id}"><img class="icone" alt="Editar" src="img/icones/1341275870_dialog-close.png"></a>
								</td>
							</tr>
							<c:set var="sombra" value="${!sombra}" />
						</c:forEach>		
					</table>
					<br/>
					<input type="submit" name="novo" value="Novo Usu&aacute;rio" >
					<br/>
					</form>										
				</div>
			</div>
		</div>		
	</body>
</html>