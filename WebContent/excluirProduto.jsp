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
					
					<jsp:useBean id="produtoDAO" class="pdv.db.ProdutoDAO" >
						<jsp:setProperty name="produtoDAO" property="idProduto" value="${param.id}" /> 
					</jsp:useBean>	
					
					<c:if test="${empty p}">
						<c:set var="p" value="${produtoDAO.produto}" />
					</c:if>
					
					<form method="post" action="SalvarProduto"  >
					
						<input type="hidden" name="id" value="${p.id}" />
						
						<span class="alertaExclusao">
							Tem certeza que deseja excluir o produto<br/>
							&quot;${p.nome}&quot;&#91;${p.categoria.nome}&#93;?
						</span>
						
						<br/><br/>
						<input type="hidden" name="acao" value="salvar" />
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