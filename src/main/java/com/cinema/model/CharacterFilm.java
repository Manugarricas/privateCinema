package com.cinema.model;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="PersonajePelicula")
public class CharacterFilm {
	
	@Id
	@ManyToOne
	@JoinColumn(name="idPersonaje")
	private Character character;
	
	@Id
	@ManyToOne
	@JoinColumn(name="idPelicula")
	private Film film;

	public CharacterFilm() {
		super();
	}

	public CharacterFilm(Character character, Film film) {
		super();
		setCharacter(character);
		setFilm(film);
	}

	public Character getCharacter() {
		return character;
	}

	private void setCharacter(Character character) {
		this.character = character;
	}

	public Film getFilm() {
		return film;
	}

	private void setFilm(Film film) {
		this.film = film;
	}
	
	



}
