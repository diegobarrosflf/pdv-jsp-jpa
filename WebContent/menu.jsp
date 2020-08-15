<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="menu">	

	<%-- Menu Fixo --%>
	<div class="menu_" >
		<a href="index.jsp">Home</a>					
	</div>

	<%-- Menus Dinamicos --%>
	<c:forEach var="menu" items="${menus}">
	<div class="menu_">
		<a href="${menu.url}">${menu.titulo}</a>&nbsp;
		<!--  <img src="separador_menu.png" />  -->
	</div>
	</c:forEach>				
	
	<%-- Menu Fixo --%>
	<div class="menu_" >
		<a href="Logout">Sair</a>				
	</div>	
	
</div>