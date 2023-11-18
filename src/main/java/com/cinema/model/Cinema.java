package com.cinema.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Cine")
public class Cinema {
	@Id
	@Column(name = "cine")
	private String cinema;
	@Column(name = "ciudad_cine")
	private String city_cinema;
	@Column(name = "direccion_cine")
	private String management_cinema;
	
	/**
	 * Contructor vacío
	 */
	public Cinema() {
		super();
	}
	/**
	 * Contructor con los parametros obligatorios
	 */
	
	public Cinema(String cinema, String city_cinema) {
		super();
		this.cinema = cinema;
		this.city_cinema = city_cinema;
	}
	/**
	 * Constructor con todos los parametos
	 */
	public Cinema(String cinema, String city_cinema, String management_cinema) {
		super();
		this.cinema = cinema;
		this.city_cinema = city_cinema;
		this.management_cinema = management_cinema;
	}
	/**
	 * Get && Set
	 */
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public String getCity_cinema() {
		return city_cinema;
	}
	public void setCity_cinema(String city_cinema) {
		this.city_cinema = city_cinema;
	}
	public String getManagement_cinema() {
		return management_cinema;
	}
	public void setManagement_cinema(String management_cinema) {
		this.management_cinema = management_cinema;
	}
	
	/**
	 * Equals
	 */
	@Override
	public int hashCode() {
		return Objects.hash(cinema);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cinema other = (Cinema) obj;
		return Objects.equals(cinema, other.cinema);
	}
	
	
	
	
	

}
