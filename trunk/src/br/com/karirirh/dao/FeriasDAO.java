package br.com.karirirh.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Ferias;
import br.com.karirirh.entidades.HistoricoAfastamento;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.util.HibernateUtil;

public class FeriasDAO extends GenericDAO<Ferias> {

	public FeriasDAO() {
		super(Ferias.class);
	}

	public List<Ferias> ListarFerias(Empresa empresa) {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		Criteria criteria = getSessao().createCriteria(Ferias.class, "f");
		Conjunction e = Restrictions.conjunction();
		FeriasDAO frDAO = new FeriasDAO();
		List<Ferias> feriasLista = frDAO.listar();
		for (Ferias f : feriasLista) {
			e.add(Subqueries.exists(DetachedCriteria
					.forClass(Colaborador.class, "c")
					.setProjection(Projections.id())
					.add(Restrictions.eq("c.empresa", empresa))));
		}
		criteria.add(e);
		return criteria.list();
	}

	public List<Ferias> ListaEmFerias(Empresa empresa, Date data) {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		Criteria criteria = getSessao().createCriteria(Ferias.class, "f");
		Conjunction e = Restrictions.conjunction();
		FeriasDAO frDAO = new FeriasDAO();
		List<Ferias> feriasLista = frDAO.listar();
		for (Ferias f : feriasLista) {
			e.add(Subqueries.exists(DetachedCriteria
					.forClass(Colaborador.class, "c")
					.setProjection(Projections.id())
					.add(Restrictions.eq("c.empresa", empresa))
					.add(Restrictions.le("f.dataInicio", data))
					.add(Restrictions.ge("f.dataFim", data))
					));
		}
			criteria.add(e);
		return criteria.list();
	}

	public Ferias emFerias(Colaborador col){
		Date data = new Date();
		setSessao(HibernateUtil.getSessionFactory().openSession());
		Ferias colaborador = (Ferias) getSessao().
				createCriteria(Ferias.class).
				add(Restrictions.eq("colaborador",col)).
				add(Restrictions.le("dataInicio", data)).
				add(Restrictions.ge("dataFim", data)).uniqueResult();
		return colaborador;
	}
}
