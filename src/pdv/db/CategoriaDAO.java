package pdv.db;

import java.util.List;

import javax.persistence.EntityManager;

public class CategoriaDAO {
	
public List getCategorias(){
		
		EntityManager em = EMFactory.obterEM();
		List c = em.createNamedQuery("todasCategorias").getResultList();
		
		if(c != null && c.size() > 0){
			return c;			
		}
				
		return null;
	}

}
