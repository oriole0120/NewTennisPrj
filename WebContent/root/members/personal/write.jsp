<%@page import="com.htmtennis.prj.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcMemberDao"%>
<%@page import="com.htmtennis.prj.dao.MemberDao"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	MemberDao memberDao = new JdbcMemberDao();

	/* MemberDao MemberDao = new JdbcMemberDao(); */

	/* int npage=1;
	String Mid = request.getParameter("mid"); */
	//String query = "";
	
	
	
	/* String _page = request.getParameter("p");
	String _field = request.getParameter("f");
	String _query = request.getParameter("q");
	
	if(_page != null && !_page.equals(""))
		npage=Integer.parseInt(_page);
	
	if(_field != null && !_field.equals(""))
		field =_field;
		
	if(_query != null && !_query.equals(""))
		query =_query; */
		/* MemberDao joinDao = new JdbcMemberDao();		
		joinDao.insert(Member); */
	/* MemberDao joinDao = new JdbcMemberDao();
	List<Member> list = joinDao.getMembers(npage, query, field);
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("total", joinDao.getSize(""));  */
	/* response.sendRedirect("join.jsp"); */

%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/bind.css" rel="stylesheet" type="text/css" />
    <link href="css/component.css" rel="stylesheet" type="text/css" />
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/modernizr.js"></script>
    <script src="../../js/modernizr.custom.js"></script>
   
    <script type="text/javascript">

	var xmlHttp = false;

	try {
		xmlHttp = new XMLHttpRequest();
	} catch ( trymicrosoft ) {
		try {
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (othermicrosoft) {
			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (failed) {
				xmlHttp = false;
			}  
		}
	}

	if (!xmlHttp) {
		alert("Error initializing XMLHttpRequest!");
	}	
		
	function checkID() {
	    var id = document.getElementById("id");
	    var id = id.value; 
	    
	    // TODO 아이디 유효성 체크
	    
	    var queryString = "id=" + id;
	    
	    var url = "ajaxIdCheck.jsp";
	    
	    xmlHttp.open("POST", url, true);
	    xmlHttp.onreadystatechange = updatePage;
	    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");    
	    xmlHttp.send(queryString);
	}

	function updatePage() {
	    if (xmlHttp.readyState == 4) {
	        showIDCheckMsg();
	    }
	}

	function showIDCheckMsg() {
	    
	    var response = xmlHttp.responseText;
	    var str = response.split("|");
	    var msg = document.getElementById("idChkMsg");

	    if (str[0] == 0) {
		    idOKMsg (str[1]);
		} else {
		    idNotOKMsg (str[1]);
		}
	}

	var textNode;

	function idNotOKMsg (id) {
		var msg = document.getElementById('idChkMsg');
		if (textNode) msg.removeChild(textNode);
		var str = id + " 는 이미 사용자가 있습니다. 다른 ID를 사용하세요.";
		textNode = document.createTextNode(str);
		msg.appendChild(textNode);
		msg.style.background = "#FCBFC0";
	}
	
	function idOKMsg (id) {
		var msg = document.getElementById('idChkMsg');
		if (textNode) msg.removeChild(textNode);
		var str = id + " 는 사용이 가능한 ID입니다.";
		textNode = document.createTextNode(str);
		msg.appendChild(textNode);
		msg.style.background = "#BFCDFC";
	}
	
</script>
</head>
<body>
<form id="signform" action="write.jsp" method="post">

</form>
</body>
</html>
</head>

<body>
    <!-- header -->
    <jsp:include page="../../inc/header.jsp"></jsp:include>

    <div id="body">
        <div class="content-wrapper clearfix">
        
           <!-- aside -->
            <jsp:include page="../../inc/aside.jsp"></jsp:include>

            <div class="container">
                <div class="main clearfix">
                    <div class="column">

                        <button class="md-trigger" data-modal="modal-12">회원가입</button>

                    </div>

                </div><!-- /container -->
             </div>
            
            <div class="md-modal md-effect-12 " id="modal-12">
                <div class="md-content">
                    <h3>회원가입</h3>
                    <div id="aa">
                        
                        <div id="aa1">
                        <!-- <form action="joinProc.jsp" method="post" id="submit"> -->
                        <form id="signform" action="write.jsp" method="post">
                        
                        <p>
							ID <input type="text" name="id" id="id"/>
								<input type="button" value="ID중복체크" onclick="checkID()" />
							</p>
							<p>
							<span id="idChkMsg"></span>
							</p>
                            <table border="1">
                            
                            
                            
                                <%-- <tr>
                                    <td width=130>아이디</td>
                                    <td colspan=3>
                                    <c:forEach var="jn" items="${list}">
                                    </c:forEach>
                                        <!-- <input class="check" type="text" name="mid" id="ID" value=""/> -->
                                    	<input class="main-join-text info" id="ID" type="text" name="mid"
        								title="아이디는 5~16자 미만으로 입력 해 주세요.(특수문자,한글 불가)" onclick="msg.innerText=''"/>
        								
        								<p id="main-join-button">
        									<a>중복확인</a>
  										</p>
  										<div
       									style="display: inline-block; float: left; margin-left: 30px;">
        									<span id="msg" style="color: red;"></span>
       									</div>
                                    </td>
                                </tr> --%>
 							
                                <tr>
                                    <td align="center">비밀번호</td>
                                    <td colspan=3>
                                        <input class="check" type="password" name="pwd" id="PWD" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center">비밀번호 확인</td>
                                    <td colspan=3>
                                        <input class="check" type="password" name="pwr" id="PWDS" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center">이름</td>
                                    <td colspan=3>
                                        <input class="check" type="text" name="name" id="Name" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">성별</td>
                                    <td colspan='3'>
                                        <fieldset data-role="controlgroup">
                                            <input type="radio" name="gender" id="male" value="choice-1" checked="checked" />
                                            <label for="male">남자</label>

                                            <input type="radio" name="gender" id="female" value="choice-2" />
                                            <label for="female">여자</label>
                                        </fieldset>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td align="center">학번</td>
                                    <td colspan=3>
                                        <input class="check" type="text" name="studentNum" id="stNum" value="" />
                                    </td>
                                </tr>
								<tr>
                                    <td align="center">이메일</td>
                                    <td colspan=3>
                                        <input class="check" type="text" name="email" id="Email" value="" />
                                    </td>
                                </tr>
								<tr>
                                    <td align="center">연락처</td>
                                    <td colspan=3>
                                        <input class="check" type="text" name="phone" id="Ph" value="" />
                                    </td>
                                </tr>

                            </table>
                           
                            <div class="md-close">
                            
                            	<button type="button" id="btn-del-pop" onclick="init()" ><!-- <a href="join.jsp"> -->완료</a></button>
                            	<%-- id="btn-del-pop" href="viewDelProc.jsp?c=${fr.code}" --%>
                            	<a href="../Community/freeboard/list.jsp"><button>취소</button></a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="md-overlay"></div>
            </div>
        </div>
    
            <!-- footer -->
			<jsp:include page="../../inc/footer.jsp"></jsp:include>

            <!--자바스크립트 팝업-->
            <script src="../../js/classie.js"></script>
            <script src="../../js/modalEffects.js"></script>
            <!-- <script>
                // this is important for IEs
                var polyfilter_scriptpath = '/js/';
            </script> -->
           <!--  <script src="../../js/cssParser.js"></script>
            <script src="../../js/css-filters-polyfill.js"></script> -->
</body>
</html>
