package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Usuario;

/**
 * Servlet implementation class AdministradorControlador
 */
@WebServlet("/AdministradorControlador")
public class AdministradorControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdministradorControlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Empresa emp = new Empresa();
		EmpresaDAO empDAO = new EmpresaDAO();
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("menuCadastrar")) {
			RequestDispatcher saida = request
					.getRequestDispatcher("EmpresaCadastro.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("menuBuscar")) {
			RequestDispatcher saida = request
					.getRequestDispatcher("EmpresaBuscar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("menuListar")) {
			List<Empresa> lista = empDAO.listar();
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("EmpresaLista.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("cadastrar")) {
			String login = request.getParameter("login");

			boolean permitido = true;
			List<Usuario> usuLista = usuDAO.pesquisarEq("login", login);
			for (Usuario u : usuLista) {
				if (u.getLogin().equals(login)) {
					permitido = false;
				}
			}

			if (permitido) {
				emp.setRazaoSociao(request.getParameter("razaoSocial"));
				emp.setCnpj(request.getParameter("cnpj"));
				emp.setFone(request.getParameter("fone"));
				emp.setEnderecoCompleto(request.getParameter("enderecoCompleto"));
				empDAO.salvar(emp);
				usu.setLogin(request.getParameter("login"));
				usu.setSenha(request.getParameter("senha"));
				usu.setAdmin(false);
				Empresa empFK = empDAO.pesquisarEq("cnpj", emp.getCnpj())
						.get(0);
				usu.setEmpresa(empFK);
				usuDAO.salvar(usu);
				String msg = "Empresa " + emp.getRazaoSociao()
						+ " cadastrada com sucesso!";

				request.setAttribute("msg", msg);
				RequestDispatcher saida = request
						.getRequestDispatcher("EmpresaCadastro.jsp");
				saida.forward(request, response);
			} else {
				request.setAttribute("msg", "Empresa não cadastrada!");
				RequestDispatcher saida = request
						.getRequestDispatcher("EmpresaCadastro.jsp");
				saida.forward(request, response);
			}

		}else if (acao != null && acao.equals("buscar")){
			System.out.println(request.getParameter("campo"));
			
			String valor = request.getParameter("valor");
			String campo = request.getParameter("campo");
			List<Empresa> lista = empDAO.pesquisarLike(campo, valor);
			List<Usuario> usuList;
			
			
			request.setAttribute("lista", lista);
			

			RequestDispatcher saida = request
					.getRequestDispatcher("EmpresaLista.jsp");
			saida.forward(request, response);
			
			
		}else if (acao != null && acao.equals("excluir")) {
			emp = empDAO.pesquisarId(Integer.parseInt(request.getParameter("id"))).get(0);
			empDAO.excluir(emp);
			System.out.println("Excluido");
			response.sendRedirect("AdministradorControlador?acao=menuListar");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
