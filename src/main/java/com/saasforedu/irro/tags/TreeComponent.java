package com.saasforedu.irro.tags;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;
import com.saasforedu.irro.article.action.Menu;
import com.saasforedu.irro.enums.MenuType;

public class TreeComponent extends Component {

	private String menu;
	private String href;
	private String cssClass;
	private String cssStyle;
	private String cssSelection;
	private Set<Long> expandedTree = new TreeSet<Long>();

	public TreeComponent(ValueStack stack) {
		super(stack);
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}

	public void setCssSelection(String cssSelection) {
		this.cssSelection = cssSelection;
	}

	@Override
	public boolean start(Writer writer) {
		try {
			Menu root = (Menu) stack.findValue(menu, Menu.class);
			findXpansionHierarchy(root);
			String buildMenu = buildMenu(root);
			writer.write(buildMenu);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}

	//TODO This can be solved by just adding an attribute in Menu
	private void findXpansionHierarchy(Menu root) {
		Menu selected = null;
		selected = getSelectedMenu(root.getChildren(), selected);
		buildHierarchyNode(selected);

	}

	private void buildHierarchyNode(Menu menu) {
		if (menu != null) {
			expandedTree.add(menu.getId());
			buildHierarchyNode(menu.getParent());
		}
	}

	private Menu getSelectedMenu(List<Menu> children, Menu selected) {
		if (children != null) {
			for (Menu menu : children) {
				if (menu.isSelected()) {
					selected = menu;
					break;
				} else {
					selected = getSelectedMenu(menu.getChildren(), selected);
				}
			}
		}

		return selected;
	}

	private void buildEndUL(StringBuilder tree) {
		tree.append("</ul>");
	}

	private void buildStartUL(StringBuilder tree) {
		tree.append("<ul");
		if (cssClass != null) {
			tree.append(" class=\"" + cssClass + "\"");
		}
		if (cssStyle != null) {
			tree.append(" style=\"" + cssStyle + "\"");
		}
		tree.append(">");
	}

	private String buildMenu(Menu menu) {
		StringBuilder build = new StringBuilder();
		buildLIStart(build, menu);
		buildCSS(build);
		build.append(" >");
		buildPath(build, menu);
		if (menu.isSelected()) {
			List<Menu> children = menu.getChildren();
			StringBuilder childrenWriter = new StringBuilder();
			if (children != null) {
				buildStartUL(childrenWriter);
				buildCSS(childrenWriter);
				for (Menu child : children) {
					buildLIStart(childrenWriter, child);
					buildCSS(childrenWriter);
					childrenWriter.append(" >");
					buildPath(childrenWriter, child);
					buildEndLI(childrenWriter);

				}
				buildEndUL(childrenWriter);
			}
			build.append(childrenWriter.toString());
		} else {
			StringBuilder child = new StringBuilder();
			if (expandedTree.contains(menu.getId())) {
				buildStartUL(build);
				build.append(buildChild(menu.getChildren(), child).toString());
				buildEndUL(build);
			}
		}
		buildEndLI(build);
		return build.toString();
	}

	private void buildEndLI(StringBuilder buildparent) {
		buildparent.append("</li>");
	}

	private StringBuilder buildChild(List<Menu> menus, StringBuilder writer) {
		for (Menu child : menus) {
			writer.append(buildMenu(child));
		}
		return writer;
	}

	private void buildLIStart(StringBuilder writer, Menu menu) {
		writer.append("<li id=\"" + menu.getId() + "\"");
	}

	private void buildPath(StringBuilder writer, Menu menu) {
		writer.append("<a ");
		if (cssSelection != null && menu.isSelected()) {
			writer.append(" class=\"" + cssSelection + "\" ");
		}
		writer.append(" href=" + href);
		
		if(MenuType.NEWS.equals(MenuType.getType(menu.getMenuType()))) {
			writer.append("LoadNews");
		} else {
			writer.append("LoadArticles");
		}
		
		writer.append("?menuId=" + menu.getId());
		if (menu.getParent() != null) {
			writer.append("&parentMenuId=" + menu.getParent().getId());
		}
		writer.append(" >");
		writer.append(menu.getLabel() + "</a>");
	}


	private void buildCSS(StringBuilder writer) {
		if (cssClass != null) {
			writer.append(" class= \"" + cssClass + "\"");
		}

		if (cssStyle != null) {
			writer.append(" style=\"" + cssStyle + "\"");
		}
	}

	public boolean end(Writer writer) {
		return true;
	}

	@Override
	public boolean usesBody() {
		return false;
	}

/*	
 *
 //TODO Dont Remove it is use cases for Junit Test
	public static void main(String[] args) {

		Menu root = new Menu();
		root.setLabel("ROOT");
		root.setId("ROOT");
		Menu instMenu = new Menu();
		instMenu.setLabel("Institute");
		instMenu.setId("Institute");
		instMenu.setParent(root);

		Menu rector = new Menu();
		rector.setLabel("Rector");
		rector.setId("Rector");
		rector.setParent(instMenu);

		Menu document = new Menu();
		document.setLabel("Document");
		document.setId("Document");
		document.setParent(instMenu);

		Menu dept = new Menu();
		dept.setLabel("Department");
		dept.setId("Department");
		dept.setParent(instMenu);
		dept.setSelected(true);
		List<Menu> depts = new ArrayList<Menu>();
		Menu dp = new Menu();
		dp.setLabel("DepartmentsPhilosophy");
		dp.setId("DepartmentsPhilosophy");
		dp.setSelected(true);
		dp.setParent(dept);

		depts.add(dp);

		dept.setChilderns(depts);

		Menu activities = new Menu();
		activities.setLabel("Activities");
		activities.setId("Activities");
		activities.setSelected(true);
		activities.setParent(root);

		List<Menu> inst = new ArrayList<Menu>();
		inst.add(rector);
		inst.add(document);
		inst.add(dept);
		instMenu.setChilderns(inst);

		List<Menu> list = new ArrayList<Menu>();
		list.add(instMenu);
		list.add(activities);
		root.setChilderns(list);

		TreeComponent menu = new TreeComponent(null);
		menu.test(root);
	}

	// this is for testing , its better we have Junit
	public void test(Menu root) {
		findxpansion(root);
		System.out.println(buildMenu(root).toString());
	}*/
}
