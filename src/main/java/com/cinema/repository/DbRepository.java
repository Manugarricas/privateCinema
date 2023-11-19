package com.cinema.repository;
import java.util.List;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;
import com.cinema.exceptions.DbExceptions;
import com.cinema.exceptions.FilmException;
import com.cinema.util.BdUtil;
import com.cinema.util.DBUtil;



public class DbRepository {
	
	public static <T> void add(Class<T> clas, T object) throws DbExceptions{
        Session session = null;
        Transaction transaction = null;

        try {
            session = BdUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
        } catch (Exception e) {
            throw new DbExceptions("Error al conectar en la base de datos");

        }

        

        try {
           
                session.persist(object);
                transaction.commit();
                session.close();
            
        } catch (Exception e) {
            session.close();
            transaction.rollback();
            throw new DbExceptions("Error al añadir");
        }

    }
	
	public static <T> void update(Class<T> clas, T object) throws DbExceptions{
        Session session = null;
        Transaction transaction = null;

        try {
            session = BdUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
        } catch (Exception e) {
            throw new DbExceptions("Error al conectar en la base de datos");

        }

       

        try {
            
                session.merge(object);
                transaction.commit();
                session.close();
            
        } catch (Exception e) {
            session.close();
            transaction.rollback();
            throw new DbExceptions("Error al añadir");
        }

    }

    public static <T> T find(Class<T> clas, String id) throws FilmException, DbExceptions {
       
    	T result = null; 
        Session session = null;

        try {
            session = BdUtil.getSessionFactory().openSession();
        } catch (Exception e) {
            throw new DbExceptions("Error al conectar en la base de datos");
        }

        try {
            result = session.find(clas, id);
            session.close();
        } catch (Exception e) {
            session.close();
            throw new DbExceptions("Error al encontrar la entidad");
        }

        return result;

    }
	public static <T> List<T> findAll(Class<T> t) throws Exception{
		Session session = null;
		List<T> result = null;
		
		try {
			session = DBUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		try {
			result = (List<T>) session.createSelectionQuery("From " + t.getName()).getResultList();

		} catch (Exception e) {
			throw new Exception("Error al obtener la entidad");
		}
		return result;
		
	} 
	
	public static <T> void deleteEntity(Class<T> t, int id) throws Exception {
		T result = null;
		Transaction transaction = null;
		Session session = null;	
		
		try {
			session = DBUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		SelectionQuery<T> q =
						session.createSelectionQuery("From " + t.getName() + " where id = :id",t);
		q.setParameter(id, id);
		List<T> entity = q.getResultList();
		if(entity.size() != 0) { 
			transaction = (Transaction) session.beginTransaction(); 
			result = entity.get(0);
			session.remove(result); 
			transaction.commit(); 
			session.close();
		}
	}
	public static <T> void deleteEntity(Class<T> t, String id) throws Exception {
		T result = null;
		Transaction transaction = null;
		Session session = null;	
		
		try {
			session = DBUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		SelectionQuery<T> q =
						session.createSelectionQuery("From " + t.getName() + " where id = :id",t);
		q.setParameter(id, id);
		List<T> entity = q.getResultList();
		if(entity.size() != 0) { 
			transaction = (Transaction) session.beginTransaction(); 
			result = entity.get(0);
			session.remove(result); 
			transaction.commit(); 
			session.close();
		}
	}
	
	public static Object delete ( Object element) throws Exception {
		Transaction transaction = null;
		Object result= null;
		Session session = null;
		try {
			session = DBUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		try {
			session.remove(element);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return  result;
		
	}
	
	
}

