package com.cinema.model;

import java.sql.Date;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="Entrada")
public class Ticket {

	 @Id
	 @ManyToOne
	 @JoinColumns({@JoinColumn(name="cine"),@JoinColumn(name="sala"),@JoinColumn(name="cip"),@JoinColumn(name="fecha_estreno")})
	 private Projection projection;
	 
	 @Id
	 @ManyToOne
	 @JoinColumn(name="usuario")
	 private User user;
	 
	 @Id
	 @Column(name="idEntrada")
	 private int id;
	 private Date fecha_compra;
	 
	//Constructores
	//Constructor con todos los campos
	public Ticket(Projection projection, User user, int id, Date fecha_compra) {
		super();
		this.projection = projection;
		this.user = user;
		this.id = id;
		this.fecha_compra = fecha_compra;
	}
	//Constructor con solo las pk y fk
	public Ticket(Projection projection, User user, int id) {
		super();
		this.projection = projection;
		this.user = user;
		this.id = id;
	}
	//Constructor vacio
	public Ticket() {
		super();
	}
	
	//Getters y setters
	public Projection getProjection() {
		return projection;
	}
	public void setProjection(Projection projection) {
		this.projection = projection;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getFecha_compra() {
		return fecha_compra;
	}
	public void setFecha_compra(Date fecha_compra) {
		this.fecha_compra = fecha_compra;
	}
	
	//HasCode and equals with only the pk's and the fk's
	@Override
	public int hashCode() {
		return Objects.hash(id, projection, user);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ticket other = (Ticket) obj;
		return id == other.id && Objects.equals(projection, other.projection) && Objects.equals(user, other.user);
	}
	 
}
