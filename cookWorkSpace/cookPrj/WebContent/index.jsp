<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
            <div id="slide-area">
                <div class="slide-items">
                    <a href="">
                        <img src="/cookTeacher/resources/img/test.jpg" alt="조회수높은레시피띄어주기(레시피게시판담당)" width="1050px" height="400px">
                    </a>
                </div>
                <div class="slide-items">
                    <a href="">
                        <img src="/cookTeacher/resources/img/test2.jpg" alt="조회수높은레시피띄어주기(레시피게시판담당)" width="1050px" height="400px">
                    </a>
                </div>
                <div class="slide-items">
                    <a href="">
                        <img src="/cookTeacher/resources/img/test3.jpg" alt="조회수높은레시피띄어주기(레시피게시판담당)" width="1050px" height="400px">
                    </a>
                </div>
            </div>
            <div id="slide-btn-area">
                <button id="slide-btn1"></button>
                <button id="slide-btn2"></button>
                <button id="slide-btn3"></button>
            </div>
    
    
            <script>
                const btn1 = document.querySelector('#slide-btn1');
                btn1.addEventListener('click',function(){
                    document.querySelector('#slide-area').style.transform= 'translate(0)';
                })
                const btn2 = document.querySelector('#slide-btn2');
                btn2.addEventListener('click',function(){
                    document.querySelector('#slide-area').style.transform = 'translate(-1050px)';
                })
                
                const btn3 = document.querySelector('#slide-btn3');
                btn3.addEventListener('click',function(){
                    document.querySelector('#slide-area').style.transform = 'translate(-2100px)';
                })
            </script>
    
    
            <div id="main-middle">
                <div>레시피</div>
                <div id="main-menu-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/돼지고기청경채볶음.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>메뉴이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>메뉴이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마라샹궈.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>메뉴이름</div>
                    </div>
                </div>
            </div>
            <div id="main-bottom">
                <div>식재료</div>
                <div id="main-menu-bar">
                    <div class="main-menu-bar-items">
                        <a href="">과일/채소</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">해산물/육류</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">유제품</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">조미료/양념</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">면류/빵류</a>
                    </div>
                </div>
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마늘.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>식재료이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마늘.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>식재료이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마늘.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>식재료이름</div>
                    </div>
                </div>
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마늘.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>식재료이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마늘.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>식재료이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마늘.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>식재료이름</div>
                    </div>
                </div>      
            </div>

        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    

</body>
</html>