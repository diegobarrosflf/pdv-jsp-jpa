<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>PDV - Ponto de Vendas - Login</title>
		
		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<style type="text/css">
			body{
				margin: 0px;
				background-color: #030303;
			}
			#divFormulario {
				float: inherit;
				width: 260px;
				margin-left: auto;
				margin-right: auto;
			}
			.divCampo {
				float: left;
			}
			.divLabel {
				width: 100px;
				float: left;
				text-align: left;
			}
			#botaoEntrar {
				width: 100px;
				height: 30px;
				background-color: #0c0c0c;
				color: white;				
			}
		</style>
	</head>
	<body>
		<%! int contador = 0; %>
		<div id="paginaLogin">
			<img src="img/logo_2.png" />
			<%if (contador < 4) { contador++;%>
			<div id="formularioLogin" >
				<form id="login" action="Login" method="POST" >
					<c:if test="${not empty requestScope.falhaLogin}" >
						<div class="erro">${requestScope.falhaLogin}<br /><br /></div>	
					</c:if>									
					<div id="divFormulario">	
						<div class="divLabel" >Usu&aacute;rio</div>
						<div class="divCampo" ><input type="text" name="username" value="${param.username}" /></div>
						<br clear="all"/>
						<div class="divLabel" >Senha</div>
						<div class="divCampo" ><input type="password" name="password" /></div>
						<br clear="all"/><br clear="all"/>
						<input type="submit" name="submit" id="botaoEntrar" value="Entrar" />
					</div>
				</form>
			</div>
			<%} else{ %>
				<div class="erro">Você falhou 3 vezes na tentativa de login. Seu acesso está suspenso!<br /><br /></div>
				<%} %>										
		</div>
		
		<br/>
		
	</body>
</html>