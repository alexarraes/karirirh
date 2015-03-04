package br.com.karirirh.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.HistoricoSetor;


public class ColaboradorDAO extends GenericDAO<Colaborador> {
	HistoricoSetorDAO hsDAO = new HistoricoSetorDAO();
	HistoricoSetor hs = new HistoricoSetor();
	
	public ColaboradorDAO() {
		super(Colaborador.class);
	}

	public void salvar(Colaborador object) {
		super.salvar(object);
		
		hs.setColaborador(object);
		hs.setDataInicio(new Date());
		hs.setSetor(object.getCargo().getSetor());
		hs.setCargo(object.getCargo());
		hsDAO.salvar(hs);
		// Historico Dao
	}
	
	public void editar(Colaborador object) {
		super.editar(object);
		
		HistoricoSetor atualHistSetor = new HistoricoSetor();
		atualHistSetor = hsDAO.ultimoHistoico(object.getId());
		atualHistSetor.setDataFim(new Date());
		hsDAO.editar(atualHistSetor);
		
		hs.setColaborador(object);
		hs.setDataInicio(new Date());
		hs.setSetor(object.getCargo().getSetor());
		hs.setCargo(object.getCargo());
		hsDAO.salvar(hs);
		// Historico Dao
	}
}
