﻿<%@page import="com.htmtennis.prj.dao.mybatis.MyBFreeDao"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.htmtennis.prj.model.Free"%>
<%@page import="java.util.List"%>
<%@page import="com.htmtennis.prj.dao.FreeDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcFreeDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int npage = 1;
	String field = "TITLE";
	String query = "";
	
	String _page = request.getParameter("p");
	String _field = request.getParameter("f");
	String _query = request.getParameter("q");
	
	if(_page != null && !_page.equals(""))
		npage=Integer.parseInt(_page);
	
	if(_field != null && !_field.equals(""))                   
		field =_field;
		
	if(_query != null && !_query.equals(""))
		query =_query;
					
	SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
	FreeDao freeDao = sqlSession.getMapper(FreeDao.class);
	
	List<Free> list = freeDao.getFrees(npage, query, field);
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("total", freeDao.getSize("", "TITLE"));
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <!--<link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/layout.css" rel="stylesheet" type="text/css" />-->

    <link href="../css/bind.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/modernizr.js"></script>
</head>

<body>
    <!-- header -->
    <jsp:include page="../../../inc/header.jsp"></jsp:include>

    <div id="body">
        <div class="content-wrapper clearfix">
        
        	<!-- aside -->
            <jsp:include page="../../../inc/aside.jsp"></jsp:include>



            <main id="main">
                <div>
                    <!--  main content part  -->
                    <h2 id="main-title">자유게시판</h2>

                    <nav id="full-path">
                        <!--<h3>현재경로</h3>-->
                        <ol>
                            <!--<li class="path">Home ></li>-->
                            <li class="path">Community ></li>
                            <li class="path">자유게시판</li>
                        </ol>
                    </nav>

                    <div id="write">
                        <p><a href="write.jsp">글쓰기</a></p>
                    </div>

                    <div>
                        <h3 class="hidden">영상목록부분</h3>
                        
                        <table id="free-board-table">
                            <thead>
                                <tr class="free-board-row">
                                    <th class="free-board-cell num"><a class="board-list-item-text">번호</a></th>
                                    <th class="free-board-cell title"><a class="board-list-item-text">제목</a></th>
                                    <th class="free-board-cell writer"><a class="board-list-item-text">작성자</a></th>
                                    <th class="free-board-cell date"><a class="board-list-item-text">작성일</a></th>
                                    <th class="free-board-cell hit"><a class="board-list-item-text">조회수</a></th>
                                    <th class="free-board-cell recommend"><a class="board-list-item-text">추천</a></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="fr" items="${list}">	
                            		<tr>
                            			<td class="free-board-cell num"><a class="board-list-item-text">${fr.code}</td>
										<td class="free-board-cell title"><a class="board-list-item-text" href="view.jsp?c=${fr.code}">${fr.title}</a></td>
										<td class="free-board-cell writer"><a class="board-list-item-text" >${fr.writer}</a></td>
										<td class="free-board-cell date"><a class="board-list-item-text">${fr.regdate}</a></td>
										<td class="free-board-cell hit"><a class="board-list-item-text">${fr.hit}</a></td>
										<td class="free-board-cell recommend"><a class="board-list-item-text">${fr.thumb}</a></td>
									</tr>	
								</c:forEach>
																
                              

                            </tbody>
                        </table>
                    </div>

                    <div> 
                         <!--<h3>현재페이지위치</h3>--> 
                         <p id="page-list">1/5 page</p> 
                     </div> 
 
 
                     <div> 
                         <!--<h3>페이지선택목록</h3>--> 
                         <p><a class="page" href="list.jsp">이전</a></p> 
                          
                         <ul class="page" >
                         
                          
                          
                          
                         <ui:pager total="${total}"/> 
                         <p><a href="list.jsp">다음</a></p> 
                         </div> 


                    <div id="main-search-form">
                        <!--<h3>영상게시물 검색폼</h3>-->
                        <form>
                        
                            
                            <fieldset>
                                                            
                                <legend class="hidden">링크 검색 필드</legend>
							<label for="field" class="hidden">검색분류</label> 
								<select
									class="search-field" name="f">
									<option ${param.f=='writer' ? 'selected' : ""} value="writer">작성자</option>
									<option ${param.f=='title' ? 'selected' : ""} value="title">제목</option>
									<option ${param.f=='contents' ? 'selected' : ""} value="contents">본문</option>
								</select> 
                                    <input class="search" type="text" name="q" value=${param.q }></input>
                                	<input class="search" type="submit" value="검색" />
                            </fieldset>
                        </form>
                    </div>

                </div>
            </main>

        </div>
    </div>



    <!-- footer -->
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>

</body>
</html>
