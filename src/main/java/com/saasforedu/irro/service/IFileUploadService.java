package com.saasforedu.irro.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.saasforedu.irro.article.bean.AttachmentBean;

public interface IFileUploadService {
	public void doFileUpload(String fileName, File sourceFile, String documentLocation) 
			throws IOException;
	public void removeAttachment(AttachmentBean fileAttachmentId, String fileLocation);
	public void deleteFiles(List<AttachmentBean> attachmentBeans, String fileLocation);
}
