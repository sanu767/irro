package com.saasforedu.irro.util;


public interface IConstants {

	public static final String EVENTS = "Events";
	public static final String NEWS = "News";	
	public static final String REJECTED = "Rejected";
	public static final String APPROVED = "Approved";
	public static final String PENDING_APPROVAL = "Pending Approval";
	public static final String NOT_REQUESTED = "Not Requested";
	
	/** Mail Constants**/
	public static final String WEBADMIN_MAIL_ADDRESS = "webadmin@irro.ru";
	public static final String MAIL_SUBJECT_FOR_LOGIN_CREDENTIALS = "Credentials for your irro login";
	public static final String LOCAL_HOST = "localhost";
	public static final String MAIL_SMTP_HOST = "mail.smtp.host";
	public static final String MAIL_CONTENT_TYPE = "text/html";
	public static final String FEEDBACK_TO_EMAIL = "irro@irro.ru";
	
	public static final boolean FALSE = Boolean.FALSE;
	public static final String SLIDER = "/slider";
	
	/** Path Constants **/
	public static final String EVENTS_DOCUMENT_PATH = "/Docs/Events/";
	public static final String ITEMS_DOCUMENT_PATH = "/Docs/Items/";
	public static final String NEWS_DOCUMENT_PATH = "/Docs/News/";
	public static final String ARTICLES = "/Docs/Articles";
	public static final String MENU_ATTACHMENTS = "/Docs/Attachments";
	
	/** Bundle Properties **/
	public static final String IRRO_BUNDLE = "IrroBundle";
	public static final String ISO_8859_1 = "ISO-8859-1";
	public static final String UTF_8 = "UTF-8";
	
	/** Session Attributes **/
	
	public static final String PERMISSION_LIST_SESSION_ATTRIBUTE_NAME = "PermissionList";
	public static final String USER_ID_SESSION_ATTRIBUTE_NAME = "userId";
	
	/** Session Attributes
	 * File Uploading Attributes **/
	public static final String UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME = "UploadedArticleFiles";
	public static final String UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME = "UploadedNewsFiles";
	public static final String UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME = "UploadedEventsFiles";
	public static final String UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME = "UploadedItemsFiles";
	public static final String UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME = "UploadedSearchedItems";

}
