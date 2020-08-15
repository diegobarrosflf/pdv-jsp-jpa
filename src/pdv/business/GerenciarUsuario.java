package pdv.business;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pdv.bean.Perfil;
import pdv.bean.Usuario;
import pdv.db.UsuarioDAO;

public class GerenciarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GerenciarUsuario() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario u = new Usuario();
		Integer idUsuario = null;
		
		if(!request.getParameter("id").isEmpty()){
			idUsuario = new Integer(request.getParameter("id")); 
			u.setId(idUsuario);
		}
		
		/**
		 * Teste do Atributo 'acao'
		 * > excluir : efetua a exclusão do usuário e retorna à página de listagem
		 * > cancelar: apenas retorna à página de listagem
		 */
		if(request.getParameter("acao").equals("excluir") || 
				request.getParameter("acao").equals("cancelar")){
			if(request.getParameter("acao").equals("excluir") && idUsuario != null)
				new UsuarioDAO().excluirUsuario(idUsuario);
			
			response.sendRedirect("usuarios.jsp");
			return;
		}
				
		if(!request.getParameter("nome").isEmpty()){
			u.setNome(request.getParameter("nome"));
		}
		
		if(!request.getParameter("perfil").isEmpty()){
			Integer idPerfil = new Integer(request.getParameter("perfil"));
			Perfil p = new Perfil();
			p.setId(idPerfil);
			u.setPerfil(p);
		}
		
		if(!request.getParameter("username").isEmpty()){
			u.setUsername(request.getParameter("username"));
		}
		
		if(!request.getParameter("password").isEmpty() || !request.getParameter("password_conf").isEmpty()){
			if(request.getParameter("password").equals(request.getParameter("password_conf"))){
				u.setPassword(request.getParameter("password"));
			}else{
				request.setAttribute("falhaSenha", "Confirmação de senha incorreta.");
				request.setAttribute("u", u);
				RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarUsuario.jsp?id=" + u.getId());
			    dispatcher.forward(request, response);
			    return;
			}
		}
		
		/*
		 * Criando / Atualizando usuário
		 */
		UsuarioDAO uDAO = new UsuarioDAO();
		uDAO.salvarUsuario(u);
		
		/*
		 * Encaminhamento
		 */
		request.setAttribute("msgSucesso", "Dados salvos com sucesso.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarUsuario.jsp?id=" + u.getId());
	    dispatcher.forward(request, response);
		
		
	}

}
