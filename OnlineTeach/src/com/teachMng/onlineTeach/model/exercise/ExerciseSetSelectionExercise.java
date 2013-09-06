package com.teachMng.onlineTeach.model.exercise;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_exerciseset_t_selectionexercise")
public class ExerciseSetSelectionExercise implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 学生答题的答案<br>
	 * 字符：A、B、C、D
	 */
	private char stuAnswer;
	/**
	 * 老师的意见
	 */
	private String teacherComment;
	/**
	 * 学生的得分
	 */
	private double stuScore;
	private ExerciseSet es;
	private SelectionExercise se;
	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="seID")	
	public SelectionExercise getSe() {
		return se;
	}
	public void setSe(SelectionExercise se) {
		this.se = se;
	}
	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="esID")
	public ExerciseSet getEs() {
		return es;
	}
	public void setEs(ExerciseSet es) {
		this.es = es;
	}	
	@Column(nullable=true)
	public char getStuAnswer() {
		return stuAnswer;
	}
	public void setStuAnswer(char stuAnswer) {
		this.stuAnswer = stuAnswer;
	}
	@Column(nullable=true)
	public String getTeacherComment() {
		return teacherComment;
	}
	public void setTeacherComment(String teacherComment) {
		this.teacherComment = teacherComment;
	}
	@Column(nullable=true)
	public double getStuScore() {
		return stuScore;
	}
	public void setStuScore(double stuScore) {
		this.stuScore = stuScore;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}
}
