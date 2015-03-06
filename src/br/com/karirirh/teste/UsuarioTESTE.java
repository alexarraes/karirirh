package br.com.karirirh.teste;

import java.util.List;

import javax.servlet.RequestDispatcher;

import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.entidades.Empresa;

public class UsuarioTeste {

	public static void cadastrar() {
		Empresa emp = new Empresa();
		EmpresaDAO empDAO = new EmpresaDAO();

		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();

		String login = "santa";
		boolean permitido = true;
		List<Usuario> usuLista = usuDAO.pesquisarEq("login", login);
		for (Usuario u : usuLista) {
			if (u.getLogin().equals(login)) {
				permitido = false;
			}
		}

		if (permitido) {
			emp.setRazaoSociao("Santa Fe");
			emp.setCnpj("8888");
			emp.setFone("fone");
			emp.setEnderecoCompleto("enderecoCompleto");
			empDAO.salvar(emp);
			usu.setLogin("santa");
			usu.setSenha("1234");
			usu.setAdmin(false);
			Empresa empFK = empDAO.pesquisarEq("cnpj", emp.getCnpj()).get(0);
			usu.setEmpresa(empFK);
			usuDAO.salvar(usu);
			String msg = "Empresa " + emp.getRazaoSociao()
					+ " cadastrada com sucesso!";
			System.out.println(msg);
		} else {
			System.out.println("Empres Não cadastrada!");
		}

	}

	public static void buscar() {
		Empresa usu = new Empresa();
		EmpresaDAO usuDAO = new EmpresaDAO();
		usu = (Empresa) usuDAO.pesquisarEq("login", "KaririRH").get(0);
		System.out.println(usu.getId() + " " + usu.getCnpj() + " "
				+ usu.getRazaoSociao());
	}

	public static void excluir() {
		Empresa usu = new Empresa();
		EmpresaDAO usuDAO = new EmpresaDAO();
		usu = (Empresa) usuDAO.pesquisarEq("id", 19).get(0);

		usuDAO.excluir(usu);
		System.out.println("Excluido!");
	}

	public static void alterar() {
		Empresa usu = new Empresa();
		EmpresaDAO usuDAO = new EmpresaDAO();
		usu = usuDAO.pesquisarEq("id", 16).get(0);

		usu.setRazaoSociao("LOGOS ltda");
		usu.setCnpj("14123");

		usuDAO.editar(usu);
		System.out.println("Alterado");
	}

	public static void lista() {

		EmpresaDAO usuDAO = new EmpresaDAO();
		List<Empresa> u = usuDAO.listar();
		for (Empresa usu : u) {
			System.out.println(usu.getId() + " " + usu.getCnpj() + " "
					+ usu.getRazaoSociao());
		}

	}

	public static void main(String[] args) {
		cadastrar();
		// buscar();
		// excluir();
		// alterar();
		// lista();
	}
}
