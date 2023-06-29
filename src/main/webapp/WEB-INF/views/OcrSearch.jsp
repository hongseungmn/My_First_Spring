<%--
  Created by IntelliJ IDEA.
  User: hongseongmin
  Date: 6/28/23
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>Spring Rest API서버로 데이터 요청2(구글비젼 API-객체 탐지)</h4>
<button type="button" id="btnGoogleRestApi">이미지 비젼(구글-객체 탐지)</button>
<h4>Spring Rest API서버로 데이터 요청2(구글비젼 API-OCR)</h4>
<input type="file" name="files"/><br/>
<img id="preview" style="width:300px;height:200px"/>
<div style="position: relative;">
  <canvas id="canvas"></canvas>
  <div id="overlayDiv"></div>
</div>
<script>
  //12] 구글 객체 탐지 REST API 요청
  $('#btnGoogleRestApi').click(function() {
    $.ajax({
      url : "http://localhost:9090/vision/object-detect",
      dataType : 'json',
      contentType : "application/json",
      data : JSON.stringify({url : "https://mblogthumb-phinf.pstatic.net/MjAyMDA5MTVfMjU1/MDAxNjAwMTQ0NTgwODQ5.Xzg4IgMgS_KICETWPBJDTakHMZbeKklypzDq9dZSqcsg.ZecPWVI6L-zSRzMkOhq3KB4tVEQJQcjScInE89lJp1cg.JPEG.sz70000/1600144582220.jpg?type=w800",type:"TEXT_DETECTION"}),
      method : "post"
    }).done(function(data) {
      console.log(data);
      var texts = data.responses[0]['fullTextAnnotation'];
      console.log("%s",texts.text);
      var detectList = data.responses[0]['localizedObjectAnnotations'];
      $.each(detectList,function(index,item) {
        console.log("객체명 :%s, 정확도 :%s",item.name,item.score*100+"%");
      });
    });
  });

  //13]OCR
  //https://developer.mozilla.org/en-US/docs/Web/API/FileReader/readAsDataURL
  //https://developer.mozilla.org/ko/docs/Web/API/FormData/FormData
  $("input[name=files]").change(function(e) {
    var formData = new FormData(); //AJAX로 파일 업로드시 사용
    console.log("e.target.files : ",e.target.files);
    //append(첫번째 인자 파라미터명, 두번째 인자 File 객체)
    formData.append("files",e.target.files[0]);
    $.ajax({
      url : "http://localhost:9090/files",
      processData : false,
      contentType : false,
      data : formData,
      method : 'post'
    }).done(function(data){
      console.log("업로드 성공 : ",data);
      var reader = new FileReader();//이미지 파일을 Base54로 인코딩용
      reader.onload = function(e) {
        //이미지 미리보기
        $("#preview").attr("src",e.target.result);
        //Base64 인코딩
        var base64 = e.target.result;
        console.log(base64.split(",")[1]); //앞 data:image/png;base64 뒤에 부분(실제 base64로 인코딩된 부분)
        //여기서 Base64인코딩된 문자열을 스프링 REST API서버로 전송한다
        $.ajax({
          url : "http://localhost:9090/vision/ocr",
          method : "post",
          data : "base64="+ encodeURIComponent(base64.split(",")[1]),
          dataType : 'json'
        }).done(function(data) {
          console.log("구글 서버로부터 받은 데이터 : ",data);
          console.log(data['responses'][0]['fullTextAnnotation']['text']);
          var point = data['responses'][0]['fullTextAnnotation']['pages'][0]['blocks'];
          //console.log('%o',point);
          var canvas = document. getElementById ( "canvas" );
          var context = canvas.getContext( "2d" );
          var img = new Image (); //이미지 객체 생성
          img.src = e.target.result; //code.jpg라는 이미지 파일을 로딩 시작
          img.onload = function () {
            //(20,20)을 중심으로 100*100의 사이즈로 이미지를 그림
            canvas.width = img.width;
            canvas.height = img.height;
            context.drawImage(img,0,0);
            point.forEach(function(item) {
              context.strokeStyle = '#00ff00';
              context.lineWidth = 3;
              $('#overlayDiv').show();
              $('#overlayDiv').css('top',item['boundingBox']['vertices'][0]['y']);
              $('#overlayDiv').css('left',item['boundingBox']['vertices'][0]['x']);
              //console.log("item['paragraphs'].map(function(code) {return code['words']}) : ",item['paragraphs'].map(function(code) {return code['words']}))
              var paragraph =  '';
              item['paragraphs'].forEach(function(code) {
                code['words'].forEach(function(text) {
                  text['symbols'].forEach(function(last) {
                    paragraph += last['text'];
                  });
                });
              });
              let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
              let reg2 = /[a-zA-Z0-9]/gim;
              let resultData = paragraph.replace(reg, "");
              resultData = resultData.replace(reg2,"");
              console.log("resultData",resultData);

              var start_x = item['boundingBox']['vertices'][0]['x'];
              var start_y = item['boundingBox']['vertices'][0]['y'];
              var end_x = item['boundingBox']['vertices'][2]['x'] - item['boundingBox']['vertices'][0]['x'];
              var end_y =  item['boundingBox']['vertices'][3]['y']- item['boundingBox']['vertices'][0]['y'];
              context.strokeRect(start_x,start_y,end_x,end_y);
              $('#overlayDiv').css('width',end_x-start_x);
              $('#overlayDiv').css('height',end_y-start_y);
            });
          }

        });
      };

      //미리보기용
      reader.readAsDataURL(e.target.files[0]);
    });
  });
</script>
</body>
</html>
