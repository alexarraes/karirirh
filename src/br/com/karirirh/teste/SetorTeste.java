package br.com.karirirh.teste;

import java.util.List;

import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Empresa;

public class SetorTeste {
	
	public static void main(String[] args) {
		cadastrar();
		//buscar();
		//alterar();
		//lista();
		//excluir();
		
	}
	
	public static void cadastrar() {
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();
		Empresa usu = new Empresa();
		EmpresaDAO usuDAO = new EmpresaDAO();
		setor.setNome("Recursos Humanos");
		usu = usuDAO.pesquisarId(1).get(0);
		setor.setUsuario(usu);
		setorDAO.salvar(setor);
		
		System.out.println("Cadastro Salvo!");
	}

	public static void buscar() {
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();
		setor = (Setor) setorDAO.pesquisarEq("nome", "Recursos Humanos").get(0);
		System.out.println(setor.getId() + " " + setor.getNome());
	}

	public static void excluir() {
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();
		setor = (Setor) setorDAO.pesquisarEq("id", 1).get(0);
		setorDAO.excluir(setor);
		System.out.println("Excluido!");
	}

	public static void alterar() {
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();
		setor = setorDAO.pesquisarEq("id", 1).get(0);
		setor.setNome("Financeiro");
		setorDAO.editar(setor);
		System.out.println("Alterado");
	}

	public static void lista() {

		SetorDAO setorDAO = new SetorDAO();
		List<Setor> s = setorDAO.listar();
		for (Setor usu : s) 
			System.out.println(usu.getId() + " " + usu.getNome());

	}
}
