package com.cinema.model;

import java.sql.Date;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Proyeccion")
public class Projection {
	
	@Id
	@ManyToOne
	@JoinColumn(name="sala")
	private Room room;
	
	@Id
	@ManyToOne
	@JoinColumn(name="cip")
	private Film film;
	
	@Id
	@JoinColumn(name="fecha_estreno")
	private Date fechaEstreno;
	
	@JoinColumn(name="dias_estreno")
	private int premiereDays;
	@JoinColumn(name="espectadores")
	private int viewers;
	@JoinColumn(name="recaudacion")
	private int takings;
	
	public Projection() {
		super();
	}

	public Projection(Cinema cinema, Room room, Film film, Date fechaEstreno, int premiereDays, int viewers,
			int takings) {
		super();
		this.room = room;
		this.film = film;
		this.fechaEstreno = fechaEstreno;
		this.premiereDays = premiereDays;
		this.viewers = viewers;
		this.takings = takings;
	}

	//HACER EQUALS Y HASHCODE DE LAS DEMAS CLASES Y VOLVER A HACER ESTOS
	
	@Override
	public int hashCode() {
		return Objects.hash(fechaEstreno, film, room);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Projection other = (Projection) obj;
		return Objects.equals(fechaEstreno, other.fechaEstreno)
				&& Objects.equals(film, other.film) && Objects.equals(room, other.room);
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Date getFechaEstreno() {
		return fechaEstreno;
	}

	public void setFechaEstreno(Date fechaEstreno) {
		this.fechaEstreno = fechaEstreno;
	}

	public int getPremiereDays() {
		return premiereDays;
	}

	public void setPremiereDays(int premiereDays) {
		this.premiereDays = premiereDays;
	}

	public int getViewers() {
		return viewers;
	}

	public void setViewers(int viewers) {
		this.viewers = viewers;
	}

	public int getTakings() {
		return takings;
	}

	public void setTakings(int takings) {
		this.takings = takings;
	}
	
	
}
