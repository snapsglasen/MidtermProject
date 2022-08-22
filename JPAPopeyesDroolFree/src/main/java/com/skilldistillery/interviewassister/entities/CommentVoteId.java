package com.skilldistillery.interviewassister.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CommentVoteId implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="comment_id")
	private int commentId;
	
	@Column(name="user_id")
	private int userId;
	
	public CommentVoteId() {
		super();
	}
	
	public CommentVoteId(int commentId, int userId) {
		super();
		this.commentId = commentId;
		this.userId = userId;
	}



	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(commentId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentVoteId other = (CommentVoteId) obj;
		return commentId == other.commentId && userId == other.userId;
	}

	@Override
	public String toString() {
		return "CommentVoteId [userId=" + userId + ", commentId=" + commentId + "]";
	}
	
}
