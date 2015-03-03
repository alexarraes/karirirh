package br.com.karirirh.dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.util.HibernateUtil;


public class UsuarioDAO extends GenericDAO<Usuario>{
	
	public UsuarioDAO() {
		// TODO Auto-generated constructor stub
		super(Usuario.class);
	}
	
	 
	/*public Usuario pesquisarCodigo(int id){
         setSessao(HibernateUtil.getSessionFactory().openSession());
         Usuario u;
         //Cria
         u=(Usuario)getSessao().createCriteria(Usuario.class).add(Restrictions.eq("id", id)).uniqueResult();
         //No caso se ele quisesse que retornasse muito colocaria list no lugar de unique
         getSessao().close();
         return u;
     }*/
     
     /*public List<Usuario> pesquisarLogin(String login){
         setSessao(HibernateUtil.getSessionFactory().openSession());
         List<Usuario> u;
         u=(List<Usuario>)getSessao().createCriteria(Usuario.class).add(Restrictions.ilike("login",login,MatchMode.ANYWHERE)).list();
         getSessao().close();
         return u;
     }*/
     
       /*public List<Usuario> ListarUsuarios(){
         sessao = HibernateUtil.getSessionFactory().openSession();
         List<Usuario> u;
         u=(List<Usuario>)sessao.createCriteria(Usuario.class).list();
         sessao.close();
         return u;
     }*/

       public Usuario autenticador(String login, String senha){
           setSessao(HibernateUtil.getSessionFactory().openSession());
           Usuario u; //Se for um ou trocar o eq por or
           u=(Usuario)getSessao().createCriteria(Usuario.class)
        		   .add(Restrictions.eq("login", login))
        		   .add(Restrictions.eq("senha", senha))
        		   .uniqueResult();
           getSessao().close();

           return u;
           
       }
       
}
