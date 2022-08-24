package com.skilldistillery.interviewassister.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class QuestionVoteId implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="user_id")
	private int userId;
	
	@Column(name="question_id")
	private int questionId;

	public QuestionVoteId() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getQuestionId() {
		return questionId;
	}
	

	public QuestionVoteId(int userId, int questionId) {
		super();
		this.userId = userId;
		this.questionId = questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(questionId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		QuestionVoteId other = (QuestionVoteId) obj;
		return questionId == other.questionId && userId == other.userId;
	}

	@Override
	public String toString() {
		return "QuestionVoteId [userId=" + userId + ", questionId=" + questionId + "]";
	}

	
	
}
