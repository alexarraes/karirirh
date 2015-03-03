package br.com.karirirh.teste;

import br.com.karirirh.util.HibernateUtil;

public class Conexao {

	public static void main(String[] args) {
		HibernateUtil.getSessionFactory().openSession();
	}

}
