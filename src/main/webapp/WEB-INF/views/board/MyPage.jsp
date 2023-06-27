<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    body {
        min-height: 100vh;

        background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
        background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
        max-width: 680px;

        margin-top: 80px;
        padding: 32px;

        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
</style>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">회원 정보 수정</h4>
            <form class="validation-form" action="/Edit.do" method="post" novalidate>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="id">이름</label>
                        <input type="text" name="id" class="form-control" id="id" placeholder="" value="${UserInfo.id}" required>
                        <div class="invalid-feedback">
                            이름을 입력해주세요.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="nickname">별명</label>
                        <input type="text" class="form-control" name="nickname" id="nickname" placeholder="" value="${UserInfo.nickname}" required>
                        <div class="invalid-feedback">
                            별명을 입력해주세요.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" value="${UserInfo.email}" required>
                    <div class="invalid-feedback">
                        이메일을 입력해주세요.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="address">주소</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="서울특별시 강남구" value="${UserInfo.address}" required>
                    <div class="invalid-feedback">
                        주소를 입력해주세요.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
                    <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
                </div>


                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="aggrement" required>
                    <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
                </div>
                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
            </form>
        </div>
    </div>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2021 YD</p>
    </footer>
</div>
<script>
    /*window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {

                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                else{
                    Swal.fire({
                        title: 'Good job!',
                        text: 'You clicked the button!',
                        icon: 'success',
                        showConfirmButton: false
                    });
                    setTimeout(function() {
                        form.submit();  // 3초 후에 form 전송
                    }, 3000);
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
    */

    window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: '다시한번 확인해 주세요!',
                    });
                } else {
                    event.preventDefault();  // 기본 동작 막기
                    event.stopImmediatePropagation();  // 이벤트 전파 중지
                    Swal.fire({
                        title: 'Good job!',
                        text: '수정되었습니다!',
                        icon: 'success',
                        showConfirmButton: false
                    });
                    setTimeout(function() {
                        form.submit();  // 3초 후에 form 전송
                    }, 1500);
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
</script>

<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
