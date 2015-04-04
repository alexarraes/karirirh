package br.com.karirirh.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.HistoricoAfastamento;
import br.com.karirirh.entidades.HistoricoAfastamento;
import br.com.karirirh.util.HibernateUtil;

public class HistoricoAfastamentoDAO extends GenericDAO<HistoricoAfastamento> {

	public HistoricoAfastamentoDAO() {
		super(HistoricoAfastamento.class);
	
	}
	
	
	public List<HistoricoAfastamento> ListarAfastados(Empresa empresa) {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		Criteria criteria = getSessao().createCriteria(HistoricoAfastamento.class, "a");
		Conjunction e = Restrictions.conjunction();
		HistoricoAfastamentoDAO hADAO = new HistoricoAfastamentoDAO();
		List<HistoricoAfastamento> lista = hADAO.listar();
		for (HistoricoAfastamento h : lista) {
			e.add(Subqueries.exists(DetachedCriteria
					.forClass(Colaborador.class, "c")
					.setProjection(Projections.id())
					.add(Restrictions.eq("c.empresa", empresa))));
		}
		criteria.add(e);
		return criteria.list();
	}

	public List<HistoricoAfastamento> ListaEmAfastamento(Empresa empresa, Date data) {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		Criteria criteria = getSessao().createCriteria(HistoricoAfastamento.class, "h");
		Conjunction e = Restrictions.conjunction();
		HistoricoAfastamentoDAO hADAO = new HistoricoAfastamentoDAO();
		List<HistoricoAfastamento> lista = hADAO.listar();
		for (HistoricoAfastamento h : lista) {
			e.add(Subqueries.exists(DetachedCriteria
					.forClass(Colaborador.class, "c")
					.setProjection(Projections.id())
					.add(Restrictions.eq("c.empresa", empresa))
					.add(Restrictions.le("h.dataInicio", data))
					.add(Restrictions.ge("h.dataFim", data))
					));
		}
			criteria.add(e);
		return criteria.list();
	}

	public HistoricoAfastamento emAfastamento(Colaborador col){
		Date data = new Date();
		setSessao(HibernateUtil.getSessionFactory().openSession());
		HistoricoAfastamento colaborador = (HistoricoAfastamento) getSessao().
				createCriteria(HistoricoAfastamento.class).
				add(Restrictions.eq("colaborador",col)).
				add(Restrictions.le("dataInicio", data)).
				add(Restrictions.ge("dataFim", data)).uniqueResult();
		return colaborador;
	}
	
	/*
	public List<HistoricoAfastamento> listaAfastamento(Date data){
		setSessao(HibernateUtil.getSessionFactory().openSession());
		List<HistoricoAfastamento> lista = null;
		lista = (List<HistoricoAfastamento>) getSessao().
				createCriteria(HistoricoAfastamento.class).
				add(Restrictions.le("dataInicio", data)).
				add(Restrictions.ge("dataFim", data)).list();
		return lista;
	}
*/
	
}
