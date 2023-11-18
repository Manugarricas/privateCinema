package com.cinema.model;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="Sala")
public class Room {
	@Id
	@ManyToOne
	@JoinColumn(name = "cinema")
	private Cinema cinema;
	@Id
	private int idRoom;
	private int capacity;
	
	//Constructores
	public Room(Cinema cinema, int idRoom, int capacity) {
		super();
		this.cinema = cinema;
		this.idRoom = idRoom;
		this.capacity = capacity;
	}
	public Room() {
		super();
	}
	//Getters y setters
	public Cinema getcinema() {
		return cinema;
	}
	public void setcinema(Cinema cinema) {
		this.cinema = cinema;
	}
	public int getidRoom() {
		return idRoom;
	}
	public void setidRoom(int idRoom) {
		this.idRoom = idRoom;
	}
	public int getAforo() {
		return capacity;
	}
	public void setAforo(int capacity) {
		this.capacity = capacity;
	}
	//Hash code and equals con las primary keys
	@Override
	public int hashCode() {
		return Objects.hash(cinema, idRoom);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Room other = (Room) obj;
		return Objects.equals(cinema, other.cinema) && idRoom == other.idRoom;
	}
	
}
