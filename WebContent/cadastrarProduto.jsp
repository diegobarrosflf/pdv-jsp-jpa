<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="seguranca.jsp" />

<html>

	<head>
		<title>PDV - Produto</title>

		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<style type="text/css">

		</style>
		
		<script type="text/javascript">
			function confirmarExclusao(){
				var confirmacao = window.confirm("Tem certeza que deseja excluir esse produto?");
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
					<span class="tituloPagina">Produto</span>&nbsp;
					<c:if test="${not empty msgSucesso}">
						<br/><span class="msgSucesso">${msgSucesso}</span>
					</c:if>
					<br/><br/>
					
					<jsp:useBean id="produtoDAO" class="pdv.db.ProdutoDAO" >
						<jsp:setProperty name="produtoDAO" property="idProduto" value="${param.id}" /> 
					</jsp:useBean>	
					
					<c:if test="${empty p}">
						<c:set var="p" value="${produtoDAO.produto}" />
					</c:if>
					
					<form method="post" action="SalvarProduto"  >
					
						<input type="hidden" name="id" value="${p.id}" />
						<table id="tabela">		
							<tr>
								<td width="200px"><strong>Nome</strong></td>
								<td><input name="nome" type="text" value="${p.nome}" /></td>
							</tr>
							<tr> 
								<td ><strong>Categoria</strong></td>
								<td>
									<select name="categoria" >
										<jsp:useBean id="categoriaDAO" class="pdv.db.CategoriaDAO" />
										<c:forEach var="c" items="${categoriaDAO.categorias}">							
											<option value="${c.id}"
												<c:if test="${p.categoria.id eq c.id}" >
													selected="selected"
												</c:if>
											>${c.nome}</option>
										</c:forEach>	
									</select>
								</td>
							</tr>							
							<tr>
								<td ><strong>Estado</strong></td>
								<td>
									<c:forEach var="opcao" items="${fn:split('Novo,Devolução,Mostruário',',')}" >
									<c:set var="codigoEstado" value="${fn:substring(opcao,0,1)}" />
										<input type="radio" value="${codigoEstado}" ${p.estado eq codigoEstado ? 'checked="checked"' : ''} name="estado" />${opcao}&nbsp;
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td ><strong>Promo&ccedil;&atilde;o</strong></td>
								<td><input type="checkbox" name="promocao" 
									<c:if test="${p.promocao == true}" >
												checked="checked"
									</c:if> /> 
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="2"><h3>Estoque</h3></td>
							</tr>
							<tr>
								<td ><strong>Estoque Atual</strong></td>
								<td><input name="qtdEstoque" type="text" value="${p.qtdEstoque}" size="4" /></td>
							</tr>
							<tr>
								<td ><strong>Valor Uni&aacute;rio</strong></td>
								<td>R$&nbsp;<input name="valorUnitario" type="text" size="6" value="<fmt:formatNumber pattern="#.00" value="${p.valorUnitario}" />" /></td>
							</tr>
										
						</table>
						<br/>
							<input type="hidden" name="acao" value="salvar" />
							<input type="submit" name="salvar" value="Salvar" >&nbsp;						
							<c:if test="${not empty p.id}">
								<input type="button" value="Excluir" onclick="confirmarExclusao()" >
							</c:if>
						</form>
						<br/><br/>
				</div>
			</div>
		</div>
	</body>
</html>
</body>