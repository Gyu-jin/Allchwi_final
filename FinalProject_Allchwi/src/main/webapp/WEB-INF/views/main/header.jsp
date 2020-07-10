<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		          <form method="post" action="${cp}/search/detailSearch"
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
           	<a href="${cp}/admin/main">관리자 연습</a>&nbsp&nbsp
			<a href="${cp}/login/main">로그인 연습</a>&nbsp&nbsp
			<a href="${cp}/class/enrollment">튜터등록</a>&nbsp&nbsp
			<a href="${cp}/class/apply">수업신청하기</a>&nbsp&nbsp
			<!-- 연습추가/영호 -->
			<a href="${cp}/mypage/mypageForm">프로필</a>&nbsp&nbsp
			<a href="${cp}/mypage/changePwd">비밀번호변경</a>&nbsp&nbsp	
			<a href="${cp}/mypage/signout">회원탈퇴</a>&nbsp&nbsp		
			<a href="${cp}/mypage/pointForm">내 포인트</a>	
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

            <!-- 튜터등록 링크 -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="tutorEnroll" role="button">
            		<span class="mr-2 d-none d-lg-inline text-gray-600 small">튜터등록</span>
           		</a>
                
            </li>

            <!-- 수업신청서 링크 -->
            <li class="nav-item dropdown no-arrow mx-1">
            	
                <a class="nav-link dropdown-toggle" href="#" id="classApply" role="button">
               		<span class="mr-2 d-none d-lg-inline text-gray-600 small">수업신청서</span>
            	</a>
                
            </li>
				
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">닉네임</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  	마이페이지
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  	내 프로필
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  	내 수업
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>
          </div>
 
        </nav>
        
        <!-- End of Topbar -->
		

</div>
