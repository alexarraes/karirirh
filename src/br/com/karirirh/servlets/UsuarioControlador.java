package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.AdminDAO;
import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Admin;
import br.com.karirirh.entidades.Usuario;

@WebServlet("/UsuarioControlador")
public class UsuarioControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsuarioControlador() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Admin admin = new Admin();
		AdminDAO adminDAO = new AdminDAO();
		
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();
		
		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("lista")) {
			List<Usuario> lista = usuDAO.listar();
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("UsuarioLista.jsp");
			saida.forward(request, response);

		} else if (acao != null && acao.equals("excluir")) {
			String id = request.getParameter("id");
			usu = usuDAO.pesquisarEq("id", Integer.parseInt(id)).get(0);
			usuDAO.excluir(usu);
			response.sendRedirect("UsuarioControlador?acao=lista");

		} else if (acao != null && acao.equals("alterar")) {
			Usuario usuario = usuDAO.pesquisarEq("id", Integer.parseInt(request
					.getParameter("id"))).get(0);
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("UsuarioAlterar.jsp").forward(request,
					response);

		} else if (acao != null && acao.equals("cadastrar")) {
			RequestDispatcher saida = request
					.getRequestDispatcher("UsuarioCadastro.jsp");
			saida.forward(request, response);

		} else if (acao != null && acao.equals("buscar")) {
			RequestDispatcher saida = request
					.getRequestDispatcher("UsuarioBuscar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("alterarCadastro")) {
			usu = usuDAO.pesquisarEq("id", Integer.parseInt(request
					.getParameter("id"))).get(0);
			admin = adminDAO.pesquisarCodigo((Integer.parseInt(request
					.getParameter("idAdmin"))));
			
			usu.setLogin(request.getParameter("login"));
			usu.setCnpj(request.getParameter("cnpj"));
			usu.setSenha(request.getParameter("senha"));
			usu.setAdmin(admin);
			
			usuDAO.editar(usu);
			request.setAttribute("usuario", usu);
			request.getRequestDispatcher("UsuarioAlterar.jsp").forward(request,
					response);
		} else if (acao != null && acao.equals("usuarioBuscar")) {
			List<Usuario> lista = usuDAO.pesquisarLike("login",
					request
					.getParameter("login"));
			request.setAttribute("lista", lista);

			RequestDispatcher saida = request
					.getRequestDispatcher("UsuarioLista.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("usuarioCadastrar")) {
			// Inicio
			int idAdmin = Integer.parseInt(request.getParameter("idAdmin"));
			String login = request.getParameter("login");
			String cnpj = request.getParameter("cnpj");
			String senha = request.getParameter("senha");
			String confSenha = request.getParameter("senhaConfirmar");
			if (senha.equals(confSenha)) {
				boolean permitido = true;
				UsuarioDAO usoDAO = new UsuarioDAO();
				List<Usuario> usua = usoDAO.pesquisarLike("login", 
						login);
				for (Usuario u : usua) {
					if (u.getLogin().equals(login)) {
						permitido = false;
					}
				}
				// Se já existir não é permitido gravar. PODE GRAVAR? FALSE(NAO)
				if (permitido) {
					Usuario usuGravar = new Usuario();
					admin = adminDAO.pesquisarCodigo(idAdmin);
					
					usuGravar.setLogin(login);
					usuGravar.setCnpj(cnpj);
					usuGravar.setSenha(senha);
					usuGravar.setAdmin(admin);
					
					usoDAO.salvar(usuGravar);
					String msg= "Usuário "+login+" cadastrado com sucesso!";
					request.setAttribute("msg", msg);
					RequestDispatcher saida = request
							.getRequestDispatcher("UsuarioCadastro.jsp");
					saida.forward(request, response);
					// Gravar Novo Usuario
				} else {
					// Enviar msg de nao pode gravar usuario por conta q ja
					// existe
					response.sendRedirect("UsuNaoCadastrado.jsp");
				}

			} else {
				// Senhas não coincidem
				response.sendRedirect("UsuNaoCadastrado.jsp");
			}

			// Fim
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
