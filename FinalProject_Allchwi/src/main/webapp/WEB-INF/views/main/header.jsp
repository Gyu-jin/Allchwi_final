<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.topbar {
    height: 8rem;
}
.header_loog{
	margin-left:15%;
	height: 90%;
	width: 90%;
}
.header_Mymenu{
	margin-right:10%;
}
.btn-primary {
    color: #fff;
    background-color: #7185bb;
    border-color: #7185bb;
}

</style>
<!-- header.jsp -->
<div>
 <!-- 반응형 Topbar?? -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
          <!-- 반응형 Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- 로고 , 검색창 Topbar -->
          <div class="container-sm">
	          <div class="header_loog">
		          <a href="${cp }/"><img src="${cp}/resources/img/Allchwi_logo.png" style="width: 200px; height: 100px"></a>
		          <form action="${cp}/list/search"
		          class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		            <div class="input-group">
		              <input type="text" name="keyword" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
		              <div class="input-group-append">
		                <button class="btn btn-primary" type="submit">
		                  <i class="fas fa-search fa-sm"></i>
		                </button>	                	               
		              </div>
		            </div>	            
		          </form>
	          </div>
          </div>
         <!-- 연습용메뉴 -->
		 <div class="practice-group">
           	
    
           	<a href="${cp}/admin/main">관리자 연습</a> 
         
		 </div>
		 
          <!-- 왼쪽 메뉴 세개(튜터등록, 수업신청, 로그인 -->
          <div class="header_Mymenu">
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>


         
            <!-- a 로그인 링크 -->
            <c:choose>
            <c:when test="${sessionScope.ml_num == null}">
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="${cp}/login/main" id="classApply" role="button">
               		<span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인</span>
            	</a>
            </li>
			</c:when>
			<c:otherwise>
				
            <!-- 튜터등록 링크 -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="tutorEnroll" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            		<span class="mr-2 d-none d-lg-inline text-gray-600 small">튜터관리</span>
           		</a>
                
            
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="tutorEnroll">
                <a class="dropdown-item" href="${cp}/class/enrollment" >
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  	튜터등록
                </a>
                <a class="dropdown-item" href="${cp}/class/classBoard" id="tutorEnroll">
                  <i class="fas fa-database fa-sm fa-fw mr-2 text-gray-400"></i>
                  	튜터 내 수업
                </a>
                <a class="dropdown-item" href="${cp}/receipt/main">
                  <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i>
                  	튜터 수업료 정산
                </a>
                <a class="dropdown-item" href="${cp}/myClass/myClassManage">
                  <i class="fas fa-times fa-sm fa-fw mr-2 text-gray-400"></i>
                  	튜터 신청서 관리
                </a>
               
              </div>
             </li>
           
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="${cp}/class/wishList" id="tutorEnroll" role="button">
            		<span class="mr-2 d-none d-lg-inline text-gray-600 small">위시리스트</span>
           		</a>
                
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="${cp}/mypage/myClassList" id="tutorEnroll" role="button">
            		<span class="mr-2 d-none d-lg-inline text-gray-600 small">내 수강목록</span>
           		</a>
                
            </li>
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                <!-- a 세션 로그인넘버가 있을 때 vo에서 값을 가져온 뒤 별명이 없을 경우 이름 출력 -->
	                <c:choose>
	               		<c:when test="${mem.mb_nickname == null}">
	                		${mem.mb_name}
	                	</c:when>
		                <c:otherwise>
		                	${mem.mb_nickname}                
		                </c:otherwise>
		            </c:choose>
                </span>
                <!-- 
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                 -->
                 <!-- 이미지 출력 수정 -->
                <img class="img-profile rounded-circle" src="${cp}/mypage/getimg?pro_num=${mem.pro_num}">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${cp}/mypage/mypageForm">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  	내 프로필
                </a>
                <a class="dropdown-item" href="${cp}/mypage/pointForm">
                  <i class="fas fa-database fa-sm fa-fw mr-2 text-gray-400"></i>
                  	내 포인트
                </a>
                <a class="dropdown-item" href="${cp}/mypage/changePwd">
                  <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i>
                  	비밀번호 변경
                </a>
                <a class="dropdown-item" href="${cp}/mypage/signout">
                  <i class="fas fa-times fa-sm fa-fw mr-2 text-gray-400"></i>
                  	회원탈퇴
                </a>
                <div class="dropdown-divider"></div>
                <!-- a태그에 원래 있던 내용  href 다음 data-toggle="modal" data-target="#logoutModal" -->
                <a class="dropdown-item" href="${cp}/login/logout" >
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
            </c:otherwise>
			</c:choose>
          </ul>
          </div>
 
        </nav>
        
        <!-- End of Topbar -->
		

</div>
