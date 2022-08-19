package com.skilldistillery.interviewassister.entities;


import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="question_vote")
public class QuestionVote {
	
	@EmbeddedId
	private QuestionVoteId id;
	
	private Boolean liked;
	
	@Column(name="vote_date")
	private LocalDateTime voteDate;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="question_id")
	@MapsId(value="questionId")
	private Question question;
	
	public QuestionVoteId getId() {
		return id;
	}

	public QuestionVote() {
		super();
	}

	public Boolean getLiked() {
		return liked;
	}

	public void setLiked(Boolean liked) {
		this.liked = liked;
	}

	public LocalDateTime getVoteDate() {
		return voteDate;
	}

	public void setVoteDate(LocalDateTime voteDate) {
		this.voteDate = voteDate;
	}
	

	public void setId(QuestionVoteId id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	@Override
	public String toString() {
		return "PostVote [liked=" + liked + ", voteDate=" + voteDate + "]";
	}

	
	
	

}

