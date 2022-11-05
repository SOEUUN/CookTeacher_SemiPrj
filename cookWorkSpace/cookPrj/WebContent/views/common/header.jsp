<%@page import="com.kh.cook.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String root = request.getContextPath();
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	session.removeAttribute("alertMsg");
	
%>

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script><!-- 알람 -->
	<script>
		<%if(alertMsg != null) {%>
            Swal.fire({
            confirmButtonColor: '#255D00',
            title: '<%=alertMsg%>',
          });
		<%} %>
	</script>

    <header>
        <a id="top-btn" href="#header-wrap">
			<img src="/cookTeacher/resources/img/icons/up-arrow.png" alt="">
		</a>
        <div id="header-wrap">
            <div id="header-top">   
                <div>
                   <%if(loginMember != null && "N".equals(loginMember.getAdminYn())) {%>
                       <a href="<%=root %>/member/logout">로그아웃</a>
                       <span>|</span>
                       <a href="<%=root %>/login/mypage/member">마이페이지</a>
                   
                   <%} else if(loginMember != null &&"Y".equals(loginMember.getAdminYn())) {%>	
                       <a href="<%=root %>/member/logout">로그아웃</a>
                       <span>|</span>
                       <a href="<%=root%>/report/list">신고관리</a>
                       <span>|</span>
                       <a href="<%=root %>/admin/member/list?member=all&pno=1">회원조회</a>
                       <span>|</span>
                       <a href="<%=root %>/cs/QnA/list">문의관리</a>
                       
                       
                   <%} else {%>
                    <a href="<%=root %>/member/join">회원가입</a>
                    <span>|</span>
                    <a href="<%=root %>/member/login">로그인</a>
                   <%} %>
                       <span>|</span>
                    <a href="<%=root %>/notice/list?pno=1">공지사항</a>
                
    
                </div>
                <div>
                    <div id="header-logo">
                        <a href="<%=root %>">                       
                            <img src="<%=root %>/resources/img/icons/logo.png" alt="쿡선생로고" width="105px" height="105px">
                        </a> 
                        <div>집밥Cook선생</div>
                    </div>
                    <div id="header-search-area">

                    </div>
                    <div id="header-member-area">    
                    <%if(loginMember != null) {
                    	if(loginMember.getProfile() != null){%>
	                    	<div>
	                            <img src="<%=loginMember.getProfile() %>" alt="<%=loginMember.getNick() %>" width="50px">
	                        </div>
						<%}else { %>
							<div>
	                            <img src="/cookTeacher/upload/profile/member_profile.gif" alt="기본프로필" width="50px">
	                        </div>
	                    	<%} %>    	                    
                        <div><%=loginMember.getNick() %> 님</div>
                    <%} else{%>
                        <div></div>
                    <%} %>
                        <div>
                            <a href="<%=root%>/cart/list">
                                <img src="<%=root%>/resources/img/icons/장바구니.svg" alt="장바구니" width="50px" height="50px">
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
                        <a href="<%= root %>/views/menu/recipe_cate.jsp">레시피</a>
                    </div>
                    <div class="header-menu-items">
                        <a href="<%= root %>/bobstory/list">쿡스토리</a>
                    </div>
                    <div class="header-menu-items">
                        <a href="<%= root %>/cs/FAQ/list">고객센터</a>
                    </div>
                </div>
            </div>
        </div>

    </header>




