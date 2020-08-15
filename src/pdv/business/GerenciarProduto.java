package pdv.business;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pdv.bean.Categoria;
import pdv.bean.Produto;
import pdv.db.ProdutoDAO;

public class GerenciarProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GerenciarProduto() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Produto p = new Produto();
		Integer idProduto = null;
		
		if(!request.getParameter("id").isEmpty()){
			idProduto = new Integer(request.getParameter("id"));
			p.setId(idProduto);
		}
		
		/**
		 * Teste do Atributo 'acao'
		 * > excluir : efetua a exclusão do produto e retorna à página de listagem
		 * > cancelar: apenas retorna à página de listagem
		 */
		if(request.getParameter("acao").equals("excluir") || 
				request.getParameter("acao").equals("cancelar")){
			if(request.getParameter("acao").equals("excluir") && idProduto != null)
				new ProdutoDAO().excluirProduto(idProduto);
			
			response.sendRedirect("produtos.jsp");
			return;
		}
				
		if(!request.getParameter("nome").isEmpty()){
			p.setNome(request.getParameter("nome"));
		}
		
		if(!request.getParameter("estado").isEmpty()){
			p.setEstado(request.getParameter("estado"));
		}
		
		if(!request.getParameter("categoria").isEmpty()){
			Integer idCategoria = new Integer(request.getParameter("categoria"));
			Categoria c = new Categoria();
			c.setId(idCategoria);
			p.setCategoria(c);
		}
		
		if(!request.getParameter("qtdEstoque").isEmpty()){
			p.setQtdEstoque(new Integer(request.getParameter("qtdEstoque")));
		}
		
		if(!request.getParameter("valorUnitario").isEmpty()){
			String vUnit = request.getParameter("valorUnitario").replace('.', (char)0).replace(',', '.');			
			p.setValorUnitario(new Double(vUnit));
		}
		
		/*
		 * Criando / Atualizando produtos
		 */
		ProdutoDAO pDAO = new ProdutoDAO();
		pDAO.salvarProduto(p);
		
		/*
		 * Encaminhamento
		 */
		request.setAttribute("msgSucesso", "Dados salvos com sucesso.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarProduto.jsp?id=" + p.getId());
	    dispatcher.forward(request, response);

	}

}
