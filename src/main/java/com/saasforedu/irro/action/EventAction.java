package com.saasforedu.irro.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.service.EventService;
import com.saasforedu.irro.xmlelements.EventElement;
import com.saasforedu.irro.xmlelements.EventsRootElement;

public class EventAction extends ActionSupport {

	private static final String PATH = "E:\\Data";
	private static final long serialVersionUID = 1L;

	private EventService eventService;
	
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	public String createEvent() throws Exception {

		List<EventElement> elements = new ArrayList<EventElement>();
		try {
			File folder = new File(PATH);
			for (final File file : folder.listFiles()) {
				if (!file.isDirectory()) {
					
					JAXBContext jaxbContext = 
							JAXBContext.newInstance(EventsRootElement.class);
					Unmarshaller jaxbUnmarshaller = 
							jaxbContext.createUnmarshaller();
					EventsRootElement events = 
							(EventsRootElement) jaxbUnmarshaller.unmarshal(file);

					for (EventElement elem : events.getListOfEvents()) {
						elements.add(elem);
					}
				}
			}
		} catch (JAXBException e) {
			e.printStackTrace();
		}

		eventService.create(elements);
		return SUCCESS;
	}
}
