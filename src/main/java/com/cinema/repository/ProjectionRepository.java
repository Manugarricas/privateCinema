package com.cinema.repository;

import org.hibernate.Session;

import com.cinema.exceptions.DbExceptions;
import com.cinema.exceptions.FilmException;
import com.cinema.model.Projection;
import com.cinema.util.BdUtil;

public class ProjectionRepository {

	public static Projection find(Projection projection) throws FilmException, DbExceptions {
	       
		Projection result = null; 
        Session session = null;

        try {
            session = BdUtil.getSessionFactory().openSession();
        } catch (Exception e) {
            throw new DbExceptions("Error al conectar en la base de datos");
        }

        try {
            result = session.find(Projection.class, projection);
            session.close();
        } catch (Exception e) {
            session.close();
            throw new DbExceptions("Error al encontrar la entidad");
        }

        return result;

    }

}
