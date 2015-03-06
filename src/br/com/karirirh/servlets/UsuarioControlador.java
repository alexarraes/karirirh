package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.entidades.Empresa;

@WebServlet("/UsuarioControlador")
public class UsuarioControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsuarioControlador() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		Empresa usu = new Empresa();
		EmpresaDAO usuDAO = new EmpresaDAO();
		usuDAO.pes
		
		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("lista")) {
			List<Empresa> lista = usuDAO.listar();
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
			Empresa empresa = usuDAO.pesquisarEq("id", Integer.parseInt(request
					.getParameter("id"))).get(0);
			request.setAttribute("usuario", empresa);
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
			usuario = usuarioDAO.pesquisarCodigo((Integer.parseInt(request
					.getParameter("idAdmin"))));
			
			usu.setLogin(request.getParameter("login"));
			usu.setCnpj(request.getParameter("cnpj"));
			usu.setSenha(request.getParameter("senha"));
			
			
			usuDAO.editar(usu);
			request.setAttribute("usuario", usu);
			request.getRequestDispatcher("UsuarioAlterar.jsp").forward(request,
					response);
		} else if (acao != null && acao.equals("usuarioBuscar")) {
			List<Empresa> lista = usuDAO.pesquisarLike("login",
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
				EmpresaDAO usoDAO = new EmpresaDAO();
				List<Empresa> usua = usoDAO.pesquisarLike("login", 
						login);
				for (Empresa u : usua) {
					if (u.getLogin().equals(login)) {
						permitido = false;
					}
				}
				// Se já existir não é permitido gravar. PODE GRAVAR? FALSE(NAO)
				if (permitido) {
					Empresa usuGravar = new Empresa();
					usuario = usuarioDAO.pesquisarCodigo(idAdmin);
					
					usuGravar.setLogin(login);
					usuGravar.setCnpj(cnpj);
					usuGravar.setSenha(senha);
					
					
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
