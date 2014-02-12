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

import com.saasforedu.irro.model.activities.IOlympic;
import com.saasforedu.irro.model.impl.MainContent;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "OLYMPICS")
public class Olympic implements IOlympic {

	@Id
	@GeneratedValue
	@Column(name = "OLYM_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;

	@Column(name = "ALL_RUS")
	String allRussia;
	
	@Column(name = "SCHL")
	String school;
	
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

	public String getAllRussia() {
		return allRussia;
	}

	public void setAllRussia(String allRussia) {
		this.allRussia = allRussia;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
}
