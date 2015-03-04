package br.com.karirirh.teste;

import java.util.List;

import javax.servlet.RequestDispatcher;

import br.com.karirirh.dao.AdminDAO;
import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Admin;
import br.com.karirirh.entidades.Usuario;

public class UsuarioTeste {

	public static void cadastrar() {
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();
		usu.setCnpj("0000");
		usu.setLogin("Atacadao");
		usu.setRazaoSociao("Atacadao LTDA");
		usu.setSenha("1234");
		usuDAO.salvar(usu);
		System.out.println("Cadastro Salvo!");
	}

	public static void buscar() {
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();
		usu = (Usuario) usuDAO.pesquisarEq("login", "KaririRH").get(0);
		System.out.println(usu.getId() + " " + usu.getLogin() + " "
				+ usu.getSenha() + " " + usu.getCnpj() + " "
				+ usu.getRazaoSociao());
	}

	public static void excluir() {
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();
		usu = (Usuario) usuDAO.pesquisarEq("id", 19).get(0);
		usuDAO.excluir(usu);
		System.out.println("Excluido!");
	}

	public static void alterar() {
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();
		usu = usuDAO.pesquisarEq("id", 16).get(0);
		usu.setLogin("LOGOS");
		usu.setRazaoSociao("LOGOS ltda");
		usu.setCnpj("14123");
		usu.setSenha("098213");
		usuDAO.editar(usu);
		System.out.println("Alterado");
	}

	public static void lista() {

		UsuarioDAO usuDAO = new UsuarioDAO();
		List<Usuario> u = usuDAO.listar();
		for (Usuario usu : u) {
			System.out.println(usu.getId() + " " + usu.getLogin() + " "
					+ usu.getSenha() + " " + usu.getCnpj() + " "
					+ usu.getRazaoSociao());
		}

	}

	public static void main(String[] args) {
		// cadastrar();
		// buscar();
		// excluir();
		// alterar();
		lista();
	}
}
