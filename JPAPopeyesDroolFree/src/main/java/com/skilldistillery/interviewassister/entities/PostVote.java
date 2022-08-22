package com.skilldistillery.interviewassister.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="post_vote")
public class PostVote {
	
	@EmbeddedId
	private PostVoteId id;
	
	private Boolean liked;
	
	@CreationTimestamp
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
	
	

	public PostVote(PostVoteId id, Boolean liked, User user, Post post) {
		super();
		this.id = id;
		this.liked = liked;
		this.user = user;
		this.post = post;
	}



	public PostVote(Boolean liked, User user, Post post) {
		super();
		this.liked = liked;
		this.user = user;
		this.post = post;
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

	public PostVoteId getId() {
		return id;
	}



	public void setId(PostVoteId id) {
		this.id = id;
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}



	public void setPost(Post post) {
		this.post = post;
	}



	@Override
	public String toString() {
		return "PostVote [liked=" + liked + ", voteDate=" + voteDate + "]";
	}

	
	
	

}
