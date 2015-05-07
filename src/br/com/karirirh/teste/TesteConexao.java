package br.com.karirirh.teste;

import br.com.karirirh.util.Conexao;

public class TesteConexao {

	public static void main(String[] args) {
		Conexao con = new Conexao();
		System.out.println(con.getConnection());
	}
}
