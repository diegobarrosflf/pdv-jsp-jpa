<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="seguranca.jsp" />

<html>

	<head>
		<title>PDV - Usuário</title>

		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<style type="text/css">

		</style>		
		
		<script type="text/javascript">
			function confirmarExclusao(){
				document.forms[0].acao.value = "excluir";
				document.forms[0].submit();
			}
		</script>
	
	</head>
	
	<body>	
		
		<div id="pagina">
			
			<c:import url="topo.jsp" />

			<c:import url="menu.jsp" />
			
			<div id="corpo">				
				<div id="conteudo">
					<br/>
					
					<jsp:useBean id="usuarioDAO" class="pdv.db.UsuarioDAO" >
						<jsp:setProperty name="usuarioDAO" property="idUsuario" value="${param.id}" /> 
					</jsp:useBean>	
					
					<c:set var="u" value="${usuarioDAO.usuario}" />
					
					<form method="post" action="GerenciarUsuario"  >
					
						<input type="hidden" name="id" value="${u.id}" />
						
						<span class="alertaExclusao">
							Tem certeza que deseja excluir o usu&aacute;rio<br/>
							${u.nome}&#91;${u.perfil.nome}&#93;?
						</span>
						
						<br/><br/>
						<input type="hidden" name="acao" value="cancelar" />
						<input type="button" value="Excluir" onclick="confirmarExclusao()" >
						<input type="submit" name="cancelar" value="Cancelar" >&nbsp;						
						<br/><br/>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
</body>