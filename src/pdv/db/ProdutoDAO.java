package pdv.db;

import java.util.List;

import javax.persistence.EntityManager;

import pdv.bean.Produto;

public class ProdutoDAO {
	
	private Integer idProduto;
	private String filtroNome;
	private String filtroCategoria;
	private String filtroTipoPreco;
	private String filtroPreco;
	
	public ProdutoDAO() {
		idProduto = 0;
		filtroNome = "";
		filtroPreco = "";
		filtroTipoPreco = "";
		filtroCategoria = "";
	}
	
	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}
	
	public List getProdutos(){
		
		EntityManager em = EMFactory.obterEM();
		
		if(filtroCategoria == null && filtroPreco == null && filtroNome == null){
			return em.createNamedQuery("todosProdutos").getResultList();
		}else{
			/* Busca Filtrada */
			String query = "FROM Produto p WHERE 1=1 ";
			if(!filtroNome.isEmpty()){
				query += "AND p.nome LIKE '" + filtroNome + "%' "; // ATENÇÂO: uso de %
			}
			if(!filtroPreco.isEmpty() && !filtroTipoPreco.isEmpty()){
				/* Correção de formato de Preço */
				String vUnit = filtroPreco.replace('.', (char)0).replace(',', '.');
				query += "AND p.valorUnitario " + filtroTipoPreco + " " + vUnit + " ";
			}
			if(!filtroCategoria.isEmpty() && !filtroCategoria.equals("0")){
				query += "AND p.categoria = " + filtroCategoria;
			}
						
			List resultados = em.createQuery(query).getResultList();
			return resultados;
		}
		
	}
	
	public Produto getProduto(){
		
		EntityManager em = EMFactory.obterEM();
		return em.find(Produto.class, idProduto);
	}
	
	public boolean salvarProduto(Produto p){
		
		EntityManager em = EMFactory.obterEM();
		em.getTransaction().begin();
		
		if(p.getId() != null && p.getId() > 0){
			
			String query = "UPDATE Produto p SET ";
			if(p.getNome() != null){
				query += "p.nome = '" + p.getNome() + "' ";
			}
			/*
			 * TODO: Tratamento para upload de Imagem
			 */
			if(p.getCategoria() != null){
				query += ", p.categoria = '" + p.getCategoria().getId() + "' ";
			}						
			if(p.getValorUnitario() != null){
				query += ", p.valorUnitario = " + p.getValorUnitario() + " ";
			}
			if(p.getQtdEstoque() != null){
				query += ", p.qtdEstoque = " + p.getQtdEstoque() + " ";
			}
			if(p.getValorUnitario() != null){
				query += ", p.valorUnitario = " + p.getValorUnitario() + " ";
			}
			
			/* Fixo - Checkbox */
			query += ", p.promocao = " + p.isPromocao() + " ";
			/* Fixo - Raddiobutton */
			query += ", p.estado = '" + p.getEstado() + "' ";
			
			query += "WHERE p.id = " + p.getId();
			
			em.createQuery(query).executeUpdate();
			
		}else{
			em.persist(p);
		}
		
		em.getTransaction().commit();
		em.close();
		return true;
	}
	
	public boolean excluirProduto(Integer idProduto){
		
		EntityManager em = EMFactory.obterEM();
		em.getTransaction().begin();
		
		Produto p = (Produto)em.find(Produto.class, idProduto);
		em.remove(p);
		
		em.getTransaction().commit();
		em.close();
		return true;
	}
	
	/* Seção de Getters e Setters para os filtros */

	public String getFiltroNome() {
		return filtroNome;
	}

	public void setFiltroNome(String filtroNome) {
		this.filtroNome = filtroNome;
	}

	public String getFiltroCategoria() {
		return filtroCategoria;
	}

	public void setFiltroCategoria(String filtroCategoria) {
		this.filtroCategoria = filtroCategoria;
	}

	public String getFiltroTipoPreco() {
		return filtroTipoPreco;
	}

	public void setFiltroTipoPreco(String filtroTipoPreco) {
		this.filtroTipoPreco = filtroTipoPreco;
	}

	public String getFiltroPreco() {
		return filtroPreco;
	}

	public void setFiltroPreco(String filtroPreco) {
		this.filtroPreco = filtroPreco;
	}

	public Integer getIdProduto() {
		return idProduto;
	}
	
}

