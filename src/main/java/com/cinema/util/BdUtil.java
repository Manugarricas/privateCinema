package com.cinema.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class BdUtil {
  
  
	private static SessionFactory sessionFactory;
	 
	 public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
				sessionFactory = new MetadataSources(sr).buildMetadata().buildSessionFactory();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sessionFactory;
	 }

}
