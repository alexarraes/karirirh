package br.com.karirirh.teste;

import java.util.Date;

import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.dao.HistoricoSetorDAO;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.HistoricoSetor;

public class HistoricoSetorTeste implements Teste {
	HistoricoSetor hs = new HistoricoSetor();
	HistoricoSetorDAO hsDAO = new HistoricoSetorDAO();
	
	@Override
	public void cadastrar() {
		
	}

	@Override
	public Object buscar(String campo, String valor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void excluir(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void alterar(int id) {
	hs = hsDAO.pesquisarId(id).get(0);
	System.out.println(hs.getDataInicio());
	hs.setFinalizado(false);
	hsDAO.editar(hs);
		

	}

	@Override
	public void lista() {

	}

	public static void main(String[] args) {
		HistoricoSetorTeste hst = new HistoricoSetorTeste();
		HistoricoSetor hs = new HistoricoSetor();
		HistoricoSetorDAO hsDAO = new HistoricoSetorDAO();
		Colaborador col = new Colaborador();
		ColaboradorDAO colDAO = new ColaboradorDAO();
		
		col = colDAO.pesquisarId(1).get(0);
		hs= hsDAO.pesquisarEq("colaborador", col).get(0);
		System.out.println(hs.getColaborador().getNome());
	}

}
