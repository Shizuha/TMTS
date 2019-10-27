<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Main.Cnotice.model.vo.Cnotice,
				Main.NursingHospital.model.ov.NursingHospital" 
%>
<%
	Cnotice notice = (Cnotice)request.getAttribute("notice");
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
<% if(loginHospital != null && loginHospital.getAUTHORITY_CODE().equals("G1")){ %>
<div class="card border-primary mb-3" style="max-width: 45rem; text-align: center;  position: center; top:30%; left:30%;">
  <div class="card-header"><%= notice.getNOTICE_NO() %>번 공지사항</div>
  <div class="card-body">
 	<form action="/NHMP/gongup" method="post">
    <h4 class="card-title"><input type="text" name="title" value="<%= notice.getNOTICE_TITLE() %>">
    <input type="hidden" name="noticeno" value="<%= notice.getNOTICE_NO() %>">
    </h4>
    <table class="card-text">
    <tr><th>작성자</th><td><input type="text" name="writer" value="<%= notice.getNH_NAME() %>" readonly></td></tr>
    <tr><th>카테고리</th><td>
	<select name="category">
	<option value="이벤트">이벤트</option>
	<option value="정기점검">정기점검</option>
	<option value="긴급점검">긴급점검</option>
	<option value="임시점검">임시점검</option>
	<option value="알림">알림</option>
	</select>
	</td></tr>
	<tr><th>등록날짜</th><td><input type="date" name="date" value="<%= notice.getNOTICE_DATE() %>"></td></tr>
	<tr><th>내용</th><td><textarea name="content" cols="70" rows="5"><%= notice.getNOTICE_CONTENT() %></textarea></td></tr>
	<tr><th><a href="/NHMP/gongall">목록으로 이동</a>
		<input type="submit" value="수정하기">
		<input type="reset" value="취소">
		<a href="/NHMP/gongdel?no=<%= notice.getNOTICE_NO() %>">삭제하기</a>
	</th></tr>
    </table>
    </form>
  </div>
</div>
<% }else{ %>
<div class="card border-primary mb-3" style="max-width: 45rem; text-align: center;  position: center; top:30%; left:30%;">
  <div class="card-header"><%= notice.getNOTICE_NO() %>번 공지사항</div>
  <div class="card-body">
    <h4 class="card-title"><%= notice.getNOTICE_TITLE() %></h4>
    <table class="card-text">
    <tr><th>제목</th><td><%= notice.getNOTICE_TITLE() %></td></tr>
    <tr><th>작성자</th><td><%= notice.getNH_NAME() %></td></tr>
    <tr><th>카테고리</th><td><%= notice.getNOTICE_TYPE() %></td></tr>
	<tr><th>등록날짜</th><td><%= notice.getNOTICE_DATE() %></td></tr>
	<tr><th>내용</th><td><%= notice.getNOTICE_CONTENT() %></td></tr>
	<tr><th><a href="/NHMP/gongall">목록으로 이동</a></th></tr>
    </table>
  </div>
</div>
<%} %>
</body>
</html>