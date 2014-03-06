package com.saasforedu.irro.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.util.IConstants;

public class FileUploadAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -134661296578699079L;
	
	HttpServletRequest httpServletRequest;
	
	File file;
	String contentType;
	String fileName;
	   
	public void setUpload(File file) {
		this.file = file;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
	
	public void setUploadFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public void setUploadContentType(String contentType) {
		this.contentType = contentType;
	}

	@Override
	public String execute() throws Exception {
		String destinationPath = getSliderPath();
		createSliderDirectory(destinationPath);
		File destFile  = new File(destinationPath, this.fileName);
   	 	FileUtils.copyFile(file, destFile);
		return SUCCESS;
	}

	private void createSliderDirectory(String destinationPath) {
		File sliderFolder = new File(destinationPath);
		if(!sliderFolder.exists() || !sliderFolder.isDirectory()) {
			sliderFolder.mkdir();
		}
	}
	
	private String getSliderPath() {
		@SuppressWarnings("deprecation")
		StringBuilder sliderStrBuilder = new StringBuilder(httpServletRequest.getRealPath("/"));
		sliderStrBuilder.append(IConstants.SLIDER);
		return sliderStrBuilder.toString();
	}
	
	@Override
	public void validate() {
		if(file != null) {
			BufferedImage bufferedImage;
			try {
				bufferedImage = ImageIO.read(file);
				int height = bufferedImage.getHeight();
				int width = bufferedImage.getWidth();
				if(height < 350 )
					addActionError(getText("errors.image.height"));
				if(width < 1000 )
					addActionError(getText("errors.image.width"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
