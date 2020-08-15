package pdv.business;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pdv.bean.Usuario;
import pdv.db.EMFactory;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
	    dispatcher.forward(req, resp);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password= request.getParameter("password");
		
		try{
		
			EntityManager em = EMFactory.obterEM();
			Query q = em.createNamedQuery("login");
			Object u = q.setParameter("usr", username)
					.setParameter("pwd", password).getSingleResult();		
			
			if(u != null){			
				
				Usuario usuario = (Usuario)u;
				request.getSession().setAttribute("usuario", usuario);
				
				q = null;
				q = em.createNamedQuery("menusPorPerfil");
				List menus = q.setParameter("nivel", usuario.getPerfil()
						.getNivel()).getResultList();
				request.getSession().setAttribute("menus", menus);				
				
				response.sendRedirect("index.jsp");
			}
			
		}catch(Exception e){
			request.setAttribute("falhaLogin", "Nome de usuário ou senha inválidos.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);			
		}
		
	}

}
