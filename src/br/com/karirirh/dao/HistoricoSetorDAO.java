package br.com.karirirh.dao;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;



import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.HistoricoSetor;
import br.com.karirirh.util.HibernateUtil;

public class HistoricoSetorDAO extends GenericDAO<HistoricoSetor>{

	private Session sessao;
	public HistoricoSetorDAO() {
		super(HistoricoSetor.class);
	}

	public HistoricoSetor ultimoHistoico(Colaborador obj){
        sessao = HibernateUtil.getSessionFactory().openSession();
        HistoricoSetor historicoSetor; 
        /*Fazer uma busca onde a dataFim for nula e a chave estrangeira do colaborador for igual a do 
         * colaborador que ta mudando de cargo.
         * 
         */
        historicoSetor=(HistoricoSetor)sessao.createCriteria(HistoricoSetor.class)
     		   .add(Restrictions.eq("finalizado", false))
     		   .add(Restrictions.eq("colaborador", obj ))
     		   .uniqueResult();
        sessao.close();

        return historicoSetor;
    }
}
