package com.saasforedu.irro.xmlelements;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "events")
@XmlAccessorType (XmlAccessType.FIELD)
public class EventsRootElement {

	@XmlElement(name = "event")
    private List<EventElement> listOfEvents = new ArrayList<EventElement>();


	public List<EventElement> getListOfEvents() {
		return listOfEvents;
	}

	public void setListOfEvents(List<EventElement> listOfEvents) {
		this.listOfEvents = listOfEvents;
	}

	@Override
	public String toString() {
		return "EventsRootElement [listOfEvents=" + listOfEvents + "]";
	}

	
}
