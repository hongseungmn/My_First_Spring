<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="LoginModal">
    <div class="modal-dialog modal modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header justify-content-center">
                <h5 class="modal-title mt-2">로그인</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form-inline justify-content-center needs-validation " action="login/loginProcess.do" method="post" novalidate >
                    <div class="d-flex flex-wrap mt-2">
                        <label for="UserPassword" class="mr-2">아이디</label>
                        <div class="d-flex">
                            <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="userId" name="id" autoComplete="off" required>
                            <div class="invalid-feedback">아이디를 입력하세요.</div>
                        </div>
                    </div>

                    <div class="d-flex flex-wrap mt-2">
                        <label for="UserPassword" class="mr-2">비밀번호</label>
                        <div class="d-flex flex-wrap">
                            <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="userPassword" name="pwd" autoComplete="off" required>
                            <div class="invalid-feedback">비밀번호를 입력하세요.</div>
                        </div>
                    </div>
                    <div class="flex-wrap mt-2 justify-content-around">
                        <button id="loginButton" type="submit" class="btn btn-primary">로그인</button>
                        <button id="joinButton" type="submit" class="btn btn-light border">회원가입</button>
                        <button id="kakaoButton" type="submit" class="btn btn-warning">카카오 로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    var form = document.forms[0];
    form.onsubmit= function(e) {
        if(!form.checkValidity()) {
            form.classList.add('was-validated');
            return false
        }
        return true;
    }
</script>
