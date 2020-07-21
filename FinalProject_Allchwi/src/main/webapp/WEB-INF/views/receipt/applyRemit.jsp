<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${cp}/resources/css/classEnrollment/classEnrollment.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=472c28df1aaa1946fb26fe353232eace&libraries=services"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${cp}/resources/js/classEnrollment/classEnrollment.js"></script>
<link id="cp" data-contextPath="${cp}" />

<div class="classOpen">
	<div class="title_box">
		<h3>송금정보 입력</h3>
	</div>

	<form method="POST" enctype="multipart/form-data" id="frm-class">
		<!-- 선택된 페이지 출력 -->
		<div class="tab-content" id="pills-tabContent">
			<!-- 01튜터 기본정보 입력 페이지 -->
			<div class="tab-pane fade show active" id="pills-info"
				role="tabpanel">
				<div class="info1">
					<span class="pink">*</span>필수
				</div>
				
				<div class="box">
					<div class="title">
						은행<b class="pink">*</b>
					</div>
					<div class="input-group col-5">
						<input type="text" class="form-control" name="rem_bank"
							placeholder="은행명을 입력해주세요.">
					</div>
				</div>

				<div class="box">
					<div class="title">
						계좌번호<b class="pink">*</b>
					</div>
					<div class="cont input-group col-5">
						<input type="text" name="rem_account"
							class="form-control" placeholder=" - 포함하여 입력해주세요.">
					</div>
				</div>
				
				<div class="box">
					<div class="title">
						신청금액<b class="pink">*</b>
					</div>
					<div class="cont input-group col-5">
						<input type="text" name="rem_pay"
							class="form-control" readonly="readonly" value="${final_price }원">
					</div>
				</div>
				
				<input type="text" name="pay_num" value="${pay_num }">
				
				<div class="button_box">
					<button type="button" id="firstNext" class="btn btn-outline-danger"
						data-num='2'>올취 송금요청</button>
				</div>
			</div>


		</div>
	</form>
</div>