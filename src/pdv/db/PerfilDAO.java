package pdv.db;

import java.util.List;

import javax.persistence.EntityManager;

import pdv.bean.Usuario;

public class PerfilDAO {
	
public List<Usuario> getPerfis(){
		
		EntityManager em = EMFactory.obterEM();
		List p = em.createNamedQuery("todosPerfis").getResultList();
		
		if(p != null && p.size() > 0){
			return p;			
		}
				
		return null;
	}

}
