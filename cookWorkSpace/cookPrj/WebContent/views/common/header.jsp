<%@page import="com.kh.cook.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String root = request.getContextPath();
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	session.removeAttribute("alertMsg");
%>
	<script>
		<%if(alertMsg != null) {%>
			alert('<%=alertMsg%>');
		<%} %>
	</script>

    <header>
        <div id="header-top">   
            <div>
           	<%if(loginMember != null) {%>
           		<a href="<%=root %>/member/logout">로그아웃</a>
           		<span>|</span>
           		<a href="<%=root %>/login/mypage/member/check">마이페이지</a>
           		
           	<%} else {%>
            	<a href="<%=root %>/member/join">회원가입</a>
                <span>|</span>
                <a href="<%=root %>/member/login">로그인</a>
           	<%} %>
           		<span>|</span>
                <a href="<%=root %>/notice/list">공지사항</a>
            

            </div>
            <div>
                <div id="header-logo">
                    <a href="<%=root %>">                       
                        <img src="<%=root %>/resources/img/icons/logo.png" alt="쿡선생로고" width="105px" height="105px">
                    </a> 
                    <div>집밥Cook선생</div>
                </div>
                <div id="header-search-area">
                    <input type="text" name="search" placeholder="검색어를 입력해주세요.">
                    <button><img src="/cookTeacher/resources/img/icons/search.png" alt="검색아이콘" width="100%" height="100%"></button>
                </div>
                <div id="header-member-area">
                <%if(loginMember != null) {%>
                	<div><%=loginMember.getNick() %> 회원님</div>
                <%} else{%>
                	<div></div>
                <%} %>
                	<div>
                        <a href="<%=root%>/cart/list">
                            <img src="<%=root%>/resources/img/icons/cart.png" alt="장바구니" width="50px" height="50px">
                        </a>
                    </div>
                </div>
                
            </div>
        </div>
       
        <div id="header-bottom">
            <div id="header-menu-bar">
                <div class="header-menu-items">
                    <a href="<%= root %>/product/main/productList">쇼핑</a>
                    
                </div>
                <div class="header-menu-items">
                    <a href="">레시피</a>
                </div>
                <div class="header-menu-items">
                    <a href="">밥이야기</a>
                </div>
                <div class="header-menu-items">
                    <a href="">고객센터</a>
                </div>
            </div>
        </div>
    </header>



