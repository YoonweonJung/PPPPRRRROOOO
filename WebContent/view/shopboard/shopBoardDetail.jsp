<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <link rel="stylesheet" media="all" href="https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/show-f8e3b90a15d53094d2bbf38d1634d34bfd8121784e9eb560abd0bcd41ac16334.css" />
    <link rel="stylesheet" media="screen" href="https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/flea_market-49a126514a2d98823e117acbef63b95d937a6edf4f28757d2213977512f0cbd3.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<title>상세보기</title>

</head>
<body>
	<%
		String  oriNo  = request.getParameter("oriNo");  	//해당게시물번호
		String  nowPage= request.getParameter("nowPage"); //보고싶은페이지(릴레이용)
	%>
</head>
<body>

<header id="fixed-bar">
  <div id="fixed-bar-wrap">
    <h1 id="fixed-bar-logo-title">
      <a href="https://www.daangn.com/">
        <span class="sr-only">중고나라</span>
        <img class="fixed-logo" alt="당근마켓" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-00b7e471b721ce9db8b0758c05a84684413c8aef1ad54caa0f3fcbe7328c947f.svg" />
</a>    </h1>
    
    <section id="fixed-bar-search">
      <div class="search-input-wrap">
        <span class="sr-only">검색</span>
        <input type="text" name="header-search-input" id="header-search-input" class="fixed-search-input" placeholder="지역, 상품, 업체등을 검색해보세요." />
        <button id="header-search-button">
          <img class="fixed-search-icon" alt="Search" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/search-icon-db20a2e9e6b0fc922b44982d451cf1c967c86e8e8df270e71c300832a6f31f1a.svg" />
        </button>
      </div>
    </section>
  </div>
</header>



<article id="content" data-id="${DETAIL.b_id}">
      <section id="article-images">
        <div id="image-slider">
  <div class="slider-wrap">
    <div class="slider" data-article-id="${DETAIL.b_id}">
          <div>
            <div class="image-wrap" data-image-id="148728794" data-image-index="1">
              <img src = "${DETAIL.b_img}"
                   class="portrait"
                   alt='' />
            </div>
          </div>
  </div>
</div>
      </section>

    <section id="article-profile">
        <a id="article-profile-link" href="/users/2860394">
          <h3 class="hide">프로필</h3>
          <div class="space-between">
            <div>
              <div id="article-profile-image">
                <img alt="" src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c61615521a556c55347cb716eaf6b3685766da99b85cbf1242ecc1476195f25a.png" />
              </div>
              <div id="article-profile-left">
                <div id="nickname">${DETAIL.b_name}</div>
                <div id="region-name">송파구 잠실2동</div>
              </div>
            </div>
            <div id="article-profile-right">
              <dl id="temperature-wrap">
                <dt>매너온도</dt>
                <dd class="text-color-03">
                  36.5°
                </dd>
              </dl>
              <div class="meters">
                <div class="bar bar-color-03" style="width: 37%;"></div>
              </div>
              <div class="face face-03"></div>
            </div>
          </div>
</a>    </section>

    <section id="article-description">
        <h1 property="schema:name" id="article-title" style="margin-top:0px;">삼성냉장고</h1>
        <p id="article-category">
          디지털/가전 ∙
          <time>9시간 전</time>
        </p>
        <p property="schema:priceValidUntil" datatype="xsd:date" content="2021-08-26"></p>
        <p rel="schema:url" resource="https://www.daangn.com/38287124"></p>
        <p property="schema:priceCurrency" content="KRW"></p>
        <p id="article-price" property="schema:price" content="50000" style="font-size:18px; font-weight:bold;">
            50,000원
        </p>
        <div property="schema:description" id="article-detail">
            <p>삼성냉장고 사무실이전으로 그냥 싸게 넘겨요
<br />이상없고 물흐름 전혀없습니다. 냉장고와 냉동고가 따로 나눠져 있습니다.
<br />오셔서 가져갈분만 연락주세요
<br />사이즈는 높이 190 너비60  폭 60  입니다.
<br />논현동입니다.
<br />사이즈는</p>
        </div>
        <p id="article-counts">
          채팅 23 ∙ 관심 17 ∙ 조회 629
        </p>
    </section>
</article>
    <section id="article-detail-hot-more">
    <div id="hot-more-link"><a href="../../view/shopboard/shopBoardDetail2.jsp">더 구경하기</a></div>
    </section>





</body>
</html>


	







