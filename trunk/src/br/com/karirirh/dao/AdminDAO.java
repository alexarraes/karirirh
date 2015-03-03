package br.com.karirirh.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.karirirh.entidades.Admin;
import br.com.karirirh.entidades.Admin;
import br.com.karirirh.entidades.Admin;
import br.com.karirirh.util.HibernateUtil;

public class AdminDAO {

	private Session sessao;
	
	public Admin autenticador(String login, String senha){
        sessao = HibernateUtil.getSessionFactory().openSession();
        Admin admin; 
        admin=(Admin)sessao.createCriteria(Admin.class)
     		   .add(Restrictions.eq("login", login))
     		   .add(Restrictions.eq("senha", senha))
     		   .uniqueResult();
        sessao.close();

        return admin;
    }
	
    public Admin pesquisarCodigo(int id){
        sessao = HibernateUtil.getSessionFactory().openSession();
        Admin admin;
        admin=(Admin)sessao.createCriteria(Admin.class).add(Restrictions.eq("id", id)).uniqueResult();
        sessao.close();
        return admin;
    }
	
}

