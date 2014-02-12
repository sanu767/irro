package com.saasforedu.irro.dao;

import java.io.Serializable;

public interface IBaseDAO<E> {

	public Serializable  create(E entity);

	public void update(E entity);
	
	@SuppressWarnings("rawtypes")
	public E findById(Class clazz, Long id) ;
}
