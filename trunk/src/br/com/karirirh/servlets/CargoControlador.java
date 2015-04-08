package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.CargoDAO;
import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Usuario;

@WebServlet("/CargoControlador")
public class CargoControlador extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public CargoControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = (Usuario) request.getSession()
				.getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();

		Cargo cargo = new Cargo();
		CargoDAO cargoDAO = new CargoDAO();

		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("menuCadastrar")) {
			List<Setor> lista = setorDAO.ListarSetores(empresa);
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("CargoCadastro.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("menuAlterar")) {
			List<Cargo> cargos = cargoDAO.CargosComSeusSetores(empresa);
			request.setAttribute("lista", cargos);
			RequestDispatcher saida = request
					.getRequestDispatcher("CargoListaAlterar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("menuBuscar")) {
			List<Setor> lista = setorDAO.ListarSetores(empresa);
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("CargoBuscar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("menuListar")) {

			List<Cargo> cargos = cargoDAO.CargosComSeusSetores(empresa);
			request.setAttribute("lista", cargos);
			RequestDispatcher saida = request
					.getRequestDispatcher("CargoListar.jsp");
			saida.forward(request, response);

		} else if (acao != null && acao.equals("salvar")) {

			String nome = request.getParameter("nome");
			boolean permitido = true;
			List<Cargo> cargoList = cargoDAO.pesquisarEq("nome", nome);
			for (Cargo c : cargoList) {
				if (c.getNome().equals(nome)) {
					permitido = false;
				}
			}

			if (permitido) {
				cargo.setNome(nome);
				cargo.setSalario(Double.parseDouble(request
						.getParameter("salario")));
				cargo.setDescricao(request.getParameter("descricao"));
				int id = Integer.parseInt(request.getParameter("setor"));
				setor = setorDAO.pesquisarId(id).get(0);
				cargo.setSetor(setor);
				cargoDAO.salvar(cargo);

				String msg = "Cargo " + nome + " cadastrado com sucesso!";
				request.setAttribute("msg", msg);
				List<Setor> lista = setorDAO.ListarSetores(empresa);
				request.setAttribute("lista", lista);
				RequestDispatcher saida = request
						.getRequestDispatcher("CargoCadastro.jsp");
				saida.forward(request, response);
			} else {
				String msg = "Cargo "
						+ nome
						+ " NÃO cadastrado, pois já existe CARGO com esse nome!";
				List<Setor> lista = setorDAO.ListarSetores(empresa);
				request.setAttribute("lista", lista);
				request.setAttribute("msg", msg);
				RequestDispatcher saida = request
						.getRequestDispatcher("CargoCadastro.jsp");
				saida.forward(request, response);

			}

		} else if (acao != null && acao.equals("excluir")) {
			int id = Integer.parseInt(request.getParameter("id"));
			cargo = cargoDAO.pesquisarId(id).get(0);
			cargoDAO.excluir(cargo);
			response.sendRedirect("CargoControlador?acao=menuAlterar");
		} else if (acao != null && acao.equals("btnAlterar")) {

			List<Setor> lista = setorDAO.ListarSetores(empresa);
			request.setAttribute("lista", lista);
			int id = Integer.parseInt(request.getParameter("id"));
			cargo = cargoDAO.pesquisarId(id).get(0);
			request.setAttribute("cargo", cargo);
			request.getRequestDispatcher("CargoAlterar.jsp").forward(request,
					response);
		} else if (acao != null && acao.equals("alterar")) {
			int id = Integer.parseInt(request.getParameter("id"));
			cargo = cargoDAO.pesquisarId(id).get(0);
			int idSetor = Integer.parseInt(request.getParameter("cod"));

			setor = setorDAO.pesquisarId(idSetor).get(0);

			cargo.setNome(request.getParameter("nome"));
			cargo.setSalario(Double.parseDouble(request.getParameter("salario")));
			cargo.setDescricao(request.getParameter("descricao"));
			cargo.setSetor(setor);

			cargoDAO.editar(cargo);

			List<Setor> lista = setorDAO.ListarSetores(empresa);
			request.setAttribute("lista", lista);
			request.setAttribute("msg", "Cargo " + cargo.getNome()
					+ " alterado com Sucesso!");
			request.setAttribute("cargo", cargo);
			request.getRequestDispatcher("CargoAlterar.jsp").forward(request,
					response);
		} else if (acao != null && acao.equals("buscar")) {
			String nome = request.getParameter("nome");
			String sSetor = request.getParameter("setor");
			List<Cargo> lista;
			if (sSetor.equals("todos")) {
				lista = cargoDAO.CargosComSeusSetores(empresa);
			} else {
				int idSetor = Integer.parseInt(sSetor);
				setor = setorDAO.pesquisarId(idSetor).get(0);
				lista = cargoDAO.ListaCargosPorSetores(empresa, setor, nome);
			}
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("CargoListar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("cargosDoSetor")) {

			String sSetor = request.getParameter("id");
			List<Cargo> lista;

			int idSetor = Integer.parseInt(sSetor);
			setor = setorDAO.pesquisarId(idSetor).get(0);
			lista = cargoDAO.ListaCargosDoSetor(empresa, setor);

			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("CargoListar.jsp");
			saida.forward(request, response);
		}

	}
}
