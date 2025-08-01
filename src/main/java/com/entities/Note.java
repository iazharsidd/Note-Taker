package com.entities;


import java.util.Date;
import java.util.Random;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="notes")
public class Note {
	@Id
	private int id;
	private String title;
	@Column(length = 1500)
	private String content;
	private Date added_date;
	
	public Note(String title, String content, Date added_date) {
		super();
		this.id = new Random().nextInt(100000);
		this.title = title;
		this.content = content;
		this.added_date = added_date;
	}
	
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAdded_date() {
		return added_date;
	}
	public void setAdded_date(Date added_date) {
		this.added_date = added_date;
	}
	
}
