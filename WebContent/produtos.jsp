<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="seguranca.jsp" />

<html>

	<head>
		<title>PDV - Produtos</title>

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
					<span class="tituloPagina">Lista de Produtos - Estoque</span>
					<br /><br />
					<div id="filtro" >
						<form action="">
							<fieldset >
								<legend>Filtro</legend>
								Nome&nbsp;<input type="text" name="filtroNome" value="${param.filtroNome}" />&nbsp;
								Categoria&nbsp;
								<select style="width:100px" name="filtroCategoria" >
									<option value="0">Todas</option>
									<jsp:useBean id="categoriaDAO" class="pdv.db.CategoriaDAO" />
									<c:forEach var="c" items="${categoriaDAO.categorias}">
										<option value="${c.id}"
											<c:if test="${param.filtroCategoria eq c.id}" >
												selected="selected"
											</c:if>
										>${c.nome}</option>
									</c:forEach>	
								</select>&nbsp;
								Pre&ccedil;o&nbsp;				
								<c:set var="sel" value="selected=\"selected\"" />				
								<select  name="filtroTipoPreco" >
										<option ${param.filtroTipoPreco eq "<=" ? sel : ""} value="<=">Menor que</option>
										<option ${param.filtroTipoPreco eq "=" ? sel : ""} value="=">Igual a </option>
										<option ${param.filtroTipoPreco eq ">=" ? sel : ""} value=">=">Maior que</option>
								</select>
								<input style="width:100px" type="text" name="filtroPreco" value="${param.filtroPreco}" />&nbsp;
								Promoção
									<select name="filtroPromocao">
										<option value=""></option>
										<option value="1">sim</option>
										<option value="0">não</option>
									</select>
								<input type="submit" name="filtrar" value="Filtrar" />
							</fieldset>
						</form>
					</div>
					<br />
					
					<%-- Definição dos parâmetros de busca, caso existam --%>
					<jsp:useBean id="produtoDAO" class="pdv.db.ProdutoDAO" >
							<jsp:setProperty name="produtoDAO" property="filtroNome" value="${param.filtroNome}" />
							<jsp:setProperty name="produtoDAO" property="filtroCategoria" value="${param.filtroCategoria}" />
							<jsp:setProperty name="produtoDAO" property="filtroPreco" value="${param.filtroPreco}" />
							<jsp:setProperty name="produtoDAO" property="filtroTipoPreco" value="${param.filtroTipoPreco}" />
							<jsp:setProperty name="produtoDAO" property="filtroPromocao" value="${param.filtroPromocao}" />
					</jsp:useBean>
					
					<form action="Produtos" method="post" >
					<table id="tabela">
						<tr>
							<td ><strong>Nome</strong></td>
							<td align="center" width="150px"><strong>Categoria</strong></td>
							<td  align="center" width="100px"><strong>Vl. Unit.</strong></td>
							<td  align="center" width="100px"><strong>Estoque</strong></td>
							<td width="50px"><strong>A&ccedil;&otilde;es</strong></td>
						</tr>
						<c:forEach var="p" items="${produtoDAO.produtos}">
							<tr class="linhaSombreadaSelecionada">
								<td>${p.nome}</td>
								<td align="center">${p.categoria.nome}</td>
								<td align="center"><fmt:formatNumber pattern="R$ #.00" value="${p.valorUnitario}" /></td>
								<td align="center">${p.qtdEstoque}</td>
								<td>
									<a href="cadastrarProduto.jsp?id=${p.id}"><img class="icone" alt="Editar" src="img/icones/1341275872_gtk-edit.png"></a>
									<a href="excluirProduto.jsp?id=${p.id}"><img class="icone" alt="Editar" src="img/icones/1341275870_dialog-close.png"></a>
								</td>
							</tr>
						</c:forEach>		
					</table>
					<br/>
					<input type="submit" name="novo" value="Novo Produto" >
					<br/><br/>
					</form>										
				</div>
			</div>
		</div>		
	</body>
</html>