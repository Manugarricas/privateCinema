package com.cinema.repository;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.cinema.util.DBUtil;


public class DbRepository {
	
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
	
	public static <T> T find(Class <T>t, String id) throws Exception {
		Transaction transaction = null;
		Session session;
		T result=null;
		try {
			session = DBUtil.getSessionFactory().openSession();
			
		} catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		try {
			result = session.find(t, id);
		} catch (Exception e) {
			throw new Exception("Error al obtener la entidad");
		}
		return result;
	}
}
