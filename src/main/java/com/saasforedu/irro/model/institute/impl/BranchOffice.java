/**
 * 
 */
package com.saasforedu.irro.model.institute.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.IBranchOffice;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "BRANCH_OFFICE")
public class BranchOffice implements IBranchOffice {

	
	@Id
	@GeneratedValue
	@Column(name = "BRANCH_ID")
	private Long id;
	
	@Column(name = "MAIN_BRANCH")
	String mainBranch;
	
	@Column(name = "NIZHNY")
	String nizhny;
	
	@Column(name = "KAMYSHLOV")
	String kamyshlov;
	
	@Column(name = "KRA")
	String krasnoufimsk;
	
	@Column(name = "SEROV")
	String serov;
	
	@OneToOne
	@PrimaryKeyJoinColumn
	Institute institute;
	
	@Override
	public Long getId() {
		return id;
	}

	public String getMainBranch() {
		return mainBranch;
	}

	public void setMainBranch(String mainBranch) {
		this.mainBranch = mainBranch;
	}

	public String getNizhny() {
		return nizhny;
	}

	public void setNizhny(String nizhny) {
		this.nizhny = nizhny;
	}

	public String getKamyshlov() {
		return kamyshlov;
	}

	public void setKamyshlov(String kamyshlov) {
		this.kamyshlov = kamyshlov;
	}

	public String getKrasnoufimsk() {
		return krasnoufimsk;
	}

	public void setKrasnoufimsk(String krasnoufimsk) {
		this.krasnoufimsk = krasnoufimsk;
	}

	public String getSerov() {
		return serov;
	}

	public void setSerov(String serov) {
		this.serov = serov;
	}

	public Institute getInstitute() {
		return institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

}
