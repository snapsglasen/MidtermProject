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
@Table(name="comment_vote")
public class CommentVote {
	
	@EmbeddedId
	private CommentVoteId id;
	
	private Boolean liked;
	
	@Column(name="vote_date")
	private LocalDateTime voteDate;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="comment_id")
	@MapsId(value="commentId")
	private Comment comment;
	
	public CommentVoteId getId() {
		return id;
	}

	public CommentVote() {
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
	

	public void setId(CommentVoteId id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "PostVote [liked=" + liked + ", voteDate=" + voteDate + "]";
	}

	
	
	

}

