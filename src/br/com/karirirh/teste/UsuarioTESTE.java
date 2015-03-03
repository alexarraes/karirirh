package br.com.karirirh.teste;

import java.util.List;

import javax.servlet.RequestDispatcher;

import br.com.karirirh.dao.AdminDAO;
import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Admin;
import br.com.karirirh.entidades.Usuario;

public class UsuarioTESTE {

	public static void main(String[] args) {
		
		
	}
}
		/*String login = "4";
		String senha = "4";
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();
		usu = usuDAO.autenticador(login, senha);
		if(usu==null){
			System.out.println("Usuário Não encotrado");
		}else{
			System.out.println("Login:"+usu.getLogin()+" Senha:"+usu.getSenha());
		}
		
	}
	}
		String login = "alex";
		String senha = "123";
		String confSenha = "123";
		if(senha.equals(confSenha)){
			boolean permitido = true;
			UsuarioDAO usoDAO = new UsuarioDAO();
			List<Usuario> usu = usoDAO.pesquisarLogin(login);
			for (Usuario u : usu) {
				if (u.getLogin().equals(login)) {
					permitido = false;
				}	
			}
			//Se já existir não é permitido gravar. PODE GRAVAR? FALSE(NAO)
			if(permitido){
				Usuario usuGravar = new Usuario();
				usuGravar.setLogin(login);
				usuGravar.setSenha(senha);
				usoDAO.salvar(usuGravar);

				request.setAttribute("usuCAD", usuGravar);
				

				RequestDispatcher saida = request
						.getRequestDispatcher("UsuarioLista.jsp");
				saida.forward(request, response);
				//Gravar Novo Usuario
			}else{
				//Enviar msg de nao pode gravar usuario por conta q ja existe
				response.sendRedirect("UsuNaoCadastrado.jsp");
			}
			
		}else{
			//Senhas não coincidem
			response.sendRedirect("UsuNaoCadastrado.jsp");
		}
		
	}
*/
	/*
	 * List<Usuario> listaUsu = usoDAO.ListarUsuarios(); for(Usuario u: listaUsu
	 * ){ System.out.println("Login: "+u.getLogin()+" Senha: "+ u.getSenha()); }
	 * System.exit(0);
	 * 
	 * PESQUISAR E EDITAR uso = usoDAO.pesquisarCodigo(1); uso.setLogin("neto");
	 * usoDAO.editar(uso);
	 * 
	 * TESTE CADASTRO uso.setLogin("Maria"); uso.setSenha("5678");
	 * usoDAO.salvar(uso);
	 */

