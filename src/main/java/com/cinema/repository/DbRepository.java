package com.cinema.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.cinema.exceptions.DbExceptions;
import com.cinema.exceptions.FilmException;
import com.cinema.model.Film;
import com.cinema.util.BdUtil;

public class DbRepository {
	
	
	public static <T> void add(Class<T> clas, T object) throws DbExceptions{
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new DbExceptions("Error al conectar en la base de datos");
			
		}
		
		transaction = session.beginTransaction();
		
		try {
			if(session.find(clas, object)==null) {
				session.persist(object);
				transaction.commit();
				session.close();
			}
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

}
