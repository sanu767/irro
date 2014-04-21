package com.saasforedu.irro.tags;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;
import com.saasforedu.irro.article.action.Menu;
import com.saasforedu.irro.enums.MenuType;

public class TopMenuComponent extends Component {

	private String href;
	private String name;

	public TopMenuComponent(ValueStack stack) {
		super(stack);
	}

	public void setHref(String href) {
		this.href = href;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public boolean start(Writer writer) {
		Menu root = (Menu) findValue(name, Menu.class);
		try {
			writer.append(getMenu(root).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}

	public StringBuilder getMenu(Menu menu) {
		List<Menu> childerns = menu.getChildren();
		StringBuilder menusHTML = new StringBuilder();
		for (Menu menu2 : childerns) {
			menusHTML.append(getTopMenu(menu2));
		}
		return menusHTML;
	}

	private String getTopMenu(Menu menu2) {
		StringBuilder top = new StringBuilder();
		top.append("<li id=\"" + menu2.getId() + "\">");
		top.append(" <a href=" + href);
		if(MenuType.NEWS.equals(MenuType.getType(menu2.getMenuType()))) {
			top.append("LoadNews");
		} else {
			top.append("LoadArticles");
		}
		top.append("?menuId=" + menu2.getId() + ">");
		top.append(menu2.getLabel() + "</a>");
		if (menu2.getChildren() != null && menu2.getChildren().size() > 0) {
			top.append("<div class=" + "\"overlayer-menu menu-5c\"" + ">");
			top.append("<div class=" + "\"cont\"" + ">");
			//top.append(getAllFirstLevelChildrenMenu(menu2.getChildren()));
			//top.append(getAllTwoLevelChildrennMenu(menu2.getChildren()));
			top.append(getNavMenuBuilder(menu2.getChildren()));
			top.append("</div>");
			top.append("</div>");
		}
		top.append("</li>");
		return top.toString();
	}

	@SuppressWarnings("unused")
	private String getAllTwoLevelChildrennMenu(List<Menu> childerns) {
		List<Menu> list = new ArrayList<Menu>();
		for (Menu menu : childerns) {
			if (menu.getChildren() != null && menu.getChildren().size() > 0) {
				list.add(menu);
			}
		}
		StringBuilder singlemain = new StringBuilder();
		for (Menu menu : list) {
			StringBuilder singleLevel = new StringBuilder();
			singleLevel.append("<nav>");
			buildHeaderPath(menu, singleLevel);
			singleLevel.append(getChildern(menu.getChildren()));
			singleLevel.append("</nav>");
			singlemain.append(singleLevel.toString());
		}
		return singlemain.toString();
	}

	private void buildHeaderPath(Menu menu, StringBuilder singleLevel) {
		singleLevel.append("<h3>");
		buildPath(menu, singleLevel);
		singleLevel.append("</h3>");
	}

	private void buildPath(Menu menu, StringBuilder singleLevel) {
		singleLevel.append("<a href=" + href);
		if(MenuType.NEWS.equals(MenuType.getType(menu.getMenuType()))) {
			singleLevel.append("LoadNews");
		} else {
			singleLevel.append("LoadArticles");
		}
		singleLevel.append("?menuId=" + menu.getId());
		singleLevel.append("&parentMenuId=" + menu.getParent().getId() + " >");
		singleLevel.append(menu.getLabel() + "</a>");
	}

	private String getChildern(List<Menu> childerns) {
		StringBuilder main = new StringBuilder();
		main.append("<div class=" + "\"otto-nav\"" + ">");
		for (Menu menu : childerns) {
			StringBuilder children = new StringBuilder();
			children.append("<span>");
			buildPath(menu, children);
			children.append("</span>");
			main.append(children.toString());
		}
		main.append("</div>");
		return main.toString();
	}

	private String getNavMenuBuilder(List<Menu> childerns) {
		StringBuilder navMenuBuilder = new StringBuilder();
		List<Menu> firstLevellist = new ArrayList<Menu>();
		List<Menu> secondLevellist = new ArrayList<Menu>();
		
		if(CollectionUtils.isNotEmpty(childerns) && childerns.size() <= 5)  {
			for (Menu menu : childerns) {
				secondLevellist.add(menu);
			}
			navMenuBuilder.append(appendFullBoxToSecondLevel(secondLevellist));
		} else {
			for (Menu menu : childerns) {
				List<Menu> firstLevelChildren = menu.getChildren();
				if (CollectionUtils.isEmpty(firstLevelChildren)) {
					firstLevellist.add(menu);
				} else {
					if(isExists(firstLevelChildren)) {
						secondLevellist.add(menu);
					} else {
						firstLevellist.add(menu);
					}
				}
			}
			navMenuBuilder.append(appendOneBoxToAllFirstLevel(firstLevellist));
			navMenuBuilder.append(appendFullBoxToSecondLevel(secondLevellist));
		}
		return navMenuBuilder.toString();
	}
	
	private static boolean isExists(List<Menu> childerns) {
		for (Menu menu : childerns) {
			List<Menu> newChildren = menu.getChildren();
			if(CollectionUtils.isNotEmpty(newChildren) && newChildren.size() > 0 ) {
				return true;
			}
		}
		return false;
	}

	private String appendOneBoxToAllFirstLevel(List<Menu> firstLevellist) {
		StringBuilder main = new StringBuilder();
		if (CollectionUtils.isNotEmpty(firstLevellist)) {
			main.append("<nav>");
			for (Menu menu : firstLevellist) {
				StringBuilder singleLevel = new StringBuilder();
				buildHeaderPath(menu, singleLevel);
				main.append(singleLevel.toString());
			}

			main.append("</nav>");
		}
		return main.toString();
	}

	private String appendFullBoxToSecondLevel(List<Menu> secondLevellist) {
		StringBuilder singlemain = new StringBuilder();
		for (Menu menu : secondLevellist) {
			StringBuilder singleLevel = new StringBuilder();
			singleLevel.append("<nav>");
			buildHeaderPath(menu, singleLevel);
			singleLevel.append(getChildern(menu.getChildren()));
			singleLevel.append("</nav>");
			singlemain.append(singleLevel.toString());
		}
		return singlemain.toString();
	}
}
