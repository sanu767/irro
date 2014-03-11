package com.saasforedu.irro.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.model.IFileArticle;
import com.saasforedu.irro.model.impl.FileArticle;
import com.saasforedu.irro.service.FileArticleService;
import com.saasforedu.irro.util.IConstants;

public class FileUploadAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -134661296578699079L;
	
	HttpServletRequest httpServletRequest;
	
	private FileArticleService fileArticleService;
	
	List<IFileArticle> fileArticles = new ArrayList<IFileArticle>();
	
	Long deleteFileId;
	
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
	
	public void setFileArticleService(FileArticleService fileArticleService) {
		this.fileArticleService = fileArticleService;
	}
	
	public void setDeleteFileId(Long deleteFileId) {
		this.deleteFileId = deleteFileId;
	}

	public Long getDeleteFileId() {
		return deleteFileId;
	}
	
	public String findAll() throws Exception {
		httpServletRequest.getContextPath();
		List<IFileArticle> allFiles = fileArticleService.findAll();
		this.fileArticles = allFiles;
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		
		//Save the File in Server
		StringBuilder sliderStrBuilder = new StringBuilder(getServerPath());
		sliderStrBuilder.append(getSliderPath());
		
		String destinationPath = sliderStrBuilder.toString();
		createSliderDirectory(destinationPath);
		File destFile  = new File(destinationPath, this.fileName);
   	 	FileUtils.copyFile(file, destFile);
   	 	
   	 	//Save in DataBase
   	 	IFileArticle fileArticle = new FileArticle();
   	 	fileArticle.setActive(true);
   	 	fileArticle.setFileName(this.fileName);
   	 	fileArticle.setFileType(this.contentType);
   	    //Change location as per hierachy
   	 	fileArticle.setLocation(getSliderPath());
   	 	fileArticleService.create(fileArticle);
		return SUCCESS;
	}
	
	public String deleteFile() throws Exception {
		List<Long> files = new ArrayList<Long>();
		files.add(deleteFileId);
		List<IFileArticle> fileArticles = fileArticleService.findByIds(files);
		
		if(CollectionUtils.size(fileArticles) == 1) {
			IFileArticle fileArticle = fileArticles.get(0);
			removeFileFromServer(fileArticle);			
			//Remove in Database
			fileArticleService.deleteFile(fileArticle);
		}
		
		return SUCCESS;
	}
	
	public String changeFileActivation() throws Exception {
		List<Long> files = new ArrayList<Long>();
		files.add(deleteFileId);
		List<IFileArticle> fileArticles = fileArticleService.findByIds(files);
		
		if(CollectionUtils.size(fileArticles) == 1) {
			IFileArticle fileArticle = fileArticles.get(0);
			fileArticle.setActive(!fileArticle.isActive());
			//Remove in Database
			fileArticleService.update(fileArticle);
		}		
		return SUCCESS;
	}

	private void removeFileFromServer(IFileArticle fileArticle) {
		//Remove the file in server
		StringBuilder fileLocationWithName = getAbsoluteFileLocation(fileArticle);
		File file = new File(fileLocationWithName.toString());
		file.delete();
	}

	private StringBuilder getAbsoluteFileLocation(IFileArticle fileArticle) {
		String fileName = fileArticle.getFileName();
		String location  = fileArticle.getLocation();
		StringBuilder fileLocationWithName = new StringBuilder(getServerPath());
		fileLocationWithName.append(location);
		fileLocationWithName.append(fileName);
		return fileLocationWithName;
	}

	private void createSliderDirectory(String destinationPath) {
		File sliderFolder = new File(destinationPath);
		if(!sliderFolder.exists() || !sliderFolder.isDirectory()) {
			sliderFolder.mkdir();
		}
	}
	
	@SuppressWarnings("deprecation")
	private String getServerPath() {
		return httpServletRequest.getRealPath("/");
	}
	
	private String getSliderPath() {
		return IConstants.SLIDER;
	}
	
	@Override
	public void validate() {
		
		/*if(file != null) {
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
		}*/
		
	}

	public List<IFileArticle> getFileArticles() {
		return fileArticles;
	}

	public void setFileArticles(List<IFileArticle> fileArticles) {
		this.fileArticles = fileArticles;
	}
}
