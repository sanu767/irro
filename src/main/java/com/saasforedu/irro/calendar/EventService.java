package com.saasforedu.irro.calendar;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

@Path("EventService")
public class EventService {
	
	@GET
	@Path("/events")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONArray getAllEvents() {
		//TODO sankar added database connection
		//to retreieve data from DB
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < 5; i++) {
			JSONObject jsonObject = new JSONObject();
			try {
				jsonObject.put("date", "2014-01-0"+(8+i)+" 17:3"+i+":00");
				jsonObject.put("type", "Meeting");
				jsonObject.put("title", "IRRO Project meeting");
				jsonObject.put("description", "Discussion About the IRRO expansion");
				jsonObject.put("url", "http://irro-new.irro.ru/welcomeIrro");
				jsonArray.put(jsonObject);
			} catch (JSONException e) {
				e.printStackTrace();
			}	
		}
		
		return jsonArray;
	
	}
}
