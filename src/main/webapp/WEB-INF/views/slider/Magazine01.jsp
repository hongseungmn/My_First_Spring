<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hongseongmin
  Date: 6/29/23
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
  .custom-text{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 20px;
  }
  .highLight {
    background-color : #f4bfbf;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #ee4949;
    font-size: 23px;
    font-weight: bold;
  }
  .my-hr {
    border:0;
    height: 3px;
    background-color: #ccc;
  }
  .wrap-vertical{

    padding: 20px;
    overflow: scroll;
    color: #112031;
    background: white;
    /* 가로 스크롤 */
    white-space: nowrap;
    height: 300px;
  }
  .card {
    display: inline-flex;
    margin : 10px;
    border: none;
  }
  .card-footer {
    border: none;
    background-color: white;
    padding: 5px 0 3px 3px;
    height: 100px;
    text-overflow: ellipsis;
  }
  .card-title {
    font-size: 12px;
    color:#a7a4a4;
  }
  .card-content {

    width: 100px;
  }
  .product-img {
    border-radius: 20%;
    border: #ccc solid 1px;
  }
</style>
<div class="container mt-5 custom-text">
  <div class="jumbotron rounded-3" style="background-color: #ffb1b1;">
    영양소 A to Z<br>
    <h4><strong style="color:#ee4949">운동러들의 필수 보충제, 아르기닌의 부작용</strong></h4>
  </div>

  <div>
    아르기닌이 운동 능력 향상에 도움이 된다고 알려져 최근 운동을 하는 분들이 많이 찾고 있죠. 아르기닌은 운동과 관련된 역할 외에도 우리 몸에서 다양한 역할을 하는 아미노산이지만 어떤 영양제든 과다하게 섭취할 경우 부작용이 있을 수 있으니 부작용을 꼼꼼히 살펴보고 선택하도록 해주세요.
  </div>
  <div class="mt-5">
    <img src="resources/images/magazine_images/01/01_IMG.png" class="img-fluid">
  </div>
  <hr class="my-hr mt-5 mb-5">
  <div class="paragraph">
    <div class="mt-5">
      <span class="title">아르기닌이 탈모를 유발한다?</span>
    </div>
    <div class="mt-3">
      아르기닌을 먹으면 탈모가 온다는 얘기가 종종 들려오는데 아직
      <span class="highLight">탈모와의 직접적인 상관관계는 밝혀진 바가 없어요. </span>
      오히려 아르기닌은 혈관을 확장시켜서 혈액순환을 도와주기 때문에
      모근으로 공급되는 혈액량을 늘리고 머리카락의 성장에 도움을 줄 수 있다는 주장도 있습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">헤르페스 바이러스</span>
    </div>
    <div class="mt-3">
      입술이나 남녀의 성기 부분에 포진을 발생시키는 <span class="highLight">헤르페스 바이러스가 있는 분들은 주의가 필요해요. </span>
      아르기닌이 헤르페스 바이러스의 증식에 관여하기 때문에
      평소 컨디션이 안 좋으면 입술 포진이 잘 올라오는 분들은 아르기닌을 먹기보다 목적에 맞는 다른 영양제를 선택하시는 것이 좋습니다.
    </div>
    <div class="mt-3">
      하지만 헤르페스 바이러스 자체를 만들어내는 것은 아니기 때문에 헤르페스가 있었던 적이 없는 분들은 안심하셔도 괜찮아요!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">저혈압</span>
    </div>
    <div class="mt-3">
      아르기닌은 혈관을 확장하여 혈액 잘 순환되도록 돕는데요.
      과다하게 섭취할 경우에는 오히려 혈압을 낮출 수 있기 때문에 <span class="underLine">평소 저혈압이 있거나 혈압약을 복용하는 중인 경우 전문가와 상담 후 복용하는 것이 좋아요. </span>
      비아그라와 같은 약도 혈관을 이완하기 때문에 이런 약을 먹고 있다면 아르기닌 섭취량을 반드시 체크해 주세요.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">소화 문제</span>
    </div>
    <div class="mt-3">
      일반적인 영양제에서 나타나는 대표적인 부작용이죠.
      아르기닌도 마찬가지로 설사, 복통을 비롯해 배가 빵빵한 느낌이 드는 팽만감까지
      <span class="underLine">다양한 위장장애를 유발</span>할 수 있습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">알레르기</span>
    </div>
    <div class="mt-3">
      <span class="underLine">아르기닌 자체에 알레르기가 있는 경우도 있어요. </span>
      따라서 아르기닌을 섭취 후 두드러기, 발진, 호흡 곤란 등의 증상이 나타날 경우 즉시 섭취를 중단하셔야 합니다.
      또한 천식이나 다른 알레르기가 있는 분들은 이런 증상이 아르기닌에 의해서 악화될 수 있습니다.
    </div>
  </div>
  <hr class="mt-5 my-hr">
  <div class="mt-5 mb-5 jumbotron">
    국내에서는 특정 회사에서 개별적으로 인정받은 아르기닌만이 건강기능식품 인증을 받았는데,
    <span class="highLight">혈관 이완을 통한 혈액 순환 개선을 위해서 하루 6g의 아르기닌을 섭취하도록 권장하고 있어요.</span>
    <span class="underLine">보충제로 복용할 경우 명확하게 정해진 용량은 없지만 보통 1~3g 정도를 시작으로 효과나 부작용에 따라 조절하면서 나에게 맞는 섭취량을 찾아보세요!</span>
  </div>
</div>
<div class="container">
  <span class="custom-text">&#x1F601; 관련 영양제 인기 TOP 10 <i class="bi bi-chat-quote"></i></span>
  <div class="wrap-vertical">
    <c:if test="${empty listData}" var="listIsEmpty">
      등록된 제품이 없습니다
    </c:if>
    <c:if test="${not listIsEmpty}">
      <c:forEach var="record" begin="0" end="10" items="${listData}" >
        <div class="card" style="width:150px;height:400px;">
          <c:if test="${not empty record.imgURL}">
            <a href='/detail.do?no=${record.no}'><img src="${record.imgURL}" style="width:150px;height:150px;" class="img-fluid product-img"></a>
          </c:if>
          <c:if test="${empty record.imgURL}">
            <a href='/detail.do?no=${record.no}'><img src="resources/images/thumbnail_img/No_IMG.jpeg" style="object-fit:fill" class="img-fluid product-img"></a>
          </c:if>
          <div class="card-footer" style="white-space:normal">
            <span class="card-title">${record.company}</span><br>
            <span class="card-content">
                ${record.name}
            </span>
          </div>
        </div>
      </c:forEach>
    </c:if>
  </div>
</div>



<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
