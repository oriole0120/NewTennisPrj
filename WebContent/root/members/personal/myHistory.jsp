<%@page import="com.htmtennis.prj.dao.mybatis.MyBSearchDao"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%>
<%@page import="com.htmtennis.prj.dao.SearchDao"%>
<%@page import="com.htmtennis.prj.model.Search"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="ctxName" value="${pageContext.request.servletContext.contextPath}" />

<%	String ctx = request.getContextPath();	%>
<% 
	int npage = 1;
	String nquery="%aa%";
	String nfield="TITLE";
	
	String _page = request.getParameter("pg");
	String _query = request.getParameter("qy");
	String _field = request.getParameter("fd");
	
	if(_page != null && !_page.equals(""))
		npage = Integer.parseInt(_page);
	if(_query!= null && !_query.equals(""))
		nquery = _query;
	if(_field!= null && !_field.equals(""))
		nfield = _field;
	
	
	SearchDao searchDao = new MyBSearchDao();
	List<Search> list = searchDao.getSearchs(npage, nquery, nfield);
	
	pageContext.setAttribute("list", list);
	//pageContext.setAttribute("total", searchDao.getSize("%aa%", "TITLE"));
	
%>

       <body>
    <!-- header -->
    <jsp:include page="../../inc/header.jsp"></jsp:include>

    <div id="body">
        <div class="content-wrapper clearfix">
        
        	<!-- aside -->
            <jsp:include page="../../inc/aside.jsp"></jsp:include>



            <main id="main">
                <div>
                    <!--  main content part  -->
                    <h2 id="main-title">my history </h2>

                    <nav id="full-path">
                        <!--<h3>현재경로</h3>-->
                        <ol>
                            <!--<li class="path">Home ></li>-->
                            <li class="path">my history ></li>
            
                        </ol>
                    </nav>

                    <!-- <div id="write">
                        <p><a href="write.jsp">글쓰기</a></p>
                    </div> -->

                    <div>
                        <h3 class="hidden">목록부분</h3>
                        
                        <table id="free-board-table">
                            <thead>
                                <tr class="free-board-row">
                                    <th class="free-board-cell num"><a class="board-list-item-text">번호</a></th>
                                    <th class="free-board-cell title"><a class="board-list-item-text">제목</a></th>
                                    <th class="free-board-cell writer"><a class="board-list-item-text">작성자</a></th>
                                    <th class="free-board-cell date"><a class="board-list-item-text">작성일</a></th>
                                    <th class="free-board-cell hit"><a class="board-list-item-text">조회수</a></th>
                                   
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="his" items="${list}">	
                            		<tr>
                            			<td class="free-board-cell num"><a class="board-list-item-text">${his.code}</td>
										<td class="free-board-cell title"><a class="board-list-item-text" href="view.jsp?c=${his.code}">${his.title}</a></td>
										<td class="free-board-cell writer"><a class="board-list-item-text" >${his.writer}</a></td>
										<td class="free-board-cell date"><a class="board-list-item-text">${his.regdate}</a></td>
										<td class="free-board-cell hit"><a class="board-list-item-text">${his.hit}</a></td>
									
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
									class="search-field" name="fd">
									<option ${param.fd=='writer' ? 'selected' : ""} value="writer">작성자</option>
									<option ${param.fd=='title' ? 'selected' : ""} value="title">제목</option>
									<option ${param.fd=='contents' ? 'selected' : ""} value="contents">본문</option>
								</select> 
                                    <input class="search" type="text" name="qy" value=${param.qy }></input>
                                	<input class="search" type="submit" value="검색" />
                            </fieldset>
                        </form>
                    </div>

                </div>
            </main>

        </div>
    </div>



    <!-- footer -->
		<jsp:include page="../../inc/footer.jsp"></jsp:include>

</body>