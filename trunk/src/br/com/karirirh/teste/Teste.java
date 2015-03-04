package br.com.karirirh.teste;

import java.util.List;



public interface Teste {

	public void cadastrar();

	public Object buscar(String campo,String valor);

	public void excluir(int id) ;

	public void alterar(int id);

	public void lista();

}
