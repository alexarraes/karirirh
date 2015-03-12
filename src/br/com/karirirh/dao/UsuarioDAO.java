package br.com.karirirh.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.karirirh.entidades.Usuario;

import br.com.karirirh.util.HibernateUtil;

public class UsuarioDAO extends GenericDAO<Usuario>{
	private Session sessao;
	
	public UsuarioDAO() {
		super(Usuario.class);
	}

	public Usuario autenticador(String login, String senha){
        sessao = HibernateUtil.getSessionFactory().openSession();
        Usuario usuario; 
        usuario=(Usuario)sessao.
        		createCriteria(Usuario.class)
     		   .add(Restrictions.eq("login", login))
     		   .add(Restrictions.eq("senha", senha))
     		   .uniqueResult();
        sessao.close();

        return usuario;
    }
	
    public Usuario pesquisarCodigo(int id){
        sessao = HibernateUtil.getSessionFactory().openSession();
        Usuario usuario;
        usuario=(Usuario)sessao.
        		createCriteria(Usuario.class).add(Restrictions.eq("id", id)).uniqueResult();
        sessao.close();
        return usuario;
    }

    

    
}

