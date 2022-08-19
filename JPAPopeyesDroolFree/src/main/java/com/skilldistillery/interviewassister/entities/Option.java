package com.skilldistillery.interviewassister.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Option {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	@Column(name="option_text")
	private String optionText;
	
	@ManyToOne
	@JoinColumn(name="question_id")
	private Question question;
	
	@Column(name="correct")
	private boolean correct;

}
