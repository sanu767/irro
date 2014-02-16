package com.saasforedu.irro.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang.StringUtils;

import com.saasforedu.irro.bean.UserPermissionBean;
import com.saasforedu.irro.enums.PermissionType;
import com.saasforedu.irro.model.IUser;

public class IrroUtils {
	
	
	public static Mail getMail(IUser user) {
		StringBuilder content = getContent(user);
		Mail mail = new Mail();
		mail.setFrom(IConstants.WEBADMIN_MAIL_ADDRESS);
		mail.setTo(user.getEmail());
		mail.setSubject(IConstants.MAIL_SUBJECT_FOR_LOGIN_CREDENTIALS);
		mail.setContent(content.toString());
		return mail;
	}
	
	public static void sendMail(Mail mail) {
		// Recipient's email ID needs to be mentioned.
		String to = mail.getTo();

		// Sender's email ID needs to be mentioned
		String from = mail.getFrom();		
		// Get system properties
		Properties properties = System.getProperties();
		// Setup mail server
		// Assuming you are sending email from localhost
		properties.setProperty(IConstants.MAIL_SMTP_HOST, IConstants.LOCAL_HOST);
		// Get the default Session object.
		Session session = Session.getDefaultInstance(properties);

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));
			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// Set Subject: header field
			message.setSubject(IConstants.MAIL_SUBJECT_FOR_LOGIN_CREDENTIALS);
			// Send the actual HTML message, as big as you like

			message.setContent(mail.getContent(), IConstants.MAIL_CONTENT_TYPE );
			// Send message
			Transport.send(message);
		}catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
	
	public static String[] getParamArray(List<String> params) {
		String [] paramArray = new String [params.size()];
		int i = 0;
		while(i < params.size()) {
			paramArray[i] = params.get(i);
			i++;
		}
		return paramArray;
	}
	
	public static List<Long> getLongListFromStringArray(String [] selectedUserIds) {
		List<Long> userIds = new ArrayList<Long>();
		for (String code : selectedUserIds) {
			userIds.add(Long.parseLong(code));
		}
		return userIds;
	}
	
	public static List<Integer> getIntegerListFromStringArray(String [] selectedUserIds) {
		List<Integer> userIds = new ArrayList<Integer>();
		for (String code : selectedUserIds) {
			userIds.add(Integer.parseInt(code));
		}
		return userIds;
	}
	
	public static Map<String, Boolean> getPermissionMap(List<String> allGroupNames, 
			List<UserPermissionBean> permissionBeans) {
		Map<String, Boolean> permissionMapsForUser = new HashMap<String, Boolean>();
		for (String groupName : allGroupNames) {			
			boolean groupExists = IrroUtils.isGroupExists(permissionBeans, groupName);
			permissionMapsForUser.put(groupName, groupExists);
		}
		return permissionMapsForUser;
	}
	
	private static boolean isGroupExists(List<UserPermissionBean> permissionBeans, String groupName) {
		for (UserPermissionBean userPermissionBean : permissionBeans) {
			String permissionName = userPermissionBean.getPermissionName();
			if(StringUtils.equals(groupName, permissionName) && 
					userPermissionBean.getPermissionType().equals(PermissionType.APPROVED.getTypeId())) {
				return true;
			}
		}
		return false;
	}

	private static StringBuilder getContent(IUser user) {
		StringBuilder content = new StringBuilder("<h2>This is your credentials</h2>");
		content.append("<h2>This is your UserId : </h2>");
		content.append(user.getUserCode());			
		content.append("<br>");
		content.append("<h2>This is your Password : </h2>");
		content.append(user.getPassword());
		return content;
	}
}
