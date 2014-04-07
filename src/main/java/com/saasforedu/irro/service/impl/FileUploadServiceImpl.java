package com.saasforedu.irro.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.service.IFileUploadService;

public class FileUploadServiceImpl implements IFileUploadService {

	@Override
	public void doFileUpload(String fileName, File sourceFile, String documentLocation) 
			throws IOException {
		//Save the File in Server
		createDocumentDirectory(documentLocation);//Create Directory	

		//Copy File
		File destFile  = new File(documentLocation, fileName);
		FileUtils.copyFile(sourceFile, destFile);
	}
	
	@Override
	public void removeAttachment(AttachmentBean attachmentBean, String fileLocation) {
		StringBuilder attachedFilePath = new StringBuilder(fileLocation);
		attachedFilePath.append(attachmentBean.getName());
		File file = new File(attachedFilePath.toString());
		file.delete();
	}
	
	@Override
	public void deleteFiles(List<AttachmentBean> attachmentBeans, String fileLocation) {
		//Delete in Server
		for (AttachmentBean fileAttachment : attachmentBeans) {
			StringBuilder attachedFilePath = new StringBuilder(fileLocation);
			attachedFilePath.append(fileAttachment.getName());
			File file = new File(attachedFilePath.toString());
			file.delete();
		}
	}

	private void createDocumentDirectory(String destinationPath) {
		File sliderFolder = new File(destinationPath);
		if(!sliderFolder.exists() || !sliderFolder.isDirectory()) {
			sliderFolder.mkdir();
		}
	}

}
