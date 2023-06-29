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
    <h4><strong style="color:#ee4949">🤎브라운 💚그린 ❤️레드 프로폴리스 중 어떤 걸 먹어야 할까?</strong></h4>
  </div>
  <div class="mt-5">
    <img src="resources/images/magazine_images/04/01_IMG.png" class="img-fluid">
  </div>
  <div class="mt-3">
    ‘앞’을 의미하는 ‘pro’와 도시를 의미하는 ‘polis’의 합성어로 앞에서 전체를 지킨다는 뜻을 가진 프로폴리스는,
    꿀벌이 외부 환경으로부터 자신과 벌집을 보호하기 위해 식물의 꽃가루와 자신의 분비물을 섞어서 만든 방어 물질이에요.
  </div>
  <div class="mt-3">
    일반적으로 프로폴리스는 <span class="underLine">천연 항생제라고 불릴 정도로 항염, 항균 작용이 뛰어나다</span>고 알려져 있는데요.
    프로폴리스의 종류에 따라서 이런 효과의 차이가 있으니 <span class="highLight">프로폴리스의 종류와 특징</span>을 알아볼게요!
  </div>
  <hr class="mt-5 my-hr">
  <div class="paragraph">
    <div class="mt-5">
      🤎 브라운 프로폴리스
    </div>
    <div class="mt-3">
      <span class="underLine">가장 일반적인 프로폴리스</span>가 ‘브라운’ 프로폴리스라고 생각하시면 돼요. 프로폴리스는 일반적으로 갈색빛을 띠는 물질로 생산되기 때문에
      그린, 레드 프로폴리스가 생산되는 지역을 제외한 일반적인 프로폴리스가 모두 브라운 프로폴리스라고 보면 됩니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      💚 그린 프로폴리스
    </div>
    <div class="mt-3">
      그린 프로폴리스는 2세대 프로폴리스, 초록 다이아몬드 등으로 불리는데요.
      프로폴리스 중에서 브라질 특정 지역에 있는 표면이 푸른빛을 띠는 나무에서 채취되는 프로폴리스를 그린 프로폴리스라고 해요.
    </div>
    <div class="mt-3">
      이 그린 프로폴리스에는 <span class="highLight">‘아르테필린-C’라는 성분이 들어 있어</span> <span class="underLine">일반적인 프로폴리스보다 항염, 항균, 항바이러스, 면역 효과가 뛰어납니다.</span>
      또한 아르테필린-C는 신생 혈관의 생성을 억제하기 때문에 암세포가 비정상적으로 성장하는 것을 막고,
      우리 몸에 들어온 바이러스나 암세포 등을 죽이는 NK 세포의 활동을 돕기 때문에 <span class="underLine">항암 작용에도 도움이 된다고 알려져 있어요.</span>
    </div>
    <div class="mt-3">
      이런 이유로 브라질 정부에서는 해당 지역에서 채취한 프로폴리스에만 ‘그린’ 프로폴리스라고 표기할 수 있도록 하고 있습니다.
      하지만 실제로는 영양제 이름이나 정보에서는 ‘그린 프로폴리스’라고 표기가 되어있는데 원료명을 보면 원산지가 다른 나라이거나 표기가 되지 않은 경우가 있어요.
      따라서 <span class="underLine">그린 프로폴리스를 선택하기 위해서는 이름만 확인하지 않고 꼭 원산지도 함께 확인해 주세요.</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      ❤️ 레드 프로폴리스
    </div>
    <div class="mt-3">
      가장 최근에 들어온 레드 프로폴리스는 3세대 프로폴리스로 여겨져요. 그린 프로폴리스와 마찬가지로 브라질의 특정 지역에서 채취하는 프로폴리스인데,
      껍질이 붉은색을 띠는 달버지아 나무에서 나온 붉은 수액을 꿀벌이 채집하여 생산한 프로폴리스에요. 프로폴리스 역시 붉은색을 띠고 있답니다.
      그런데 이 나무의 개체 수가 많지 않아서 레드 프로폴리스의 생산량이 매우 적어 희소성이 높은 성분이에요.
    </div>
    <div class="mt-3">
      레드 프로폴리스 또한 일반적인 브라운 프로폴리스보다 항산화 물질의 함량이 높고 항균, 항염증 효과도 좋다고 알려져 있어요.
      <span class="underLine">하지만 레드 프로폴리스는 그린 프로폴리스의 아르테필린-C와 같은 뚜렷하게 구별되는 성분이 아직 밝혀지지 않았어요. </span>
      귀한 원료인 만큼 다른 프로폴리스에 비해 가격이 비싸다는 점도 생각해 보면 좋을 것 같아요!
    </div>
  </div>
  <hr class="mt-5 my-hr">
  <div class="mt-5">
    <img src="resources/images/magazine_images/04/02_IMG.png" class="img-fluid">
  </div>
  <div class="paragraph">
    <div class="mt-5">
      프로폴리스는 일반적으로 부작용이 없어 꾸준히 섭취할 수 있는 영양제예요.
      하지만 프로폴리스가 꿀로 만들어진 성분이기 때문에 <span class="highLight">꿀 알레르기가 있는 분들은 주의가 필요해요. </span>
      또한 벌이 프로폴리스를 생산하는 과정에서 꽃가루가 섞일 수 있어서 <span class="highLight">꽃가루나 식물에 알레르기가 있는 사람은 알레르기 반응이 나타날 수 있습니다.</span>
    </div>
    <div class="mt-5">
      평소 알레르기가 있는 분들은 주의가 필요하고, 알레르기가 없던 분이더라도 먹고 나서 두드러기와 같은 알레르기 반응이 나타나면 복용을 중단해 주세요!
    </div>
  </div>
  <hr class="mt-5 my-hr">
</div>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
