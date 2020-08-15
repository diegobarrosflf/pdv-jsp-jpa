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
				var confirmacao = window.confirm("Tem certeza que deseja excluir esse usuário?");
				if (confirmacao){
					document.forms[0].acao.value = "excluir";
					document.forms[0].submit();
				}
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
					<span class="tituloPagina">Usu&aacute;rio</span>&nbsp;
					<c:if test="${not empty msgSucesso}">
						<br/><span class="msgSucesso">${msgSucesso}</span>
					</c:if>
					<br/><br/>
					
					<jsp:useBean id="usuarioDAO" class="pdv.db.UsuarioDAO" >
						<jsp:setProperty name="usuarioDAO" property="idUsuario" value="${param.id}" /> 
					</jsp:useBean>	
					
					<c:set var="u" value="${usuarioDAO.usuario}" />
					
					<jsp:useBean id="perfilDAO" class="pdv.db.PerfilDAO" />
					
					<form method="post" action="GerenciarUsuario" >
					
						<input type="hidden" name="id" value="${u.id}" />
						<table id="tabelaUsuario">		
							<tr>
								<td ><strong>Nome</strong></td>
								<td><input name="nome" type="text" value="${u.nome}" /></td>
							</tr>
							<tr> 
								<td width="200px" ><strong>Perfil</strong></td>
								<td>
									<select name="perfil" >
										<c:forEach var="p" items="${perfilDAO.perfis}">							
											<option value="${p.id}"
												<c:if test="${u.perfil.id eq p.id}" >
													selected="selected"
												</c:if>
											>${p.nome}</option>
										</c:forEach>	
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="2"><h3>Dados de Acesso</h3></td>
							</tr>
							<tr>
								<td ><strong>Nome de Usu&aacute;rio</strong></td>
								<td><input name="username" type="text" value="${u.username}" /></td>
							</tr>
							<tr>
								<td ><strong>Senha</strong></td>
								<td><input name="password" type="password" /></td>
							</tr>
							<tr>
								<td ><strong>Confirmar Senha</strong></td>
								<td><input name="password_conf" type="password" />
								<span class="msgFalha">${falhaSenha}</span></td>
							</tr>					
						</table>
						<br/>
						<input type="hidden" name="acao" value="salvar" />						
						<input type="submit" name="salvar" value="Salvar" >&nbsp;						
						<c:if test="${not empty u.id}">
							<input type="button" value="Excluir" onclick="confirmarExclusao()" >
						</c:if>						
						<br/>
						<br/>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
</body>