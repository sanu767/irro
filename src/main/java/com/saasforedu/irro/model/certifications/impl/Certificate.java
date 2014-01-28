/**
 * 
 */
package com.saasforedu.irro.model.certifications.impl;

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

import com.saasforedu.irro.model.certifications.ICertificate;
import com.saasforedu.irro.model.impl.MainContent;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "CERTIFICATE")
public class Certificate implements ICertificate {

	@Id
	@GeneratedValue
	@Column(name = "CE_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@OneToOne(targetEntity = Employee.class, mappedBy="cert", cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	Employee employee;
	
	@OneToMany(targetEntity = Graduate.class, mappedBy = "cert", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	List<Graduate> graduates;
	
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<Graduate> getGraduates() {
		return graduates;
	}

	public void setGraduates(List<Graduate> graduates) {
		this.graduates = graduates;
	}
	
}
