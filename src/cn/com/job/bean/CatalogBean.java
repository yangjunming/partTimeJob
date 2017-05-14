package cn.com.job.bean;

public class CatalogBean {
	private int catalogId;
	private String catalogName;
	private int catalogLevel;
	private int parentId;
	private int status;

	public int getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}

	public String getCatalogName() {
		return catalogName;
	}

	public void setCatalogName(String catalogName) {
		this.catalogName = catalogName;
	}

	public int getCatalogLevel() {
		return catalogLevel;
	}

	public void setCatalogLevel(int catalogLevel) {
		this.catalogLevel = catalogLevel;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
