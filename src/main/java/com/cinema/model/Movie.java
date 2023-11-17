package com.cinema.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="Pelicula")
public class Movie {
	
	@Id
	@Column(name="cip")
	private String id;
	@Column(name="titulo_p")
	private String name;
	@Column(name="ano_produccion")
	private int year;
	@Column(name="titulo_s")
	private String secundaryName;
	@Column(name="nacionalidad")
	private String nacionality;
	@Column(name="presupuesto")
	private int cost;
	@Column(name="duracion")
	private int duration;
	
	public Movie () {
		super();
	}
	
	public Movie(String id, String name, int year, String secundaryName, String nacionality, int presupuesto,
			int duracion) {
		super();
		this.id = id;
		this.name = name;
		this.year = year;
		this.secundaryName = secundaryName;
		this.nacionality = nacionality;
		this.cost = presupuesto;
		this.duration = duracion;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getSecundaryName() {
		return secundaryName;
	}

	public void setSecundaryName(String secundaryName) {
		this.secundaryName = secundaryName;
	}

	public String getNacionality() {
		return nacionality;
	}

	public void setNacionality(String nacionality) {
		this.nacionality = nacionality;
	}

	public int getPresupuesto() {
		return cost;
	}

	public void setPresupuesto(int presupuesto) {
		this.cost = presupuesto;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Movie other = (Movie) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", year=" + year + ", secundaryName=" + secundaryName
				+ ", nacionality=" + nacionality + ", presupuesto=" + cost + ", duration=" + duration + "]";
	}
	
	
	

}
