package com.htmtennis.prj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.htmtennis.prj.model.Search;

public interface SearchDao{
	public Search getSearch(String code);
	public Search prevSearch(String curCode);
	public Search nextSearch(String curCode);
	
	@Select( "select code, writer, regdate, title, contents, hit from freeboards where ${field} like '${query}' "
			+ "union all 	select code, writer, regdate, title, contents, hit from informationboards where ${field} like '${query}' "
			+ "union all 	select code, writer, regdate, title, contents, hit from photoboards where ${field} like '${query}' "
			+ "union all 	select code, writer, regdate, title, contents, hit from videoboards where ${field} like '${query}' "
			+ "union all select code, writer, regdate, title, contents, hit from noticeboards where ${field} like '${query}' order by regdate desc" )
	public List<Search> getSearchs(@Param("page")int page, @Param("query")String query, @Param("field")String field);
	
	
	@Select("SELECT COUNT(*) CNT FROM FREEBOARDS WHERE #{field} LIKE '%${query}%' ")
	public int getSize(@Param("query") String query, @Param("field") String field);
}
