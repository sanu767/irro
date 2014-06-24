package com.saasforedu.irro.util;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.imageio.ImageIO;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;

import com.saasforedu.irro.article.action.Menu;
import com.saasforedu.irro.bean.FeedBackBean;
import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.bean.UserPermissionBean;
import com.saasforedu.irro.enums.PermissionType;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.IUser;
import com.saasforedu.irro.model.impl.MenuMetadata;
import com.sun.mail.smtp.SMTPTransport;

public class IrroUtils {
	
	private static final String MIME_VIDEO = "video";
	private static final String MIME_IMAGE = "image";

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
			message.setSubject(mail.getSubject());
			// Send the actual HTML message, as big as you like

			message.setContent(mail.getContent(), IConstants.MAIL_CONTENT_TYPE );
			// Send message
			Transport.send(message);
		}catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
	
	public static boolean sendFeedbackMail(FeedBackBean feedBackBean)  {
		
		boolean emailSent = true;
		
		// Recipient's email ID needs to be mentioned.
		String to = IConstants.FEEDBACK_TO_EMAIL;

		// Sender's email ID needs to be mentioned
		String from = IConstants.FEEDBACK_FROM_EMAIL;		
		// Get system properties
		Properties properties = System.getProperties();
		
		// Setup mail server
		// Assuming you are sending email from localhost
		properties.setProperty(IConstants.MAIL_SMTP_HOST, IConstants.LOCAL_HOST);
		properties.put("mail.smtp.port", "25");
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.submitter", "feedback@irro.ru");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.password", "gh0dthr@");
		
		
		Session session = Session.getDefaultInstance(properties);

		try {
			MimeMessage message = new MimeMessage(session);
			message.setHeader("Content-Type", IConstants.MAIL_CONTENT_TYPE);
			String [] languageArray = new String [] {"ru", "en"};
			message.setContentLanguage(languageArray);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(feedBackBean.getSubject(), "UTF-8");
			message.setContent(getContent(feedBackBean).toString(), IConstants.MAIL_CONTENT_TYPE );

			SMTPTransport transport = (SMTPTransport)session.getTransport("smtp");
			transport.connect("87.250.250.38", 25, "feedback@irro.ru",  "gh0dthr@");
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException mex) {
			mex.printStackTrace();
			emailSent = false;
		}
		return emailSent;
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
	
	public static List<String> getPermissionMap(List<UserGroupBean> allGroups, List<UserPermissionBean> permissionBeans) {
		List<String> permissionCodeList = new ArrayList<String>();
		for (UserGroupBean group : allGroups) {			
			boolean groupExists = IrroUtils.isGroupExists(permissionBeans, group.getGroupName());
			if(groupExists) {
				permissionCodeList.add(group.getGroupName());
			}
		}
		return permissionCodeList;
	}
	
	public static String getDocumentLocation(String menu, String parentMenu) {
		
		StringBuilder locationBuilder = new StringBuilder();
		if(StringUtils.isNotBlank(parentMenu))  {
			locationBuilder.append("/");
			locationBuilder.append(parentMenu);			
		}
		
		if(StringUtils.isNotBlank(menu))  {
			locationBuilder.append("/");
			locationBuilder.append(menu);
			locationBuilder.append("/");
		}
		
		return locationBuilder.toString();
	}
	
	public static boolean isImage(String fileType) {
		String type = getMIMEType(fileType);
		return StringUtils.equals(MIME_IMAGE, type);
	}

	public static boolean isVideo(String fileType) {
		String type = getMIMEType(fileType);
		return StringUtils.equals(MIME_VIDEO, type);
	}
	
	public static boolean isOtherThanVideoAndImage(String fileType) {
		String type = getMIMEType(fileType);
		return !(StringUtils.equals(MIME_VIDEO, type) || 
				StringUtils.equals(MIME_IMAGE, type));
		
	}
	
	public static String getResourceString(String value) {
		try {
			//TODO : Could be done better
			ResourceBundle resourceBundle = ResourceBundle.getBundle(IConstants.IRRO_BUNDLE, Locale.ENGLISH);
			String encodedValue = new String(value.getBytes(IConstants.UTF_8), IConstants.ISO_8859_1);
			Enumeration<String> enumeration = resourceBundle.getKeys();
			while (enumeration.hasMoreElements()) {
				String resourceKey = enumeration.nextElement();
				String resourceValue = resourceBundle.getString(resourceKey);
				if(encodedValue.equals(resourceValue)) {
					return resourceKey;
				}
			}
			return null;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MissingResourceException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Menu formMenuTree(IMenuMetadata menuTree) {
		Menu root = new Menu();
		root.setLabel(menuTree.getLabel());
		root.setId(menuTree.getId());
		root.setMenuType(menuTree.getMenuType());
		root.setChildren(buildMenu(root, menuTree));
		return root;
	}
	
	public static String getDisplayNameForOtherDocs(String name) {
		StringBuffer strBuff = new StringBuffer(name);
		if(strBuff.length() > 30 ) {
			StringBuffer replace = strBuff.replace(29, name.length(), "...");
			return replace.toString();
		}
		return name;
	}
	
	/**
	 * Resizes images with newWidth and newHeight but maintains aspect ratio
	 * @param file
	 * @param newWidth
	 * @param newHeight
	 * @return
	 */
	public static File scaleImage(File file, int newWidth, int newHeight) {
		try {
			BufferedImage image = ImageIO.read(file);
			int imageHeight = image.getHeight();
			int imageWidth = image.getWidth();
			if(imageHeight > newWidth || imageWidth > newHeight) {
				File destFile = new File(file.getAbsolutePath());
				double thumbRatio = (double) newWidth / (double) newHeight;
				double aspectRatio = (double) imageWidth / (double) imageHeight;
				if (thumbRatio < aspectRatio) {
					newHeight = (int) (newWidth / aspectRatio);
				} else {
					newWidth = (int) (newHeight * aspectRatio);
				}

				// Draw the scaled image
				BufferedImage newImage = new BufferedImage(newWidth, newHeight,
						image.getType());
				Graphics2D graphics2D = newImage.createGraphics();
				graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
						RenderingHints.VALUE_INTERPOLATION_BILINEAR);
				graphics2D.drawImage(image, 0, 0, newWidth, newHeight, null);
				
				ImageIO.write(newImage, FilenameUtils.getExtension(file.getName()), destFile);
				return destFile;
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return file;
	}
	
	private static List<Menu> buildMenu(Menu root, IMenuMetadata menuTree) {
		List<MenuMetadata> childrenMenuMeta = menuTree.getChildren();
		List<Menu> children = new LinkedList<Menu>();
		for (MenuMetadata menuMetadata : childrenMenuMeta) {
			if(menuMetadata.isTree()) {
				Menu child = new Menu();
				child.setId(menuMetadata.getId());
				child.setLabel(menuMetadata.getLabel());
				child.setMenuType(menuMetadata.getMenuType());
				child.setChildren(buildMenu(child, menuMetadata));
				child.setParent(root);
				children.add(child);
			}
		}
		
		return children;
	}
	
	private static String getMIMEType(String fileType) {
		if(fileType.contains("/")) {
			String type = fileType.split("/")[0];
			return type;
		}
		return null;
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
	
	private static StringBuilder getContent(FeedBackBean feedBackBean) {
		StringBuilder content = new StringBuilder("<h2>Hi Admin </h2>");
		content.append("<br>");
		content.append(feedBackBean.getName());
		content.append("<br>");
		content.append("<br>");
		content.append("Email : ");
		content.append(feedBackBean.getEmail());
		content.append("<br>");
		content.append("<br>");
		content.append("Sent a feedback. Please see below.");
		content.append("<br>");
		content.append("<br>");
		content.append(feedBackBean.getMessage());
		return content;
	}
	
}
