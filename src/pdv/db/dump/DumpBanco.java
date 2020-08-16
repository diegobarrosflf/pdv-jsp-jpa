package pdv.db.dump;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import pdv.bean.Categoria;
import pdv.bean.Menu;
import pdv.bean.Perfil;
import pdv.bean.Produto;
import pdv.bean.Usuario;

public class DumpBanco {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("Come�o");
		
		EntityManager em = null;
		EntityManagerFactory emf = null;
		try {
			
			Properties pp = new Properties();
			pp.setProperty("hibernate.hbm2ddl.auto", "create");
 
			emf = Persistence.createEntityManagerFactory("PDV-AULA03",pp);
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			HashMap<Integer, String > perfis = new HashMap();
			perfis.put(0, "Admin");
			perfis.put(1, "Gerente");
			perfis.put(2, "Vendedor");
			
			for(Integer nivel : perfis.keySet()){
				Perfil p = new Perfil();
				p.setNome(perfis.get(nivel));
				p.setNivel(nivel);				
				em.persist(p);
			}
			
			/* ATENCAO */
			em.getTransaction().commit();
			em.getTransaction().begin();
			
			HashMap<String, Integer> usuarios = new HashMap();
			usuarios.put("Admin 1", 0);
			usuarios.put("Eduardo", 1);
			usuarios.put("Fabio", 2);
			usuarios.put("Ana", 2);
			usuarios.put("Carlos", 2);
			usuarios.put("Admin 2", 0);
			
			for(String nome : usuarios.keySet()){
				Usuario u = new Usuario();
				u.setNome(nome);
				u.setUsername(nome.trim().toLowerCase());
				u.setPassword("1234");
				
				Query q = em.createQuery("FROM Perfil WHERE nivel = " + usuarios.get(nome));
				Perfil p = (Perfil)q.getSingleResult();
				u.setPerfil(p);
				
				em.persist(u);
			}
			
			/* ATENCAO */
			em.getTransaction().commit();
			em.getTransaction().begin();
			
			List<String> categorias = new ArrayList();
			categorias.add("Inform�tica");
			categorias.add("Papelaria");
			categorias.add("Bolsas e Mochilas");
			categorias.add("Eletro");
			categorias.add("Foto e Imagem");
						
			for(String nome : categorias){
				Categoria cat = new Categoria();
				cat.setNome(nome);				
				
				em.persist(cat);
			}
			
			/* ATENCAO */
			em.getTransaction().commit();
			em.getTransaction().begin();
			
			HashMap<String, Object[]> produtos = new HashMap();
			produtos.put("Mouse Wireless", new Object[]{1,50,50.99,false,"Novo"}); // Cat, Qtd, Vl_U
			produtos.put("Impressora Laser", new Object[]{1,12,450.0,false,"Novo"});
			produtos.put("Papel A4 - 500 fls", new Object[]{2,100,9.9,false,"Novo"});
			produtos.put("Mochila Notebook 15\"", new Object[]{3,5,57.9,false,"Novo"});
			produtos.put("TV LED 46\"", new Object[]{4,3,2500.0,true,"Novo"});
			produtos.put("Camera DSLR + Lente 18-55mm", new Object[]{5,5,1700.5,false,"Novo"});
			produtos.put("Case Camera DSLR", new Object[]{3,3,32.9,false,"Novo"});
			produtos.put("Tablet 7\" + SD Card 8GB", new Object[]{1,10,430.0,false,"Novo"});
			produtos.put("Lapiseira 0.7mm", new Object[]{2,20,15.9,false,"Novo"});
			produtos.put("Trip� 60\"", new Object[]{5,5,70.0,true,"Novo"});
			produtos.put("�culos 3D", new Object[]{4,2,95.0,false,"Novo"});
			produtos.put("DVD Grav�vel - Pack 10 und.", new Object[]{1,30,12.9,false,"Novo"});
			produtos.put("Cabo Ethernet Amarelo 3mt", new Object[]{1,10,5.9,true,"Novo"});
			produtos.put("Notebook 14\" 2.36GHz 4GB RAM 1TB HD", new Object[]{1,1,1099.90,true,"Mostru�rio"});
			produtos.put("Teclado Wireless ABNT2", new Object[]{1,1,59.0,false,"Emb. Aberta"});
						
			for(String nome : produtos.keySet()){
				Produto p = new Produto();
				p.setNome(nome);				
				/*p.setQtdEstoque((int)produtos.get(nome)[1]);
				p.setValorUnitario((double)produtos.get(nome)[2]);				
				p.setPromocao((boolean)produtos.get(nome)[3]);*/
				p.setQtdEstoque(new Integer(produtos.get(nome)[1].toString()));
				p.setValorUnitario(new Double(produtos.get(nome)[2].toString()));				
				p.setPromocao(new Boolean(produtos.get(nome)[3].toString()));
				p.setEstado(produtos.get(nome)[4].toString());
				
				Query q = em.createQuery("FROM Categoria WHERE id = " + produtos.get(nome)[0]);
				Categoria c = (Categoria)q.getSingleResult();
				p.setCategoria(c);
				
				em.persist(p);
			}
//			
			/* ATENCAO */
			em.getTransaction().commit();
			em.getTransaction().begin();
			
			HashMap<String, Object[]> menus = new HashMap();
			menus.put("Usu&aacute;rios", new Object[]{0,"usuarios.jsp"});
			menus.put("Vendas", new Object[]{2,"#"});
			menus.put("Relatorio de Vendas", new Object[]{1,"#"});
			menus.put("Controle de Estoque", new Object[]{1,"produtos.jsp"});
			
			for(String titulo : menus.keySet()){
				Menu m = new Menu();
				m.setTitulo(titulo);
				m.setUrl(menus.get(titulo)[1].toString());
				Query q = em.createNamedQuery("porNivel");
				Perfil p = (Perfil)q.setParameter("nivel", menus.get(titulo)[0]).getSingleResult();
				m.setPerfil(p);
								
				em.persist(m);
			}
			
			em.getTransaction().commit();

			System.out.println("Finalizado");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			em.close();
			emf.close();
		}
	}

}
