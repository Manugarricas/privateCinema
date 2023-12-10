package com.cinema.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.SelectionQuery;

import com.cinema.model.Ticket;
import com.cinema.model.User;
import com.cinema.util.DBUtil;

public class TicketRepository {
	
	public static List<Ticket> getTickets(User user) {
		Session session = null;
		List<Ticket> listTickets = null;
		try {
			session = DBUtil.getSessionFactory().openSession();
		}catch (Exception e) {
			e.printStackTrace();
		}
		try {
			SelectionQuery<Ticket> query = (SelectionQuery<Ticket>)
					session.createNativeQuery("select * from Entrada where usuario = :user",Ticket.class);
			query.setParameter("user", user.getUsername());
			listTickets = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listTickets;
	}
	
	/*
	public static ArrayList<Room> getRooms(String cinema) throws Exception{
		ArrayList<Room> listRooms = null;
		Session session = null;
		try {
			session = BdUtil.getSessionFactory().openSession();
			SelectionQuery<Room> queryRoom = (SelectionQuery<Room>)
					session.createNativeQuery("select * from Sala where cine = :cine",Room.class);
			queryRoom.setParameter("cine", cinema);
			listRooms = (ArrayList<Room>) queryRoom.getResultList();
			session.close();
 		}catch (Exception e) {
 			session.close();
 			throw new Exception("Error al conectar a la base de datos "+ e.getMessage());
 		}
		session.close();
		return listRooms;
	}
	*/
}
