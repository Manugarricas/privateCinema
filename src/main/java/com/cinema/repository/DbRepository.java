package com.cinema.repository;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cinema.exceptions.DbExceptions;
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

}
