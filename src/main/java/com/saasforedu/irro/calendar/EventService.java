package com.saasforedu.irro.calendar;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saasforedu.irro.model.impl.Event;

@Path("EventService")
public class EventService {
	
	com.saasforedu.irro.service.EventService eventService;

	public EventService() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
	            "applicationContext-service.xml");
		this.eventService =  (com.saasforedu.irro.service.EventService)context.getBean("eventService");
	}

	@GET
	@Path("/events")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONArray getAllEvents() {
		JSONArray jsonArray = new JSONArray();
		List<Event> eventsForPeriod = eventService.getEventsForPeriod(6);
		for (Event event : eventsForPeriod) {
			JSONObject jsonObject = new JSONObject();
			try {
				jsonObject.put("date", event.getStartDate());
				jsonObject.put("type", "Meeting");
				jsonObject.put("title", event.getTitle());
				jsonObject.put("description", event.getShortDescription());
				jsonObject.put("url", getEventFullPath(event));
				jsonArray.put(jsonObject);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		return jsonArray;
	}
	
	private String getEventFullPath(Event event) {
		if(event.getUrl() != null) {
			StringBuilder eventURL = new StringBuilder(event.getUrl());
			eventURL.append("LoadSelectedEvent.action?selectedItemId=");
			eventURL.append(event.getId());
			return eventURL.toString();
		} 
		return "http://irro-new.irro.ru/welcomeIrro";
	}
}
