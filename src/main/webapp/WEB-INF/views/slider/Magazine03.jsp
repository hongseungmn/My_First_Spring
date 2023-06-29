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
</style>
<div class="container mt-5 custom-text">
  <div class="jumbotron rounded-3" style="background-color: #ffb1b1;">
    영양소 A to Z<br>
    <h4><strong style="color:#ee4949">먹는 히알루론산은 효과가 없다던데, 그러면 주사로 맞아볼까?</strong></h4>
  </div>
  <div>
    화장품에도 많이 들어 있고 인공 눈물의 성분으로도 쓰이는 데다 관절에도 좋다고 하는 만능 영양소가 있죠.
    바로 <span class="highLight">히알루론산(hyaluronic acid)</span>입니다.
    영양제로 먹는 것부터 바르는 화장품, 그리고 인공눈물, 주사까지 정말 다양한 형태의 히알루론산이 있죠.
  </div>
  <div class="mt-5">
    <img src="resources/images/magazine_images/03/01_IMG.png" class="img-fluid">
  </div>

  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">히알루론산이란?</span>
    </div>
    <div class="mt-3">
      히알루론산은 우리 몸에서 자연적으로 생겨나는 물질로 피부, 연골, 눈 등에 많이 분포되어 있어요.
    </div>
    <div class="mt-3">
      <span class="highLight">스스로의 무게의 300~1000배에 이르는 많은 양의 수분을 머금을 수 있어 보습에 도움이 되는 성분</span>입니다.
      그래서 건조한 피부를 촉촉하게 만들어주는 것은 물론,
      눈의 건조감이나 관절 통증을 완화, 상처 재생 등 우리 몸에서 다양한 도움이 될 수 있어요.
    </div>
    <div class="mt-3">
      원래 우리 몸을 구성하는 성분이지만 <span class="underLine">나이가 들면서 감소하기 때문에 외부에서 다양한 형태로 공급하는 것이 도움이 될 수 있어요.</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">영양제 vs 주사, 어느 게 더 좋을까?</span>
    </div>
    <div class="mt-3">
      먹는 히알루론산은 효과가 없다는 말도 있지만
      실제로 식품의약품안전처(식약처)에서 피부 보습과 피부 건강 유지에 도움을 줄 수 있다는 기능성을 인증받아서 사용되고 있습니다.
      또한 히알루론산은 몸에서 자연적으로 생성되는 성분인 만큼 <span class="highLight">일반적으로 부작용 없이 안전하게 먹을 수 있어요. </span>
      하지만 모든 영양제가 그렇듯 <span class="underLine">한 번의 섭취로 효과를 보기는 어려우니 오랫동안 꾸준히 섭취</span>할 수 있도록 해주세요.
    </div>
    <div class="mt-3">
      <span class="highLight">스스로의 무게의 300~1000배에 이르는 많은 양의 수분을 머금을 수 있어 보습에 도움이 되는 성분</span>입니다.
      그래서 건조한 피부를 촉촉하게 만들어주는 것은 물론,
      눈의 건조감이나 관절 통증을 완화, 상처 재생 등 우리 몸에서 다양한 도움이 될 수 있어요.
    </div>
    <div class="mt-3">
      (단, 임산부와 수유부는 피하는 것이 좋으며, 히알루론산은 특정 암세포의 먹이가 될 수 있다는 연구 결과가 있기 때문에 암 병력이 있는 경우에는 복용을 피해주세요.)
    </div>
    <div class="mt-5">
      <img src="resources/images/magazine_images/03/02_IMG.png" class="img-fluid">
    </div>
    <div class="mt-3">
      히알루론산을 피부나 관절에 <span class="highLight">직접 주사로 주입</span>하면 물론 효과는 더 좋아지겠지만 <span class="highLight">부작용의 위험이 높아져요.</span>
      하지만 이 부작용은 히알루론산 자체의 부작용이 아니라 가려움, 통증과 같은 주사 행위로 인한 경우가 많습니다.
    </div>
    <div class="mt-3">
      따라서 주사를 맞을 경우에는 반드시 경험이 많은 전문가를 통해 맞길 권해드립니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">인증 마크를 확인하세요!</span>
    </div>
    <img src="resources/images/magazine_images/03/03_IMG.png" class="img-fluid">
  </div>
  <div class="mt-3">
    히알루론산 영양제를 먹으면 대부분은 아미노산으로 분해가 되기 때문에 먹은 양 중 극히 일부만이 우리 몸에서 효과를 나타내게 됩니다.
    따라서 일반 식품보다는 피부 건강에 도움을 준다는 효과를 인증받아 <span class="highLight">‘건강기능식품’ 인증 마크가 있는 제품</span>을 선택해 주세요.
  </div>
  <div class="mt-3">
    또한 히알루론산이 충분한 수분을 머금을 수 있도록 영양제 섭취와 함께 많은 양의 물을 드시는 것도 잊지 마세요!
  </div>
</div>
<hr class="mt-5 my-hr">
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
