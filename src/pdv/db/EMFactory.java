package pdv.db;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EMFactory {

	private static EntityManagerFactory emf;

	private static void inicializarEMF() throws Exception {

		emf = Persistence.createEntityManagerFactory("PDV-AULA03");
	}

	public static EntityManager obterEM() {

		try {

			if (emf == null) {
				inicializarEMF();
			}

			return emf.createEntityManager();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	public static void fecharEMF() {
		try {

			if (emf == null) {
				emf.close();
				emf = null;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
