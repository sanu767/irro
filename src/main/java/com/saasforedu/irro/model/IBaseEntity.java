package com.saasforedu.irro.model;

/**
 * 
 * @author sanket
 * 
 *         Base entity. All entities should implement this interface.
 * 
 */
public interface IBaseEntity {

	public Long getId();

	public int hashCode();

	public boolean equals(Object obj);
}
