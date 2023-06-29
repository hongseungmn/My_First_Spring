<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    body {
        background-color: #fff;
        margin: 0;
    }

    #drawing_canvas {
        position: absolute;
        margin: auto;
        width: 512px;
        height: 350px;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }
</style>
<div class="container">
    <h3 class="m-5 display-4">당뇨병 수치 예측하기</h3>
    <div class="row">
        <div class="col-6">
            <form id="personInfoForm" class="validation-form" novalidate>
                <div class="col mb-3">
                    <strong>연령</strong>
                    <input type="text" class="form-control" id="age" placeholder="연령을 입력해주세요" value="" required>
                    <div class="invalid-feedback">
                        연령을 입력해주세요.
                    </div>
                </div>
                <div class="col mb-3">
                    <strong>BMI</strong>
                    <input type="text" class="form-control" id="bmi" placeholder="체질량 지수를 입력해주세요" value="" required>
                    <div class="invalid-feedback">
                        체질량 지수를 입력해주세요
                    </div>
                </div>
                <div class="col mb-3">
                    <strong>성별</strong>
                    <div class="custom-control custom-radio">
                        <input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
                        <label class="custom-control-label" for="jb-radio-1">남자</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
                        <label class="custom-control-label" for="jb-radio-2">여자</label>
                    </div>
                </div>
                <div class="col mb-3">
                    <strong>포도당</strong>
                    <input type="text" class="form-control" id="glucose" placeholder="포도당 수치를 입력해주세요" value="" required>
                    <div class="invalid-feedback">
                        포도당 수치를 입력해주세요
                    </div>
                </div>
                <div class="col mb-3">
                    <strong>혈압</strong>
                    <input type="text" class="form-control" id="bloodpress" placeholder="혈압수치를 입력해주세요" value="" required>
                    <div class="invalid-feedback">
                        혈압수치를 입력해주세요
                    </div>
                </div>
                <div class="col mb-3">
                    <strong>인슐린</strong>
                    <input type="text" class="form-control" id="insulin" placeholder="인슐린 수치를 입력해주세요" value="" required>
                    <div class="invalid-feedback">
                        인슐린 수치를 입력해주세요
                    </div>
                </div>
                <div class="col mb-3">
                    <strong>삼두근 피부 두께</strong>
                    <input type="text" class="form-control" id="skin" placeholder="삼두근 피부 두께를 입력해주세요" value="" required>
                    <div class="invalid-feedback">
                        삼두근 피부 두께를 입력해주세요
                    </div>
                </div>
                <div class="col mb-3">
                    <strong>임신횟수</strong>
                    <input type="text" class="form-control" id="preg" placeholder="임신횟수를 입력해주세요" value="" required>
                    <div class="invalid-feedback">
                        임신횟수를 입력해주세요
                    </div>
                </div>
                <hr class="mb-4">
                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block" type="submit">예측해보기</button>
            </form>
        </div>

        <div class="col-6">
            <span class="model-score display-4"><strong>현재 머신러닝의 <br>예측 정확도는<br> <kbd>70%</kbd> 입니다</strong></span>
            <canvas id="drawing_canvas"></canvas>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#personInfoForm').submit(function (event) {
            event.preventDefault();
            event.stopImmediatePropagation();

            var forms = document.getElementsByClassName('validation-form');

            Array.prototype.filter.call(forms, (form) => {
                if (form.checkValidity() === false) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: '다시한번 확인해 주세요!',
                    });
                } else {
                    var age = $('#age').val();
                    var bmi = $('#bmi').val();
                    var glucose = $('#glucose').val();
                    var bloodpress = $('#bloodpress').val();
                    var insulin = $('#insulin').val();
                    var skin = $('#skin').val();
                    var preg = $('#preg').val();
                    $('.model-score').hide();
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'center-center',
                        showConfirmButton: false,
                        timer: 1500,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    });
                    Toast.fire({
                        icon: 'success',
                        title: '모델이 예측 중입니다'
                    });
                    setTimeout(function () {
                        $.ajax({
                            type: 'POST',
                            url: 'http://127.0.0.1/model',
                            data: {
                                "age": age,
                                "bmi": bmi,
                                "glucose": glucose,
                                "bloodpress": bloodpress,
                                "insulin": insulin,
                                "skin": skin,
                                "preg": preg,
                            },
                            success: function (response) {
                                console.log(response);
                                console.log(response[1][0][1],typeof response[1][0][1])
                                initDrawingCanvas((response[1][0][1]*100).toFixed(1));
                                requestAnimationFrame(loop);

                            }
                        });
                    }, 1500);
                }
                form.classList.add('was-validated');
            });
        });
    });
    const TWO_PI = Math.PI * 2;
    const HALF_PI = Math.PI * 0.5;

    // canvas settings
    var viewWidth = 512,
        viewHeight = 350,
        drawingCanvas = document.getElementById("drawing_canvas"),
        ctx,
        timeStep = (1/60),
        textValue;

    Point = function(x, y) {
        this.x = x || 0;
        this.y = y || 0;
    };

    Particle = function(p0, p1, p2, p3) {
        this.p0 = p0;
        this.p1 = p1;
        this.p2 = p2;
        this.p3 = p3;

        this.time = 0;
        this.duration = 3 + Math.random() * 2;
        this.color =  '#' + Math.floor((Math.random() * 0xffffff)).toString(16);

        this.w = 8;
        this.h = 6;

        this.complete = false;
    };

    Particle.prototype = {
        update:function() {
            this.time = Math.min(this.duration, this.time + timeStep);

            var f = Ease.outCubic(this.time, 0, 1, this.duration);
            var p = cubeBezier(this.p0, this.p1, this.p2, this.p3, f);

            var dx = p.x - this.x;
            var dy = p.y - this.y;

            this.r =  Math.atan2(dy, dx) + HALF_PI;
            this.sy = Math.sin(Math.PI * f * 10);
            this.x = p.x;
            this.y = p.y;

            this.complete = this.time === this.duration;
        },
        draw:function() {
            ctx.save();
            ctx.translate(this.x, this.y);
            ctx.rotate(this.r);
            ctx.scale(1, this.sy);

            ctx.fillStyle = this.color;
            ctx.fillRect(-this.w * 0.5, -this.h * 0.5, this.w, this.h);

            ctx.restore();
        }
    };

    Loader = function(x, y) {
        this.x = x;
        this.y = y;

        this.r = 24;
        this._progress = 0;

        this.complete = false;
    };

    Loader.prototype = {
        reset:function() {
            this._progress = 0;
            this.complete = false;
        },
        set progress(p) {
            this._progress = p < 0 ? 0 : (p > 1 ? 1 : p);

            this.complete = this._progress === 1;
        },
        get progress() {
            return this._progress;
        },
        draw:function() {
            ctx.fillStyle = '#000';
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.r, -HALF_PI, TWO_PI * this._progress - HALF_PI);
            ctx.lineTo(this.x, this.y);
            ctx.closePath();
            ctx.fill();
        }
    };

    // pun intended
    Exploader = function(x, y) {
        this.x = x;
        this.y = y;

        this.startRadius = 24;

        this.time = 0;
        this.duration = 0.4;
        this.progress = 0;

        this.complete = false;
    };

    Exploader.prototype = {
        reset:function() {
            this.time = 0;
            this.progress = 0;
            this.complete = false;
        },
        update:function() {
            this.time = Math.min(this.duration, this.time + timeStep);
            this.progress = Ease.inBack(this.time, 0, 1, this.duration);

            this.complete = this.time === this.duration;
        },
        draw:function() {
            ctx.fillStyle = '#000';
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.startRadius * (1 - this.progress), 0, TWO_PI);
            ctx.fill();
        }
    };

    var particles = [],
        loader,
        exploader,
        phase = 0;

    function initDrawingCanvas(data) {
        drawingCanvas.width = viewWidth;
        drawingCanvas.height = viewHeight;
        ctx = drawingCanvas.getContext('2d');
        textValue = data;
        createLoader();
        createExploader();
        createParticles();
    }

    function createLoader() {
        loader = new Loader(viewWidth * 0.5, viewHeight * 0.5);
    }

    function createExploader() {
        exploader = new Exploader(viewWidth * 0.5, viewHeight * 0.5);
    }

    function createParticles() {
        for (var i = 0; i < 128; i++) {
            var p0 = new Point(viewWidth * 0.5, viewHeight * 0.5);
            var p1 = new Point(Math.random() * viewWidth, Math.random() * viewHeight);
            var p2 = new Point(Math.random() * viewWidth, Math.random() * viewHeight);
            var p3 = new Point(Math.random() * viewWidth, viewHeight + 64);

            particles.push(new Particle(p0, p1, p2, p3));
        }
    }

    function update() {

        switch (phase) {
            case 0:
                loader.progress += (1/45);
                break;
            case 1:
                exploader.update();
                break;
            case 2:
                particles.forEach(function(p) {
                    p.update();
                });
                break;
        }
    }

    function draw() {
        ctx.clearRect(0, 0, viewWidth, viewHeight);

        switch (phase) {
            case 0:
                loader.draw();
                break;
            case 1:
                exploader.draw();
                break;
            case 2:
                particles.forEach(function(p) {
                    p.draw();
                });
                ctx.font = "bold 40px sans-serif";
                ctx.fillText('발병 확률은 : '+textValue+'%', viewWidth/4, viewHeight/2);
                break;
        }
    }



    function loop() {
        update();
        draw();

        if (phase === 0 && loader.complete) {
            phase = 1;
        }
        else if (phase === 1 && exploader.complete) {
            phase = 2;
        }
        else if (phase === 2 && checkParticlesComplete()) {
            // reset
            //phase = 0;
            //loader.reset();
            //exploader.reset();
            //particles.length = 0;
            //createParticles();
            return;
        }

        requestAnimationFrame(loop);
    }

    function checkParticlesComplete() {
        for (var i = 0; i < particles.length; i++) {
            if (particles[i].complete === false) return false;
        }
        return true;
    }

    // math and stuff

    /**
     * easing equations from http://gizma.com/easing/
     * t = current time
     * b = start value
     * c = delta value
     * d = duration
     */
    var Ease = {
        inCubic:function (t, b, c, d) {
            t /= d;
            return c*t*t*t + b;
        },
        outCubic:function(t, b, c, d) {
            t /= d;
            t--;
            return c*(t*t*t + 1) + b;
        },
        inOutCubic:function(t, b, c, d) {
            t /= d/2;
            if (t < 1) return c/2*t*t*t + b;
            t -= 2;
            return c/2*(t*t*t + 2) + b;
        },
        inBack: function (t, b, c, d, s) {
            s = s || 1.70158;
            return c*(t/=d)*t*((s+1)*t - s) + b;
        }
    };

    function cubeBezier(p0, c0, c1, p1, t) {
        var p = new Point();
        var nt = (1 - t);

        p.x = nt * nt * nt * p0.x + 3 * nt * nt * t * c0.x + 3 * nt * t * t * c1.x + t * t * t * p1.x;
        p.y = nt * nt * nt * p0.y + 3 * nt * nt * t * c0.y + 3 * nt * t * t * c1.y + t * t * t * p1.y;

        return p;
    }
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>