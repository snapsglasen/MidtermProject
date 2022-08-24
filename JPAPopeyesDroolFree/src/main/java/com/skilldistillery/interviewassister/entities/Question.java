package com.skilldistillery.interviewassister.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

@Entity
public class Question {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "question_text")
	private String questionText;

	@OneToMany(mappedBy = "question")
	private List<QuestionVote> questionVotes;

	private Boolean active;

	private String description;

	@ManyToMany
	@JoinTable(name = "question_has_category", joinColumns = @JoinColumn(name = "question_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Category> categories;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public Question(String questionText, List<Category> categories) {
		super();
		this.questionText = questionText;
		this.categories = categories;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	@OneToMany(mappedBy = "question")
	private List<Option> options;

	public Boolean isActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	@OneToMany(mappedBy = "question")
	private List<Attempt> attempts;

	public List<Attempt> getAttempts() {
		return attempts;
	}

	public void setAttempts(List<Attempt> attempts) {
		this.attempts = attempts;
	}

	public String getDescription() {
		return description;
	}

	public Question(String questionText, String description, List<Category> categories) {
		super();
		this.questionText = questionText;
		this.description = description;
		this.categories = categories;
	}

	public Question(String questionText, String description, List<Category> categories, User user) {
		super();
		this.questionText = questionText;
		this.description = description;
		this.categories = categories;
		this.user = user;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Question() {
		super();
	}

	public Question(String questionText) {
		super();
		this.questionText = questionText;
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

	public List<Option> getOptions() {
		return options;
	}

	public void setOptions(List<Option> options) {
		this.options = options;
	}

	public Boolean getActive() {
		return active;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void addQuestionVote(QuestionVote questionVote) {
		if (questionVotes == null) {
			questionVotes = new ArrayList<>();
		}

		if (!questionVotes.contains(questionVote)) {
			questionVotes.add(questionVote);
		}
	}

	public int getLikes() {
		try {
			return questionVotes.size();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public void removeQuestionVote(QuestionVote questionVote) {
		if (questionVotes != null && questionVotes.contains(questionVote)) {
			questionVotes.remove(questionVote);
		}
	}

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
