<%@page import="Main.Qna.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Main.Comment.model.vo.Comment,
				Main.NursingHospital.model.ov.NursingHospital,
				java.util.ArrayList" 
%>
<%
	ArrayList<Comment> list = (ArrayList<Comment>) request.getAttribute("list");
	Qna q = (Qna)request.getAttribute("qna");
	NursingHospital loginHospital = (NursingHospital)session.getAttribute("loginHospital");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 css 스타일 접는걸 추천합니다.-->
<style type="text/css">
.card {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 1px solid rgba(0, 0, 0, 0.125);
  border-radius: 0.25rem;
}

.card > hr {
  margin-right: 0;
  margin-left: 0;
}

.card > .list-group:first-child .list-group-item:first-child {
  border-top-left-radius: 0.25rem;
  border-top-right-radius: 0.25rem;
}

.card > .list-group:last-child .list-group-item:last-child {
  border-bottom-right-radius: 0.25rem;
  border-bottom-left-radius: 0.25rem;
}

.card-body {
  -webkit-box-flex: 1;
      -ms-flex: 1 1 auto;
          flex: 1 1 auto;
  padding: 1.25rem;
}

.card-title {
  margin-bottom: 0.75rem;
}

.card-subtitle {
  margin-top: -0.375rem;
  margin-bottom: 0;
}

.card-text:last-child {
  margin-bottom: 0;
}

.card-link:hover {
  text-decoration: none;
}

.card-link + .card-link {
  margin-left: 1.25rem;
}

.card-header {
  padding: 0.75rem 1.25rem;
  margin-bottom: 0;
  background-color: rgba(0, 0, 0, 0.03);
  border-bottom: 1px solid rgba(0, 0, 0, 0.125);
}

.card-header:first-child {
  border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.card-header + .list-group .list-group-item:first-child {
  border-top: 0;
}

.card-footer {
  padding: 0.75rem 1.25rem;
  background-color: rgba(0, 0, 0, 0.03);
  border-top: 1px solid rgba(0, 0, 0, 0.125);
}

.card-footer:last-child {
  border-radius: 0 0 calc(0.25rem - 1px) calc(0.25rem - 1px);
}

.card-header-tabs {
  margin-right: -0.625rem;
  margin-bottom: -0.75rem;
  margin-left: -0.625rem;
  border-bottom: 0;
}

.card-header-pills {
  margin-right: -0.625rem;
  margin-left: -0.625rem;
}

.card-img-overlay {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1.25rem;
}

.card-img {
  width: 100%;
  border-radius: calc(0.25rem - 1px);
}

.card-img-top {
  width: 100%;
  border-top-left-radius: calc(0.25rem - 1px);
  border-top-right-radius: calc(0.25rem - 1px);
}

.card-img-bottom {
  width: 100%;
  border-bottom-right-radius: calc(0.25rem - 1px);
  border-bottom-left-radius: calc(0.25rem - 1px);
}

.card-deck {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
}

.card-deck .card {
  margin-bottom: 15px;
}

@media (min-width: 576px) {
  .card-deck {
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
        -ms-flex-flow: row wrap;
            flex-flow: row wrap;
    margin-right: -15px;
    margin-left: -15px;
  }
  .card-deck .card {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
        -ms-flex: 1 0 0%;
            flex: 1 0 0%;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
        -ms-flex-direction: column;
            flex-direction: column;
    margin-right: 15px;
    margin-bottom: 0;
    margin-left: 15px;
  }
}

.card-group {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
}

.card-group > .card {
  margin-bottom: 15px;
}

@media (min-width: 576px) {
  .card-group {
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
        -ms-flex-flow: row wrap;
            flex-flow: row wrap;
  }
  .card-group > .card {
    -webkit-box-flex: 1;
        -ms-flex: 1 0 0%;
            flex: 1 0 0%;
    margin-bottom: 0;
  }
  .card-group > .card + .card {
    margin-left: 0;
    border-left: 0;
  }
  .card-group > .card:not(:last-child) {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
  }
  .card-group > .card:not(:last-child) .card-img-top,
  .card-group > .card:not(:last-child) .card-header {
    border-top-right-radius: 0;
  }
  .card-group > .card:not(:last-child) .card-img-bottom,
  .card-group > .card:not(:last-child) .card-footer {
    border-bottom-right-radius: 0;
  }
  .card-group > .card:not(:first-child) {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
  }
  .card-group > .card:not(:first-child) .card-img-top,
  .card-group > .card:not(:first-child) .card-header {
    border-top-left-radius: 0;
  }
  .card-group > .card:not(:first-child) .card-img-bottom,
  .card-group > .card:not(:first-child) .card-footer {
    border-bottom-left-radius: 0;
  }
}

.card-columns .card {
  margin-bottom: 0.75rem;
}
</style>
<meta charset="UTF-8">
<title>공지사항 자세히 보기</title>
</head>
<body>

<!-- 여기는 글작성자가 글을 보는 경우  -->
<% if(loginHospital != null && loginHospital.getNH_NAME().equals(q.getNH_NAME()) ){ %>
<div class="card border-primary mb-3" style="max-width: 45rem; text-align: center;  position: center; top:30%; left:30%;">
  <div class="card-header"><%= q.getQNA_NO() %>번 QNA 글</div>
  <div class="card-body">
 	<form action="/NHMP/oupqna" method="post">
    <h4 class="card-title"><input type="text" name="title" value="<%= q.getQNA_TITLE() %>">
    <input type="hidden" name="qnano" value="<%= q.getQNA_NO() %>">
    </h4>
    <table class="card-text" border=1;>
    <tr><th>작성자</th><td><input type="text" name="writer" value="<%= q.getNH_NAME() %>" readonly></td></tr>
    <tr><th>카테고리</th><td>
	<select name="category">
	<option value="이용관련">이용관련</option>
	<option value="서비스관련">서비스관련</option>
	<option value="결제관련">결제관련</option>
	<option value="기타">기타</option>
	</select>
	</td></tr>
	<tr><th>등록날짜</th><td><input type="date" name="date" value="<%= q.getQNA_DATE() %>"></td></tr>
	<tr><th>내용</th><td><textarea name="content" cols="70" rows="5"><%= q.getQNA_CONTENT() %></textarea></td></tr>
	<tr><th><a href="/NHMP/allqna">목록으로 이동</a>
		<input type="submit" value="수정하기">
		<input type="reset" value="취소">
		<a href="/NHMP/odelqna?no=<%= q.getQNA_NO() %>">삭제하기</a>
	</th></tr>
    </table>
    </form>
  </div>
</div>
<!-- 작성자가 아닌 다른사람이 글을 보는 경우 ? -->
<% }else{ %>
<div class="card border-primary mb-3" style="max-width: 45rem; text-align: center;  position: center; top:30%; left:30%;">
  <div class="card-header"><%= q.getQNA_NO() %>번 공지사항</div>
  <div class="card-body">
    <h4 class="card-title"><%= q.getQNA_TITLE() %></h4>
    <table class="card-text" style="text-align: center;">
    <tr><th>제목</th><td><%= q.getQNA_TITLE() %></td></tr>
    <tr><th>작성자</th><td><%= q.getNH_NAME() %></td></tr>
    <tr><th>카테고리</th><td><%= q.getQNA_TYPE() %></td></tr>
	<tr><th>등록날짜</th><td><%= q.getQNA_DATE() %></td></tr>
	<tr><th>내용</th><td><%= q.getQNA_CONTENT() %></td></tr>
	<tr><th><a href="/NHMP/detailqna">목록으로 이동</a></th></tr>
    </table>
  </div>
  <hr>
  <form action="/NHMP/dinqna" method="post">
  <table>
<%} %>
  <% if(loginHospital.getCOMPANY_NAME().equals("TMTS") && list.isEmpty()){ %>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="comments" cols="70" rows="5"></textarea>
			<input type="hidden" name="qnano" value="<%= q.getQNA_NO() %>">
			<input type="hidden" name="writer" value="<%= loginHospital.getNH_NAME() %>">
			<input type="submit" value="등록하기" style="position: absolute;">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
  <% } %>
 </form> 
  <% if(!list.isEmpty()) {%>
  <form action="/NHMP/dupqna" method="post">
	<table class="qna-comment-table">
	<tbody>
	<%for(Comment cv : list){ %>
		<tr>
			<th width="10%">
			<input type="hidden" name="commqnano" value="<%= q.getQNA_NO() %>">
			<input type="hidden" name="commno" value="<%= cv.getCOMMENT_NO() %>">
			<input type="hidden" name="commname"value="<%= loginHospital.getNH_NAME() %>"><%= loginHospital.getNH_NAME() %></th>
			<td><textarea name="commetc" cols="70" rows="2"><%=cv.getCOMMENT_ETC() %></textarea></td>
			<td width="15%"> <input type="submit" value="수정하기"><br>
			<!-- A 태그 안에는 가져가야할 값을 적어줘야한다. -->
			<a href="/NHMP/ddelqna?no=<%= cv.getCOMMENT_NO() %>&qnano=<%=q.getQNA_NO()%>">삭제</a></td>
		</tr>
		<%} %>
	</tbody>
</table>
</form>
<%}%>
</div>
<style>
	.qna-comment-wrap{
		width: 800px;
		margin: auto;
	}
	.qna-comment-table{
		width: 700px;
		margin: auto;
	}
	.qna-comment-table,
	.qna-comment-table td,
	.qna-comment-table th{
		border: 1px solid black;
		border-collapse: collapse;
	}	
	
</style>
<!-- 댓글 영역 -->
</body>
</html>