package br.com.karirirh.dao;

import java.util.Date;

import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.HistoricoSalario;
import br.com.karirirh.entidades.HistoricoSetor;


public class ColaboradorDAO extends GenericDAO<Colaborador> {
	HistoricoSetorDAO hsDAO = new HistoricoSetorDAO();
	HistoricoSetor hs = new HistoricoSetor();
	
	HistoricoSalario hSal = new HistoricoSalario();
	HistoricoSalarioDAO hSalDAO = new HistoricoSalarioDAO();
	
	public ColaboradorDAO() {
		super(Colaborador.class);
	}

	public void salvar(Colaborador object) {
		super.salvar(object);
		hSal.setData(new Date());
		hSal.setValor(object.getSalarioAtual());
		hSal.setColaborador(object);
		hSalDAO.salvar(hSal);
		
		hs.setColaborador(object);
		hs.setDataInicio(new Date());
		hs.setFinalizado(false);
		hs.setSetor(object.getCargo().getSetor());
		hs.setCargo(object.getCargo());
		hsDAO.salvar(hs);
		// Historico Dao
	}
	
	public void editar(Colaborador object) {
		HistoricoSetor hsVerifica =hsDAO.pesquisarId(object.getId()).get(0);
		if(hsVerifica.getCargo() != object.getCargo()){
		HistoricoSetor atualHistSetor = new HistoricoSetor();
		atualHistSetor = hsDAO.ultimoHistoico(object);
		atualHistSetor.setDataFim(new Date());
		atualHistSetor.setFinalizado(true);
		hsDAO.editar(atualHistSetor);
		
		hs.setColaborador(object);
		hs.setDataInicio(new Date());
		hs.setSetor(object.getCargo().getSetor());
		hs.setCargo(object.getCargo());
		hsDAO.salvar(hs);}
		
		HistoricoSalario hSalVerifica = hSalDAO.pesquisarEq("colaborador", object).get(0);
		if(hSalVerifica.getValor() != object.getSalarioAtual()){
			hSal.setData(new Date());
			hSal.setValor(object.getSalarioAtual());
			hSal.setColaborador(object);
			hSalDAO.salvar(hSal);	
		}
		
		super.editar(object);
		
	}
}
