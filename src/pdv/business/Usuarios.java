package pdv.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Usuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Usuarios() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!request.getParameter("novo").isEmpty()){
			response.sendRedirect("cadastrarUsuario.jsp");
			return;
		}
		
		
	}

}
