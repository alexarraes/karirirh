package br.com.karirirh.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.HistoricoSalario;
import br.com.karirirh.entidades.HistoricoSetor;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.util.HibernateUtil;

public class ColaboradorDAO extends GenericDAO<Colaborador> {
	HistoricoSetorDAO hsDAO = new HistoricoSetorDAO();
	HistoricoSetor hs = new HistoricoSetor();

	HistoricoSalario hSal = new HistoricoSalario();
	HistoricoSalarioDAO hSalDAO = new HistoricoSalarioDAO();

	private Session sessao;

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
		HistoricoSetor hsVerifica = hsDAO.pesquisarId(object.getId()).get(0);
		if (hsVerifica.getCargo() != object.getCargo()) {
			HistoricoSetor atualHistSetor = new HistoricoSetor();
			atualHistSetor = hsDAO.ultimoHistoico(object);
			atualHistSetor.setDataFim(new Date());
			atualHistSetor.setFinalizado(true);
			hsDAO.editar(atualHistSetor);

			hs.setColaborador(object);
			hs.setDataInicio(new Date());
			hs.setSetor(object.getCargo().getSetor());
			hs.setCargo(object.getCargo());
			hsDAO.salvar(hs);
		}

		HistoricoSalario hSalVerifica = hSalDAO.pesquisarEq("colaborador",
				object).get(0);
		if (hSalVerifica.getValor() != object.getSalarioAtual()) {
			hSal.setData(new Date());
			hSal.setValor(object.getSalarioAtual());
			hSal.setColaborador(object);
			hSalDAO.salvar(hSal);
		}

		super.editar(object);

	}

	public List<Colaborador> buscarLikeEspecificoString(Empresa empresa,
			String valor, String nome) {
		ColaboradorDAO colDAO = new ColaboradorDAO();
		List<Colaborador> colaboradores = colDAO.listar();
		sessao = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = sessao.createCriteria(Colaborador.class, "c");
		Conjunction e = Restrictions.conjunction();
		for (Colaborador c : colaboradores) {
			e.add(Subqueries.exists(DetachedCriteria
					.forClass(Empresa.class, "e")
					.setProjection(Projections.id())
					.add(Restrictions.eqProperty("c.empresa", "e.id"))
					.add(Restrictions.ilike("c." + nome, valor,
							MatchMode.ANYWHERE))));
		}
		criteria.add(e);
		return criteria.list();
	}

	public List<Colaborador> buscarLikeEspecificoInteiro(Empresa empresa,
			int valor, String nome) {
		ColaboradorDAO colDAO = new ColaboradorDAO();
		List<Colaborador> colaboradores = colDAO.listar();
		sessao = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = sessao.createCriteria(Colaborador.class, "c");
		Conjunction e = Restrictions.conjunction();
		for (Colaborador c : colaboradores) {
			e.add(Subqueries.exists(DetachedCriteria
					.forClass(Empresa.class, "e")
					.setProjection(Projections.id())
					.add(Restrictions.eqProperty("c.empresa", "e.id"))
					.add(Restrictions.eq("c." + nome, valor))));
		}
		criteria.add(e);
		return criteria.list();
	}

}
