/**
 * 
 */
package com.saasforedu.irro.model.activities.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.activities.IContest;
import com.saasforedu.irro.model.impl.MainContent;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "CONTEST")
public class Contest implements IContest {

	@Id
	@GeneratedValue
	@Column(name = "CONTEST_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;

	@Column(name = "STAFF")
	String staff;
	
	@Column(name = "ORG")
	String organization;
	
	@Column(name = "REGIONAL")
	String regional;
	
	@Column(name = "LEARNER")
	String learner;
	
	@OneToOne
	@PrimaryKeyJoinColumn
	Activity activity;

	@GenericGenerator(name = "generator", strategy = "foreign", 
			parameters = @Parameter(name = "property", value = "activity"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ACTIVITY_ID", unique = true, nullable = false)
	private Long activityId;
	
	@Override
	public Long getId() {
		return id;
	}

	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
	}

	public String getStaff() {
		return staff;
	}

	public void setStaff(String staff) {
		this.staff = staff;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public String getRegional() {
		return regional;
	}

	public void setRegional(String regional) {
		this.regional = regional;
	}

	public String getLearner() {
		return learner;
	}

	public void setLearner(String learner) {
		this.learner = learner;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

}
