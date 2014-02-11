/**
 * 
 */
package com.saasforedu.irro.model.activities.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.activities.IEducationalActivity;
import com.saasforedu.irro.model.impl.MainContent;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "EDUCATIONAL_ACTIVITY")
public class EducationalActivity implements IEducationalActivity {

	@Id
	@GeneratedValue
	@Column(name = "CONTEST_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@Column(name = "TYP")
	Integer type;
	
	@Column(name = "TYP_NAM")
	String typeName;
	
	@Column(name = "YRLY_SCHD")
	String yearlySchedule;
	
	@Column(name = "PLAN")
	String monthlyPlan;
	
	@Column(name = "CATALOG")
	String catalog;
	
	@Column(name = "CONTRACT")
	String contract;
	
	@ManyToOne(targetEntity = Activity.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_ID", nullable = false)
	Activity activity;
	
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getYearlySchedule() {
		return yearlySchedule;
	}

	public void setYearlySchedule(String yearlySchedule) {
		this.yearlySchedule = yearlySchedule;
	}

	public String getMonthlyPlan() {
		return monthlyPlan;
	}

	public void setMonthlyPlan(String monthlyPlan) {
		this.monthlyPlan = monthlyPlan;
	}

	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

}
