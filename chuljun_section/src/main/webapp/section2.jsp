<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

     <!-- 섹션(상) : 추천숙소(평점순) -> 클릭하면 "해당숙소" 페이지 이동 -->
    <div class="section_top">
        <p>추천 숙소</p>
        <div class="group recommend">
            <!-- 추천숙소 첫번째 행 -->
            <div class="rec_row">
            <c:forEach var="i" begin="1" end="4">
            	<!-- 카드 1~4box -->
            	<div class="rec_card">
            		<a href="">
		                <!-- 이미지 박스-->
		                <div class="imgbox">
		                    <img src="#" alt="추천숙소 ${i }"/>
		                    <!-- 이미지 안에 배지(평점) -->
		                    <div class="badgeLike_box">
		                        <span class="badge_like">★4.9</span>
		                    </div>
		                </div>
		                <!-- 숙소구분(호텔/모텔/펜션) -->
		                <p class="acc_cate">호텔</p>
		                <p class="acc_name">세인트존호텔</p>
		                <p class="acc_city">여수</p>
            		</a>
            	</div>
            </c:forEach>
            <!-- 추천숙소 두번째 행 -->
            <div class="rec_row">
            <c:forEach var="i" begin="5" end="8">
            	<!-- 다섯번째 카드 -->
            	<div class="rec_card">
            		<a href="">
		                <!-- 이미지 박스-->
		                <div class="imgbox">
		                    <img src="#" alt="추천숙소 ${i }"/>
		                    <!-- 이미지 안에 배지(평점) -->
		                    <div class="badgeLike_box">
		                        <span class="badge_like">★4.7</span>
		                    </div>
		                </div>
		                <!-- 숙소구분(호텔/모텔/펜션) -->
		                <p class="acc_cate">모텔</p>
		                <p class="acc_name">서머셋호텔</p>
		                <p class="acc_city">평창</p>
            		</a>
            	</div>
            </c:forEach>
            </div>
        </div>
    </div>

    <!-- 섹션(중) : 이달의 여행지 -> 클릭하면 "지역숙소 검색" 페이지 이동 -->
    <div class="section_middle">
        <p>이달의 여행지</p>
        <div class="monthRegion">
       		<!-- 첫번째 카드(지역) -->
       		<div class="month_card">
       			<a href="#">
       				<img src="#" alt="이달의 지역1"/>
       			</a>
       		</div>
       		<!-- 두번째 카드(지역) -->
       		<div class="month_card">
       			<a href="#">
       				<img src="#" alt="이달의 지역1"/>
       			</a>
       		</div>
       		<!-- 세번째 카드(지역) -->
			<div class="month_card">
       			<a href="#">
       				<img src="#" alt="이달의 지역1"/>
       			</a>
       		</div>       		
       		<!-- 네번째 카드(지역) -->
        	<div class="month_card">
       			<a href="#">
       				<img src="#" alt="이달의 지역1"/>
       			</a>
       		</div>
        	<!-- 다섯번째 카드(지역) -->
        	<div class="month_card">
       			<a href="#">
       				<img src="#" alt="이달의 지역5"/>
       			</a>
       		</div>
        	<!-- 여섯째 카드(지역) -->
        	<div class="month_card">
       			<a href="#">
       				<img src="#" alt="이달의 지역6"/>
       			</a>
       		</div>
        </div>
    </div>

    <!-- 섹션(하) : 랜덤 리뷰 -> 클릭하면 "해당숙소" 페이지 이동 -->
    <div class="section_bottom">
        <p>Review</p>
		<div class="group reivew">
            <!-- 리뷰 첫번째 행 -->
            <div class="rev_row">
            <c:forEach var="i" begin="1" end="4">
            	<!-- 카드 1~4box -->
            	<div class="rec_card">
            		<a href="">
		                <!-- 이미지 박스-->
		                <div class="imgbox">
		                    <img src="review${i}" alt="추천숙소 ${i}"/>
		                    <!-- 이미지 안에 배지(평점) -->
		                    <div class="badgeLike_box">
		                        <span class="badge_like">★4.9</span>
		                    </div>
		                </div>
		                <!-- 숙소구분(호텔/모텔/펜션) -->
		                <p class="acc_cate">호텔</p>
		                <c:forTokens var="hotel" items="힐튼-더호텔-아늑호텔-포레스트" delims="-">
		                	<p class="acc_name">${hotel}</p>
						</c:forTokens>
						<c:forTokens var="city" items="부산-제주-안동-경주" delims="-">
		                	<p class="acc_city">${city}</p>
		                </c:forTokens>
            		</a>
            	</div>
            </c:forEach>
            <!-- 리뷰 두번째 행 -->
            <div class="rev_row">
            <c:forEach var="i" begin="5" end="8">
            	<!-- 5~8번째 카드 -->
            	<div class="rec_card">
            		<a href="">
		                <!-- 이미지 박스-->
		                <div class="imgbox">
		                    <img src="review${i}" alt="추천숙소 ${i}"/>
		                    <!-- 이미지 안에 배지(평점) -->
		                    <div class="badgeLike_box">
		                        <span class="badge_review">★4.9</span>
		                    </div>
		                </div>
		                <!-- 숙소구분(호텔/모텔/펜션) -->
		                <p class="acc_cate">호텔</p>
		                <c:forTokens var="hotel" items="더디자이너스-우디-썬크루즈-샌드파인" delims="-">
		                <p class="acc_name">${hotel}</p>
						</c:forTokens>
						<c:forTokens var="city" items="서울-인천-평창-태안" delims="-">
		                	<p class="acc_city">${city}</p>
		                </c:forTokens>
            		</a>
            	</div>
            </c:forEach>
            </div>
        </div>

    </div>
    