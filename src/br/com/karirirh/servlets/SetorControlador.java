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
import br.com.karirirh.entidades.Setor;

@WebServlet("/SetorControlador")
public class SetorControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SetorControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Cargo cargo = new Cargo();
		CargoDAO cargoDAO = new CargoDAO();

		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("salvar")) {
			
			String nome = request.getParameter("nome");
			if (setorDAO.buscarNomeEspecifico(nome) == null) {
				setor.setNome(nome);
			
				setorDAO.salvar(setor);
				String msg = "Setor " + nome + " cadastrado com sucesso!";
				request.setAttribute("msg", msg);
				RequestDispatcher saida = request
						.getRequestDispatcher("SetorCadastro.jsp");
				saida.forward(request, response);
			} else
				response.sendRedirect("UsuNaoCadastrado.jsp");

		} else if (acao != null && acao.equals("excluir")) {
			setor = setorDAO.pesquisarCodigo(Integer.parseInt(request
					.getParameter("id")));
			setorDAO.excluir(setor);
			response.sendRedirect("SetorControlador?acao=lista");

		} else if (acao != null && acao.equals("alterarCadastro")) {
			setor = setorDAO.pesquisarCodigo(Integer.parseInt(request
					.getParameter("id")));

			setor = setorDAO.pesquisarCodigo((Integer.parseInt(request
					.getParameter("idSetor"))));
			setor.setNome(request.getParameter("nome"));
			setorDAO.editar(setor);

			request.setAttribute("setor", setor);
			request.getRequestDispatcher("SetorAlterar.jsp").forward(request,
					response);
		} else if (acao != null && acao.equals("alterar")) {
			setor = setorDAO.pesquisarCodigo(Integer.parseInt(request
					.getParameter("id")));
			request.setAttribute("setor", setor);
			request.getRequestDispatcher("SetorAlterar.jsp").forward(request,
					response);

		} else if (acao != null && acao.equals("buscar")) {
			List<Setor> lista = setorDAO.buscaNome(request.getParameter("nome"));
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("SetorLista.jsp");
			saida.forward(request, response);
		}
	}

}
