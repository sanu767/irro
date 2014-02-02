package com.saasforedu.irro.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.saasforedu.irro.dao.IEventDAO;
import com.saasforedu.irro.model.impl.Event;
import com.saasforedu.irro.service.EventService;
import com.saasforedu.irro.xmlelements.EventElement;

public class EventServiceImpl implements EventService {

	private IEventDAO eventDAO;

	public void setEventDAO(IEventDAO eventDAO) {
		this.eventDAO = eventDAO;
	}

	@Override
	public void create(List<EventElement> elements) {
		List<Event> events = new ArrayList<Event>(elements.size());
		for (EventElement element : elements) {
			Event event = new Event();
			copyProperties(element, event);
			events.add(event);
		}
		eventDAO.saveAll(events);
	}

	private void copyProperties(EventElement element, Event event) {
		event.setDate(element.getDate());
		event.setDescription(element.getDescription());
		event.setTitle(element.getTitle());
		event.setType(element.getType());
		event.setUrl(element.getUrl());
	}
}
