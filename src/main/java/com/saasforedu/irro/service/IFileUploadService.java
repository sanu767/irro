package com.saasforedu.irro.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.article.bean.MenuAttachmentBean;

public interface IFileUploadService {
	public void doFileUpload(String fileName, File sourceFile, String documentLocation) 
			throws IOException;
	public void removeAttachment(AttachmentBean fileAttachmentId, String fileLocation);
	public void deleteFiles(List<AttachmentBean> attachmentBeans, String fileLocation);
	public void deleteMenuAttachmentFiles(List<MenuAttachmentBean> attachmentBeans, String fileLocation);
	public void uploadFiles(List<String> fileNames, List<File> sourceFiles, String documentLocation) 
			throws IOException;
}
