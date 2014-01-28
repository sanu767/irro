/**
 * 
 */
package com.saasforedu.irro.model.activities.impl;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.activities.IActivity;
import com.saasforedu.irro.model.certifications.impl.Employee;
import com.saasforedu.irro.model.certifications.impl.Graduate;
import com.saasforedu.irro.model.impl.MainContent;


/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "ACTIVITY")
public class Activity implements IActivity {

	@Id
	@GeneratedValue
	@Column(name = "ACTIVITY_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@OneToMany(targetEntity = EducationalActivity.class, mappedBy = "activity", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	List<EducationalActivity> educationalActvities;
	
	@OneToOne(targetEntity = Contest.class, mappedBy="activity", cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	Contest contest;
	
	@OneToOne(targetEntity = Olympic.class, mappedBy="activity", cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	Olympic olympic;

	@Override
	public Long getId() {
		return id;
	}

	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
	}

	public List<EducationalActivity> getEducationalActvities() {
		return educationalActvities;
	}

	public void setEducationalActvities(
			List<EducationalActivity> educationalActvities) {
		this.educationalActvities = educationalActvities;
	}

	public Contest getContest() {
		return contest;
	}

	public void setContest(Contest contest) {
		this.contest = contest;
	}

	public Olympic getOlympic() {
		return olympic;
	}

	public void setOlympic(Olympic olympic) {
		this.olympic = olympic;
	}

}
