package com.skilldistillery.interviewassister.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String content;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="post_id")
	private Post post;
	
	@CreationTimestamp
	@Column(name="date_created")
	private LocalDateTime dateCreated;
	
	@UpdateTimestamp
	@Column(name="last_updated")
	private LocalDateTime lastUpdated;
	
	private boolean active;
	
	@OneToMany(mappedBy="comment")
	private List<CommentVote> commentVotes;
	
//	@ManytoOne
//	@JoinColumn(name="in_reply_to_id")
//	private Comment inReplyTo;
	
	public Comment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public LocalDateTime getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(LocalDateTime lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	

	public List<CommentVote> getCommentVotes() {
		return commentVotes;
	}

	public void setCommentVotes(List<CommentVote> commentVotes) {
		this.commentVotes = commentVotes;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(active, commentVotes, content, dateCreated, id, lastUpdated, post, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		return active == other.active && Objects.equals(commentVotes, other.commentVotes)
				&& Objects.equals(content, other.content) && Objects.equals(dateCreated, other.dateCreated)
				&& id == other.id && Objects.equals(lastUpdated, other.lastUpdated) && Objects.equals(post, other.post)
				&& Objects.equals(user, other.user);
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", dateCreated=" + dateCreated + ", lastUpdated="
				+ lastUpdated + ", active=" + active + "]";
	}

	
	
}
