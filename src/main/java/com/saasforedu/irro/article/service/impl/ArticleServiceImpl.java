package com.saasforedu.irro.article.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.article.dao.IArticleDAO;
import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.article.service.IArticleService;
import com.saasforedu.irro.model.IArticleAttachment;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.ArticleAttachment;
import com.saasforedu.irro.service.IFileUploadService;
import com.saasforedu.irro.service.MenuMetadataService;
import com.saasforedu.irro.util.IConstants;

public class ArticleServiceImpl implements IArticleService {
	
	private IArticleDAO articleDAO;
	private MenuMetadataService menuMetadataService;
	private IFileUploadService fileUploadService;
	
	public void setArticleDAO(IArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	public void setMenuMetadataService(MenuMetadataService menuMetadataService) {
		this.menuMetadataService = menuMetadataService;
	}
	
	public void setFileUploadService(IFileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}
	
	@Override
	public List<ArticleBean> findArticles(Long menuId, Long parentMenuId) {
		List<ArticleBean> articleBeans = new ArrayList<ArticleBean>();
		Long referenceArticleId = getReferenceArticleId(menuId, parentMenuId);
		if(referenceArticleId.longValue() != 0) {
			List<IArticle> articles = articleDAO.findByRefereceArticleId(referenceArticleId);
			articleBeans = convertToItemBeans(articles);
		}
		return articleBeans;
	}

	@Override
	public Long createArticle(ArticleBean articleBean, Long menuId, Long parentName) {
		Long referenceArticleId = getReferenceArticleId(menuId, parentName);
		IArticle article = new Article();
		copyProperties(articleBean, article);
		article.setReferenceArticleId(referenceArticleId);
		article.setModificationDate(new Date());
		List<IArticleAttachment> newNewsAttachments = createNewAttachment(articleBean.getAttachmentBeans(), article);
		article.setArticleAttachments(newNewsAttachments);
		Long articleId =  (Long)articleDAO.create((Article)article);
		return articleId;
	}

	@Override
	public void updateArticle(ArticleBean articleBean) {
		IArticle article = articleDAO.findById(Article.class, articleBean.getId());
		copyProperties(articleBean, article);
		article.setModificationDate(new Date());
		List<IArticleAttachment> deletedAttachments = setAttachmentsForArticleUpdate(articleBean, article);
		articleDAO.update(article, deletedAttachments);
	}

	@Override
	public void deleteArticle(ArticleBean articleBean, Long menuId, Long parentMenuId, String serverPath) {
		IArticle article =  articleDAO.findById(Article.class, articleBean.getId());
		IMenuMetadata menuMetadata = getMenuMetadata(menuId, parentMenuId);
		String fullArticlePath = getFullArticlePath(serverPath, menuMetadata.getDocumentLocation());
		fileUploadService.deleteFiles(articleBean.getAttachmentBeans(), fullArticlePath);
		articleDAO.deleteArticle(article);
	}
	
	@Override
	public void removeAttachment(AttachmentBean selectedFileAttachment, String serverPath, Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = getMenuMetadata(menuId, parentMenuId);
		String fullArticlePath = getFullArticlePath(serverPath, menuMetadata.getDocumentLocation());
		fileUploadService.removeAttachment(selectedFileAttachment, fullArticlePath);
	}
	
	@Override
	public ArticleBean findById(Long articleId) {
		ArticleBean articleBean = new ArticleBean();
		IArticle article = articleDAO.findById(Article.class, articleId);
		convertToItemBean(article, articleBean);
		return articleBean;
	}

	@Override
	public AttachmentBean doUploadArticleFile(String fileName, String contentType, Long menuId, Long parentMenuId, 
			File file, String serverPath) throws IOException {
		
		IMenuMetadata menuMetadata = getMenuMetadata(menuId, parentMenuId);
		String documentLocation = menuMetadata.getDocumentLocation();
		AttachmentBean fileArticle = getFileAttachment(fileName, contentType, documentLocation);
		String directoryPath = getFullArticlePath(serverPath, documentLocation);
		//Upload in Server
		fileUploadService.doFileUpload(fileArticle.getName(), file, directoryPath);
		return fileArticle;
	}

	private String getFullArticlePath(String serverPath, String documentLocation) {
		//Save the File in Server
		StringBuilder directoryPath = new StringBuilder(serverPath);
		directoryPath.append(IConstants.ARTICLES);
		directoryPath.append(documentLocation);		
		return directoryPath.toString();
	}
	
	private void copyProperties(ArticleBean articleBean, IArticle article) {
		article.setTitle(articleBean.getTitle());
		article.setShortDescription(articleBean.getDescription());
		article.setMainContent(articleBean.getContent());
	}

	private List<IArticleAttachment> createNewAttachment(List<AttachmentBean> attachmentBeans, IArticle article) {
		List<IArticleAttachment> newArticleAttachments = new ArrayList<IArticleAttachment>();
		for (AttachmentBean attachmentBean : attachmentBeans) {
			IArticleAttachment articleAttachment = new ArticleAttachment();
			copyAttachmentProperties(attachmentBean, articleAttachment);
			articleAttachment.setArticle((Article)article);
			newArticleAttachments.add(articleAttachment);
		}
		return newArticleAttachments;
	}
	
	private List<IArticleAttachment> setAttachmentsForArticleUpdate(ArticleBean articleBean, IArticle article) {
		List<IArticleAttachment> dbAttachments = article.getArticleAttachments();
		List<AttachmentBean> newAttachmentBeans = articleBean.getAttachmentBeans();
		
		Map<Long, AttachmentBean> updatedIds = new HashMap<Long, AttachmentBean>();
		List<IArticleAttachment> newAttachments = new ArrayList<IArticleAttachment>();
		List<IArticleAttachment> deletedAttachments = new ArrayList<IArticleAttachment>();
		
		for (AttachmentBean attachmentBean : newAttachmentBeans) {
			Long attachmentId = attachmentBean.getAttachmentId();
			if(attachmentId == null ) {
				IArticleAttachment articleAttachment = new ArticleAttachment();
				copyAttachmentProperties(attachmentBean, articleAttachment);
				articleAttachment.setArticle((Article)article);
				newAttachments.add(articleAttachment);
			} else {
				updatedIds.put(attachmentId, attachmentBean);
			}
		}
		
		for (IArticleAttachment dbAttachment : dbAttachments) {
			AttachmentBean dbAttachmentBean = updatedIds.get(dbAttachment.getId());
			if(dbAttachmentBean != null ) {
				copyAttachmentProperties(dbAttachmentBean, dbAttachment);
				dbAttachment.setArticle((Article)article);
			} else {
				deletedAttachments.add(dbAttachment);
			}
		}
		
		if(CollectionUtils.isNotEmpty(deletedAttachments)) {
			dbAttachments.removeAll(deletedAttachments);
		}
		
		if(CollectionUtils.isNotEmpty(newAttachments)) {
			dbAttachments.addAll(newAttachments);
		}
		
		article.setArticleAttachments(dbAttachments);
		
		return deletedAttachments;
	}
	
	private void copyAttachmentProperties(AttachmentBean attachmentBean,
			IArticleAttachment articleAttachment) {
		articleAttachment.setActive(attachmentBean.isActive());
		articleAttachment.setFileName(attachmentBean.getName());
		articleAttachment.setFileType(attachmentBean.getType());
		articleAttachment.setId(attachmentBean.getAttachmentId());
		articleAttachment.setLocation(attachmentBean.getLocation());
	}
	
	private void copyAttachmentProperties(IArticleAttachment articleAttachment, AttachmentBean attachmentBean) {
		attachmentBean.setActive(articleAttachment.isActive());
		attachmentBean.setName(articleAttachment.getFileName());
		attachmentBean.setType(articleAttachment.getFileType());
		attachmentBean.setAttachmentId(articleAttachment.getId());
		attachmentBean.setLocation(articleAttachment.getLocation());
	}
	
	private void copyProperties(IArticle article, ArticleBean articleBean) {
		articleBean.setId(article.getId());
		articleBean.setTitle(article.getTitle());
		articleBean.setDescription(article.getShortDescription());
		articleBean.setContent(article.getMainContent());
		
	}
	
	private AttachmentBean getFileAttachment(String fileName, String contentType, String location) {
		AttachmentBean fileArticle = new AttachmentBean();
   	 	fileArticle.setActive(true);
   	 	fileArticle.setName(fileName);
   	 	fileArticle.setType(contentType);
   	 	StringBuilder articlePath = new StringBuilder(IConstants.ARTICLES);
   	 	articlePath.append(location);
   	 	fileArticle.setLocation(articlePath.toString());
		return fileArticle;
	}

	private IMenuMetadata getMenuMetadata(Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
		return menuMetadata;
	}
	
	private Long getReferenceArticleId(Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = getMenuMetadata(menuId, parentMenuId);
		if(menuMetadata == null) {
			return 0L;
		}
		return menuMetadata.getReferenceArticleId();
	}
	
	private List<ArticleBean> convertToItemBeans(List<IArticle> articles) {
		List<ArticleBean> itemBeans = new ArrayList<ArticleBean>();
		for(IArticle eachNews : articles) {
			ArticleBean newsBean = new ArticleBean();
			convertToItemBean(eachNews, newsBean);
			itemBeans.add(newsBean);
		}
		return itemBeans;
	}
	
	private void convertToItemBean(IArticle article, ArticleBean articleBean) {
		copyProperties(article, articleBean);
		List<IArticleAttachment> articleAttachments = article.getArticleAttachments();
		List<AttachmentBean> articleAttachmentBeans = new ArrayList<AttachmentBean>();
		for(IArticleAttachment articleAttachment : articleAttachments) {
			AttachmentBean articleAttachmentBean = new AttachmentBean();
			copyAttachmentProperties(articleAttachment, articleAttachmentBean);
			articleAttachmentBeans.add(articleAttachmentBean);			
		}
		articleBean.setAttachmentBeans(articleAttachmentBeans);
	}

}
