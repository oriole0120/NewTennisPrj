<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%	String ctx = request.getContextPath();	%>	
	
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link href="../css/bind.css" rel="stylesheet" type="text/css" />
    <!--<script type="text/javascript" src="../js/modernizr.js"></script>-->
    <script type="text/javascript" src="../../../editor/js/HuskyEZCreator.js" charset="utf8"></script>
    


 
</head>

<body>
    
    <!-- header -->
    <jsp:include page="../../../inc/header.jsp"></jsp:include>

    <div id="body">
        <div class="content-wrapper clearfix">
        
        	<!-- aside -->
            <jsp:include page="../../../inc/aside.jsp"></jsp:include>


            <main id="main">

                <!--  main content part  -->
                <section id="board-detail" class="space-top-l">
                    <h1 class="hidden">본문 작성</h1>
                    
                    <div id="main-title-bar">
    	                <p> >>Photo </p>
	                </div>
        
                    
                    <form id="text-area" action="regProc.jsp" method="post" >
                    	<fieldset>
	                    	<legend class="hidden">본문입력필드</legend>
	                    	
	                    	<dl>
		                        <dt class="detail-cell title newrow">제목</dt>
		                        <dd class="detail-cell text-highlight"><input type="text" name="title" /></dd>
		                          
		                        <dt class="hidden">내용</dt>
		                        <dd class="content newrow">
		                        	<textarea name="content" id="content" rows="10" cols="100" style="width: 690px; height: 400px; display: none;"></textarea>
		                        	
				                        	<script type="text/javascript">
				                        	var oEditors = [];
				                        	
				                        	nhn.husky.EZCreator.createInIFrame({
				                        		oAppRef: oEditors,
				                        		elPlaceHolder: "content",
				                        		sSkinURI: "../../../editor/SmartEditor2Skin.html",	
				                        		htParams : {
				                        			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				                        			bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				                        			bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				                        			fOnBeforeUnload : function(){
				                        			}
				                        		},
				                        		fOnAppLoad : function(){
				                        			oEditors.getById["content"].value;
				                        		},
				                        		fCreator: "createSEditor2"
				                        	});
                    		
				                        	function submitContents(elClickedObj) {
				                        		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
				                        		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
				                        		
				                        		try {
				                        			elClickedObj.form.submit();
				                        		} catch(e) {}
				                        	}
				                        	
				                                         							             
						                	</script>
				                	
		                        </dd>
		                    </dl>
                    	</fieldset>
                    
	                    <p id="button-container" class="space-top text-center">
	                    	<input id="btn-reg" type="submit"  onclick="submitContents(this)" value="등록" />
	                    	<a href="list.jsp">취소</a>
	                    </p>
          
                	</form>
            	</section>
            </main>
        </div>
    </div>

		<!-- footer -->
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
		
        </body>
        </html>
