package com.kitri.godinator.model;

public class PageNavigation {

	private String root;
	private boolean nowFirst;// 이전 버튼 눌리는지 아닌지
	private boolean nowEnd;// 다음 버튼 눌리는지 아닌지
	private int totalArticleCount;
	private int newArticleCount;
	private int totalPageCount;
	private int pageNo;
	private String navigator;
	private int HotTotalArticleCount;

	public int getHotTotalArticleCount() {
		return HotTotalArticleCount;
	}

	public void setHotTotalArticleCount(int hotTotalArticleCount) {
		HotTotalArticleCount = hotTotalArticleCount;
	}

	public void setNavigator(String navigator) {
		this.navigator = navigator;
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public boolean isNowFirst() {
		return nowFirst;
	}

	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}

	public boolean isNowEnd() {
		return nowEnd;
	}

	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}

	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}

	public int getNewArticleCount() {
		return newArticleCount;
	}

	public void setNewArticleCount(int newArticleCount) {
		this.newArticleCount = newArticleCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getNavigator() {
		return navigator;
	}

	public void makeNavigator() {
		StringBuffer tmpNavigator = new StringBuffer();
		int pageSize = BoardConstance.PAGE_SIZE;

		int prePage = (pageNo - 1) / pageSize * pageSize;

		if (this.isNowFirst()) {
			tmpNavigator.append("  <li><span class='button small firstListBtn'>최신목록</span></li>");
			tmpNavigator.append("   <li><span class='button small disabled'>이전</span></li>\n");
		} else {
			tmpNavigator.append("   <li><span class = 'button small firstListBtn'>최신목록</span></li>\n");
			tmpNavigator
					.append("   <li><span class = 'button small moveListBtn' data-pg='" + prePage + "'>이전</span></li>");
		}

		int startPage = prePage + 1;
		int endPage = prePage + pageSize;
		if (endPage >= totalPageCount)
			endPage = totalPageCount;
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {
				tmpNavigator.append(
						"     <li><a href ='#' class='page active disabled' role = 'button'>" + i + "</a></li>\n");
			} else {
				tmpNavigator.append(
						"     <li><a href ='#' class = 'page moveListBtn' data-pg='" + i + "'>" + i + "</a></li>\n");
			}
		}

		if (this.isNowEnd()) {
			tmpNavigator.append("   <li><a href ='#' class='button small  disabled'>다음</a></li> \n");
			tmpNavigator.append("   <li><a href ='#' class='button small  moveListBtn' data-pg=" + totalPageCount
					+ ">끝 목록</a></li>");
		} else {
			tmpNavigator.append("   <li><a href ='#' class = 'button small  moveListBtn' data-pg='" + (endPage + 1)
					+ "'>다음</a></li>");
			tmpNavigator.append("   <li><a href ='#' class = 'button small  moveListBtn' data-pg='" + totalPageCount
					+ "'>끝 목록</a></li>");
		}

		this.navigator = tmpNavigator.toString();

	}

}
