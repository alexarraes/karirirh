package br.com.karirirh.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.CargoDAO;
import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.dao.DependenteDAO;
import br.com.karirirh.dao.FeriasDAO;
import br.com.karirirh.dao.HistoricoAfastamentoDAO;
import br.com.karirirh.dao.HistoricoSalarioDAO;
import br.com.karirirh.dao.HistoricoSetorDAO;
import br.com.karirirh.dao.MedidaDisciplinarDAO;
import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.dao.TelefoneDAO;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Dependente;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Ferias;
import br.com.karirirh.entidades.HistoricoAfastamento;
import br.com.karirirh.entidades.HistoricoSalario;
import br.com.karirirh.entidades.HistoricoSetor;
import br.com.karirirh.entidades.MedidaDisciplinar;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Telefone;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.teste.Data;

/**
 * 
 * @author Alex Jr Arraes
 *
 */
@WebServlet("/ColaboradorControlador")
public class ColaboradorControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ColaboradorControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			Data dt = new Data();
			int ano = Integer.parseInt((new SimpleDateFormat("yyyy"))
					.format(new Date()));

			Usuario usuario = (Usuario) request.getSession().getAttribute(
					"usuario");
			Empresa empresa = usuario.getEmpresa();
			Colaborador col = new Colaborador();
			ColaboradorDAO colDAO = new ColaboradorDAO();
			Dependente dep = new Dependente();
			DependenteDAO depDAO = new DependenteDAO();
			Telefone tel = new Telefone();
			TelefoneDAO telDAO = new TelefoneDAO();
			Ferias fer = new Ferias();
			FeriasDAO ferDAO = new FeriasDAO();
			HistoricoAfastamento hisAfast = new HistoricoAfastamento();
			HistoricoAfastamentoDAO histAfastDAO = new HistoricoAfastamentoDAO();
			HistoricoSetorDAO histSetorDAO = new HistoricoSetorDAO();
			MedidaDisciplinar mD = new MedidaDisciplinar();
			MedidaDisciplinarDAO mDDAO = new MedidaDisciplinarDAO();
			HistoricoSalarioDAO hisSalDAO = new HistoricoSalarioDAO();

			Cargo cargo = new Cargo();
			CargoDAO cargoDAO = new CargoDAO();
			Setor setor = new Setor();
			SetorDAO setorDAO = new SetorDAO();

			String acao = request.getParameter("acao");

			if (acao != null && acao.equals("menuCadastro")) {
				List<Cargo> cargos = cargoDAO.CargosComSeusSetores(empresa);
				request.setAttribute("cargo", cargos);
				RequestDispatcher saida = request
						.getRequestDispatcher("ColaboradorCadastro.jsp");
				saida.forward(request, response);

			} else if (acao != null && acao.equals("menuBuscar")) {
				RequestDispatcher saida = request
						.getRequestDispatcher("ColaboradorBuscar.jsp");
				saida.forward(request, response);

			} else if (acao != null && acao.equals("menuListar")) {
				List<Colaborador> colaboradores = colDAO.pesquisarEq("empresa",
						empresa);
				request.setAttribute("lista", colaboradores);
				RequestDispatcher saida = request
						.getRequestDispatcher("ColaboradorListar.jsp");
				saida.forward(request, response);

			} else if (acao != null && acao.equals("menuAlterar")) {
				List<Colaborador> colaboradores = colDAO.pesquisarEq("empresa",
						empresa);
				request.setAttribute("lista", colaboradores);
				RequestDispatcher saida = request
						.getRequestDispatcher("ColaboradorListaAlterar.jsp");
				saida.forward(request, response);

			} else if (acao != null && acao.equals("excluir")) {
				int id = Integer.parseInt(request.getParameter("id"));
				col = colDAO.pesquisarId(id).get(0);
				List<Telefone> telefones = telDAO.pesquisarEq("colaborador",
						col);
				for (Telefone t : telefones) {
					telDAO.excluir(t);
				}
				List<Ferias> ferias = ferDAO.pesquisarEq("colaborador", col);
				for (Ferias f : ferias) {
					ferDAO.excluir(f);
				}
				List<HistoricoAfastamento> historicosAfasta = histAfastDAO
						.pesquisarEq("colaborador", col);
				for (HistoricoAfastamento h : historicosAfasta) {
					histAfastDAO.excluir(h);
				}
				List<HistoricoSalario> histSal = hisSalDAO.pesquisarEq(
						"colaborador", col);
				for (HistoricoSalario hSal : histSal) {
					hisSalDAO.excluir(hSal);
				}
				List<HistoricoSetor> historicosSetor = histSetorDAO
						.pesquisarEq("colaborador", col);
				for (HistoricoSetor hS : historicosSetor) {
					histSetorDAO.excluir(hS);
				}
				List<MedidaDisciplinar> mDList = mDDAO.pesquisarEq(
						"colaborador", col);
				for (MedidaDisciplinar m : mDList) {
					mDDAO.excluir(m);
				}
				List<Dependente> dependentes = depDAO.pesquisarEq(
						"colaborador", col);
				for (Dependente d : dependentes) {
					depDAO.excluir(d);
				}

				colDAO.excluir(col);
				response.sendRedirect("ColaboradorControlador?acao=menuAlterar");

			}else if (acao != null && acao.equals("btnAlterar")) {

				List<Cargo> cargos = cargoDAO.CargosComSeusSetores(empresa);
				request.setAttribute("cargo", cargos);
				int id = Integer.parseInt(request.getParameter("id"));
				col = colDAO.pesquisarId(id).get(0);
				List<Telefone> tels = telDAO.pesquisarEq("colaborador", col);
				List<Dependente> deps = depDAO.pesquisarEq("colaborador", col);
				request.setAttribute("col", col);
				request.setAttribute("tel", tels);
				request.setAttribute("dep", deps);
				request.getRequestDispatcher("ColaboradorAlterar.jsp").forward(request,
						response);
			} else if (acao != null && acao.equals("buscar")) {
				List<Colaborador> colaboradores = null;
				String valor = request.getParameter("valor");
				String nome = request.getParameter("nome");

				if (nome.equals("matricula")) {
					colaboradores = colDAO.buscarLikeEspecificoInteiro(empresa,
							Integer.parseInt(valor), nome);
				} else {
					colaboradores = colDAO.buscarLikeEspecificoString(empresa,
							valor, nome);
				}

				request.setAttribute("lista", colaboradores);
				RequestDispatcher saida = request
						.getRequestDispatcher("ColaboradorListar.jsp");
				saida.forward(request, response);

			} else if (acao != null && acao.equals("salvar")) {
				String nomeCompleto = request.getParameter("nomeCompleto");
				String estCivil = request.getParameter("estCivil");
				String sDataNascimento = request.getParameter("dataNasc");
				System.out.println(sDataNascimento);
				String sDataAdmin = request.getParameter("dataAdmin");
				String sexo = request.getParameter("sexo");
				int rg = Integer.parseInt(request.getParameter("rg"));
				String cpf = request.getParameter("cpf");
				String rua = request.getParameter("rua");
				int numero = Integer.parseInt(request.getParameter("numero"));
				String complemento = request.getParameter("complemento");
				String bairro = request.getParameter("bairro");
				String cidade = request.getParameter("cidade");
				String estado = request.getParameter("estado");
				String cep = request.getParameter("cep");
				String email = request.getParameter("email");
				String celular = request.getParameter("celular");
				String fixo = request.getParameter("fixo");
				String ctps = request.getParameter("ctps");
				String pis = request.getParameter("pis");
				String tipoContrato = request.getParameter("tipoContrato");
				int car = Integer.parseInt(request.getParameter("cargo"));
				double salario = Double.parseDouble(request
						.getParameter("salario"));
				String escolaridade = request.getParameter("escolaridade");
				String curso = request.getParameter("curso");
				boolean status = true;
				// Dependentes

				col.setNome(nomeCompleto);
				col.setEstadoCivil(estCivil);

				col.setDataNascimento(dt.formataData(sDataNascimento));
				col.setDataAdm(dt.formataData(sDataAdmin));

				col.setSexo(sexo);
				col.setRg(rg);
				col.setCpf(cpf);
				col.setRua(rua);
				col.setNumero(numero);
				col.setComplemento(complemento);
				col.setBairro(bairro);
				col.setCidade(cidade);
				col.setUf(estado);
				col.setCep(cep);
				col.setEmail(email);
				col.setCtps(ctps);
				col.setPis(pis);
				col.setContrato(tipoContrato);
				col.setSalarioAtual(salario);// Obs.:
				col.setEscolaridade(escolaridade);
				col.setCurso(curso);
				col.setStatus(status);
				cargo = cargoDAO.pesquisarId(car).get(0);
				col.setCargo(cargo);
				col.setEmpresa(empresa);
				colDAO.salvar(col);
				col = colDAO.pesquisarEq("cpf", cpf).get(0);
				tel.setTipo("Celular");
				tel.setFone(celular);
				tel.setColaborador(col);
				telDAO.salvar(tel);
				tel.setTipo("Fixo");
				tel.setFone(fixo);
				tel.setColaborador(col);
				telDAO.salvar(tel);
				String matricula = ano + "" + col.getId();
				col.setMatricula(Integer.parseInt(matricula));
				colDAO.editar(col);

				int qtdItens = 5;
				String nome[] = new String[qtdItens];
				int aux = 1;
				for (int i = 0; i < qtdItens; i++) {
					nome[i] = "nome" + aux;
					aux++;
				}
				for (int i = 0; i < nome.length; i++) {
					nome[i] = request.getParameter(nome[i]);
				}
				for (int i = 0; i < nome.length; i++) {
					if (nome[i] == null) {
						System.out.println("Vazio");
					} else {
						dep.setTipo("Dependente");
						dep.setNomeDependete(nome[i]);
						dep.setColaborador(col);
						depDAO.salvar(dep);
					}

				}

				String msg = "Colaborador " + col.getNome()
						+ " cadastrado com sucesso, sua matricula é:"
						+ col.getMatricula();
				request.setAttribute("msg", msg);
				List<Cargo> cargos = cargoDAO.CargosComSeusSetores(empresa);
				request.setAttribute("cargo", cargos);
				RequestDispatcher saida = request
						.getRequestDispatcher("ColaboradorCadastro.jsp");
				saida.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("Erro na DATA" + e.toString());

		}
	}

}
