package com.saasforedu.irro.service;

import java.util.List;

import com.saasforedu.irro.model.impl.Event;
import com.saasforedu.irro.xmlelements.EventElement;

public interface EventService {
	
	public void create(List<EventElement> elements);
	
	public List<Event> getEventsForPeriod(int numberOfMonths);

}