package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Usuario;

@WebServlet("/SetorControlador")
public class SetorControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SetorControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Usuario usuario =(Usuario) request.getSession().getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();
		
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("salvar")) {
			
			String nome = request.getParameter("nome");
			boolean permitido = true;
			List<Setor> setorList = setorDAO.pesquisarEq("nome", nome);
			for (Setor s : setorList) {
				if (s.getNome().equals(nome)) {
					permitido = false;
				}
			}

			if (permitido) {
				setor.setNome(nome);
				setor.setEmpresa(empresa);
				setorDAO.salvar(setor);
			
				
				String msg = "Setor " + nome + " cadastrado com sucesso!";
				request.setAttribute("msg", msg);
				RequestDispatcher saida = request
						.getRequestDispatcher("SetorCadastro.jsp");
				saida.forward(request, response);
			} else{
				String msg = "Setor " + nome + " NÃO cadastrado, pois já existe SETOR com esse nome!";
				request.setAttribute("msg", msg);
				RequestDispatcher saida = request
						.getRequestDispatcher("SetorCadastro.jsp");
				saida.forward(request, response);
				
			}
				

		} else if (acao != null && acao.equals("excluir")) {
			setor = setorDAO.pesquisarCodigo(Integer.parseInt(request
					.getParameter("id")));
			setorDAO.excluir(setor);
			response.sendRedirect("SetorControlador?acao=listar");

		} else if (acao != null && acao.equals("alterar")) {
			setor = setorDAO.pesquisarCodigo(Integer.parseInt(request
					.getParameter("id")));

			setor = setorDAO.pesquisarCodigo((Integer.parseInt(request
					.getParameter("idSetor"))));
			setor.setNome(request.getParameter("nome"));
			setorDAO.editar(setor);

			request.setAttribute("setor", setor);
			request.getRequestDispatcher("SetorAlterar.jsp").forward(request,
					response);
		} else if (acao != null && acao.equals("buscar")) {
			String nome = request.getParameter("nome");
			List<Setor> setorList = setorDAO.pesquisarNome(empresa, nome);
			request.setAttribute("lista", setorList);
			request.getRequestDispatcher("SetorListar.jsp").forward(request,
					response);

		} else if (acao != null && acao.equals("listar")) {
			List<Setor> lista = setorDAO.ListarSetores(empresa);
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("SetorListar.jsp");
			saida.forward(request, response);
		}
	}

}
