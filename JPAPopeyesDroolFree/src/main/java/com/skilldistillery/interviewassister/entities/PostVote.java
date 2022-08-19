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
@Table(name="post_vote")
public class PostVote {
	
	@EmbeddedId
	private PostVoteId id;
	
	private Boolean liked;
	
	@Column(name="vote_date")
	private LocalDateTime voteDate;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="post_id")
	@MapsId(value="postId")
	private Post post;
	

	public PostVote() {
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

	@Override
	public String toString() {
		return "PostVote [liked=" + liked + ", voteDate=" + voteDate + "]";
	}

	
	
	

}
