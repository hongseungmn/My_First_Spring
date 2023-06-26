<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<div class="container">
    <h4 class="m-5">당뇨병 수치 예측하기</h4>
    <!--<form class="validation-form" novalidate action="http://127.0.0.1/model"
          method="post" enctype="application/x-www-form-urlencoded">
        <label for="data"></label>
        <input type="text" class="form-control" id="data" name="data" placeholder="" value="" required>
        <div class="col-md-6 mb-3">
            <label for="age">연령</label>
            <input type="text" class="form-control" id="age" placeholder="" value="" required>
            <div class="invalid-feedback">
                연령을 입력해주세요.
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <p><strong>성별</strong></p>
            <div class="custom-control custom-radio">
                <input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
                <label class="custom-control-label" for="jb-radio-1">남자</label>
            </div>
            <div class="custom-control custom-radio">
                <input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
                <label class="custom-control-label" for="jb-radio-2">여자</label>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="preg">임신횟수</label>
            <input type="text" class="form-control" id="preg" placeholder="임신횟수를 입력해주세요" value="" required>
            <div class="invalid-feedback">
                임신횟수를 입력해주세요
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="glucose">포도당</label>
            <input type="text" class="form-control" id="glucose" placeholder="포도당 수치,혈압, 삼두근 피부 두께, 2시간 혈청 인슐린, 체질량 지수를 입력해주세요(구분자 ,)" value="" required>
            <div class="invalid-feedback">
                포도당 수치,혈압, 삼두근 피부 두께, 2시간 혈청 인슐린, 체질량 지수를 입력해주세요(구분자 ,)
            </div>
        </div>
        <hr class="mb-4">
        <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
        </div>
        <div class="mb-4"></div>
        <button class="btn btn-primary btn-lg btn-block" type="submit">예측해보기</button>
    </form>-->
    <form id="my-form" class="validation-form" novalidate>
        <label for="data"></label>
        <input type="text" class="form-control" id="data" name="data" placeholder="" value="" required>
        <button class="btn btn-primary" type="submit">제출</button>
    </form>
    <h1 class="display-4">당신의 점수는 </h1>
    <kbd id="score"></kbd>
</div>
<script>
    $(document).ready(function() {
        $('#my-form').submit(function(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            var formData = $(this).serialize(); // 폼 데이터 직렬화
            $.ajax({
                type: 'POST',
                url: 'http://127.0.0.1/model',
                data: formData,
                success: function(response) {
                    // 성공적으로 요청을 보냈을 때 실행할 코드
                    console.log(response);
                    console.log(response[1][0]);
                    var x = response[1][0];
                    console.log(x[0]);
                    console.log(x[1]);
                    $('#score').html(x[0]);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패했을 때 실행할 코드
                    console.error(error);
                }
            });
        });
    });
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>