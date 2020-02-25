<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  댓글 등록하기(Ajax) -->
<script type="text/javascript">
function fn_comment(){
    
    $.ajax({
        type:'POST',
        url : '${pageContext.request.contextPath}/comments.lo',
        data:$("#commentForm").serialize(),
        success : function(data){
        	alert("댓글 추가 성공");
            getCommentList(); 	// 댓글 목록 읽어오기
        },
        error:function(){
            alert("댓글 추가 실패");
       }
        
    });
}

function fn_comment_delete(commentNO){
    $.ajax({
        type:'GET',
        url : '${pageContext.request.contextPath}/deleteComment.lo?commentNO='+commentNO,
        success : function(data){
        	alert("댓글 삭제 성공");
            getCommentList(); 	// 댓글 목록 읽어오기
        },
        error:function(){
            alert("댓글 삭제 실패");
       }
        
    });
}

function fn_comment_update(commentNO){
    $.ajax({
        type:'GET',
        url : '${pageContext.request.contextPath}/updateComment.lo?commentNO='+commentNO,
        data:$("#commentListForm").serialize(),
        success : function(data){
        	alert("댓글 수정 성공");
            getCommentList(); 	// 댓글 목록 읽어오기
        },
        error:function(){
            alert("댓글 수정 실패");
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    $.ajax({
        type:'GET',
        url : '${pageContext.request.contextPath}/commentList.lo?boardNO=${dto.boardNO}',
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
               html += "<div><span style = 'font-weight : bold;'>댓글</div>";
                for(i=0; i<data.length; i++){
                	html += "<div class='container-fluid'>";
                	html += "<div class='row tm-content-row'>";
                	html += "<div class='tm-product-table-container-noscroll col-12'>";
                	html += "<table class='table table-hover tm-table-small tm-product-table' style='width:1100px;'>";
                	html += "<thead> <th scope='col'><a style='color:#2eceb4;'>"+ data[i].writer +"</a>&nbsp;&nbsp;<img src='resources/img/modify.png' style='width:30px; height:30px;' onclick='getCommentListUpdate(" + i + ");'>";
                	html += "<br/><br/><a style='color:white;'>"+ data[i].content+"</a>";
                	html += "&nbsp;<img src='resources/img/delete.png' style='width:30px; height:30px;' onclick='fn_comment_delete(" + data[i].commentNO + ");'></th>";
                	html += "</td></table>";
                	html += "</thead></table></div></div></div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html); 
            
        },
        error:function(){
            alert("댓글 불러오기 실패");
       }
        
    });
}


function getCommentListUpdate(num){
    $.ajax({
        type:'GET',
        url : '${pageContext.request.contextPath}/commentList.lo?boardNO=${dto.boardNO}',
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
               html += "<div><span style = 'font-weight : bold;'></div>";
                for(i=0; i<data.length; i++){
                	
                	html += "<table><tr><td><b>";
                	html += data[i].writer;
                	html += "</b></td><td><input type='button' value='수정완료' onclick='fn_comment_update(" + data[i].commentNO + ");'></td>";
                	html += "<td><input type='button' value='수정취소' onclick='getCommentList();'></td>";
                	html += "</tr></table><table><tr><td style='color:#787777;'>";
                	if(i==num){
                		html += "<input type = 'text' name = 'content' value = '" + data[i].content + "'>";
                	}else{
                		html += data[i].content;
                	}
                	html += "</td></tr></table>";
                	
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html); 
            
        },
        error:function(){
            alert("댓글 불러오기 실패");
       }
        
    });
}
</script>
</head>
<body>
	<form action="comments.lo" method="post" id = "commentForm">
 	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"> 
 	<input type = "hidden" name = "boardNO" value = "${dto.boardNO}"> 
	<div>
		<table>
			<tr>
				<td><hr style="color:white;"></td>
			</tr>
		</table>
	</div>
	<div style="width:1050px;">
		<table>
			<tr>
				<td><input type="text" name="content" style="height:50px; width:1050px;" placeholder="댓글을 작성해주세요."></td>
				<td><input type="button" onclick = "fn_comment();" value="작성" style="background-color:#6a7bad; width:50px; height:55px; color:white;"></td>
			</tr>
		</table>
	</div>	
	</form>
                
	<!-- 댓글 리스트 띄울 장소  -->
	<form action="" method="post" id = "commentListForm">
 	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"> 
	<div id = "commentList" align = "left">
		
	</div>
	</form>
</body>
</html>