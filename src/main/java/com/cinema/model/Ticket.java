package com.cinema.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.Table;

@Entity
@Table(name="Entrada")
public class Ticket {

	@Id
	@JoinColumns({@JoinColumn(name="cine"), @JoinColumn(name="sala")})
	private String Cip;
	
}
