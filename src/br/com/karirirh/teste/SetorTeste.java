package br.com.karirirh.teste;

import java.util.List;

import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Usuario;

public class SetorTeste {

	public static void main(String[] args) {
		//cadastrar();
		// buscar();
		// alterar();
		lista();
		// excluir();

	}

	public static void cadastrar() {
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();
	
		String nome = "nome";
	
			setor.setNome(nome);

			setorDAO.salvar(setor);
			String msg = "Setor " + nome + " cadastrado com sucesso!";

			System.out.println("Cadastro Salvo!" + msg);
		
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
		UsuarioDAO usuDAO = new UsuarioDAO();
		Usuario usu = usuDAO.pesquisarCodigo(2);
		Empresa empresa = usu.getEmpresa();
		SetorDAO setorDAO = new SetorDAO();
		List<Setor> s = setorDAO.ListarSetores(empresa);
		for (Setor emp : s)
			System.out.println(emp.getId() + " " + emp.getNome());

	}
}
