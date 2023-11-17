package com.cinema.repository;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.cinema.util.BdUtil;
import com.cinema.model.Character;

public class CharacterRepository {
	
//	Metodo creado para añadir los personajes

	public static Character addCharacter(Character c) {
		Transaction transaction = null;
		Character result = null;
		if(c.getName() != null) {
			Session session = BdUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			try {
				session.persist(c);
				transaction.commit();
			}catch (Exception e) {
				transaction.rollback();
			}
			
			session.close();
		}
		return result;
	}
	
//	Metodo creado para editar los personajes
	
	public static Character editCharacter(Character c){
		Transaction transaction = null;
		Character result = null;
		if(c.getName() != null) {
			Session session = BdUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			try {
				session.merge(c);
				transaction.commit();
			}catch (Exception e) {
				transaction.rollback();
			}
			
			session.close();
		}
		return result;
	}
	
//	Con este metodo devuelvo una lista de los personajes extraidos de la base de datos
	
	public static List<Character> getCharacters(){
		Session session = BdUtil.getSessionFactory().openSession();
		
		List<Character> characters = new ArrayList<Character>();
		
		characters = (List<Character>) session.createSelectionQuery( "From Character" ).getResultList();
		
		session.close();
		
		return characters;
	}
	
//	Con este metodo obtenemos un solo objeto de Personaje
	
	public static Character getCharacter(String nombre_persona) {
		Character result = null;
		Session session = BdUtil.getSessionFactory().openSession();

		SelectionQuery<Character> q =
				session.createSelectionQuery("From Character where name = :name", Character.class);
				q.setParameter("name", nombre_persona);
				List<Character> names = q.getResultList();
				if(names.size() != 0) {
					result = names.get(0);
				}
				return result;
	}
	
	//Metodo creado para borrar los personajes
	
	public static void deleteCharacter(String nombre_persona) {
		Character result = null;
		Session session = BdUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		SelectionQuery<Character> q =
				session.createSelectionQuery("From Character where name = :name", Character.class);
				q.setParameter("name", nombre_persona);
				List<Character> names = q.getResultList();
		if(names.size() != 0) {
			transaction = session.beginTransaction();
			result = names.get(0);
			session.remove(result);
			transaction.commit();
		}
	}
	
}
