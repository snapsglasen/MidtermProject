package com.skilldistillery.interviewassister.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Question {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="question_text")
	private String questionText;
	
	@OneToMany(mappedBy="question")
	private List<QuestionVote> questionVotes;
	
	private boolean active;
	

//	@OneToMany(mappedBy="question")
//	private List<Option> Options;
	
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@OneToMany(mappedBy="question")
	private List<Attempt> attempts;

	public List<Attempt> getAttempts() {
		return attempts;
	}

	public void setAttempts(List<Attempt> attempts) {
		this.attempts = attempts;
	}

	public Question() {
		super();
	}

	public Question(String questionText2) {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestionText() {
		return questionText;
	}

	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

	public List<QuestionVote> getQuestionVotes() {
		return questionVotes;
	}

	public void setQuestionVotes(List<QuestionVote> questionVotes) {
		this.questionVotes = questionVotes;
	}

//	public List<Option> getOptions() {
//		return Options;
//	}
//
//	public void setOptions(List<Option> options) {
//		Options = options;
//	}

	@Override
	public int hashCode() {
		return Objects.hash(id, questionText, questionVotes);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Question other = (Question) obj;
		return id == other.id && Objects.equals(questionText, other.questionText)
				&& Objects.equals(questionVotes, other.questionVotes);
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", questionText=" + questionText + "]";
	}
	
	
}
