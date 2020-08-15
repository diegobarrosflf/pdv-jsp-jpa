package pdv.db;

import java.util.List;

import javax.persistence.EntityManager;

import pdv.bean.Usuario;

public class UsuarioDAO {
	
	private Integer idUsuario;
	
	public UsuarioDAO() {
		idUsuario = 0;
	}
	
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public List<Usuario> getUsuarios(){
		
		EntityManager em = EMFactory.obterEM();
		List u = em.createNamedQuery("todosUsuarios").getResultList();
		
		if(u != null && u.size() > 0){
			return u;			
		}
				
		return null;
	}
	
	public Usuario getUsuario(){
		
		EntityManager em = EMFactory.obterEM();
		return em.find(Usuario.class, idUsuario);
	}
	
	public boolean salvarUsuario(Usuario u){
		
		EntityManager em = EMFactory.obterEM();
		em.getTransaction().begin();
		
		if(u.getId() != null && u.getId() > 0){
			
			String query = "UPDATE Usuario u SET ";
			if(u.getNome() != null){
				query += "u.nome = '" + u.getNome() + "' ";
			}
			if(u.getPerfil() != null){
				query += ", u.perfil = " + u.getPerfil().getId() + " ";
			}
			if(u.getUsername() != null){
				query += ", u.username = '" + u.getUsername() + "' ";
			}
			if(u.getPassword() != null){
				query += ", u.password = '" + u.getPassword() + "' ";
			}
			
			query += "WHERE u.id = " + u.getId();
			
			em.createQuery(query).executeUpdate();
			
		}else{
			em.persist(u);
		}
		
		em.getTransaction().commit();
		em.close();
		return true;
	}
	
	public boolean excluirUsuario(Integer idUsuario){
		
		EntityManager em = EMFactory.obterEM();
		em.getTransaction().begin();
		
		Usuario u = (Usuario)em.find(Usuario.class, idUsuario);
		em.remove(u);
		
		em.getTransaction().commit();
		em.close();
		return true;
	}

}
