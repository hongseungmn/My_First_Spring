<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<jsp:include page="/WEB-INF/views/template/Modal.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<div class="container mt-5">
    <div class="ml-5 mt-2 ">
        <i class="bi bi-camera"><a href="/modelOCR.do"> 사진으로 검색할래요 !!!</a></i>
    </div>
    <div class="ml-5">
        <form action="/hashtag.do" method="post">
            <input name='postTag' placeholder="#해시태그" value="${not empty searchTags ? fn:replace(searchTags,'#',',#') : ''}">
            <input name="searchTags" type="hidden" id="hiddenInput" value="">
            <button type="submit" class="btn btn-primary ml-3">검색</button>
        </form>
    </div>
    <div id="hashtaglink" class="ml-5">
        <a href="#" style="font-style:italic;font-weight: bold;color:palevioletred">#면역력 증진</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:mediumpurple ">#전립선 건강</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:sandybrown">#체지방 감소</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:salmon ">#비타민</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:lightskyblue ">#혈당</a>&nbsp;
    </div >
    <div class="m-5">
        <div class="slider1">
            <div class="slide"><a href="<c:url value="/magazine.do?no=01"/>"><img src="resources/images/thumbnail_img/RedM_Arg.jpg"></a></div>
            <div class="slide"><a href="<c:url value="/magazine.do?no=02"/>"><img src="resources/images/thumbnail_img/RedM_Col.jpg"></a></div>
            <div class="slide"><a href="<c:url value="/magazine.do?no=03"/>"><img src="resources/images/thumbnail_img/RedM_Hia.jpg"></a></div>
            <div class="slide"><a href="<c:url value="/magazine.do?no=04"/>"><img src="resources/images/thumbnail_img/RedM_Pro.jpg"></a></div>
            <div class="slide"><a href="<c:url value="/magazine.do?no=05"/>"><img src="resources/images/thumbnail_img/YellowM_Mus.jpg"></a></div>
        </div>
    </div>
</div>
<style>
    .tagify {
        width: 80%;
    }
</style>
<script>
// The DOM element you wish to replace with Tagify
var input = document.querySelector('input[name=postTag]');
var whitelist = ["#혈압","#당뇨","#면역력 증진","#전립선 건강","#체지방 감소","#피로개선","#혈당","#비타민","#오메가","#피부건강"];
// initialize Tagify on the above input node reference
var tagify = new Tagify(input,{
    enforceWhitelist: true,
    whitelist : whitelist
})
$('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
tagify.on('input', e => console.log(e.detail));
$('#hashtaglink a').click(function() {
    tagify.addTags([{value:$(this).html(), style:"--tag-bg:"+$(this).css('color')}]);
});
tagify.on('add', e=> {
    $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
});
tagify.on('remove', e=> {
    $('#hiddenInput').attr('value',tagify.value.map(function(e){return e.value}));
});

$(document).ready(function(){
    $('.slider1').bxSlider({
        slideWidth: 300,
        minSlides: 2,
        maxSlides: 3,
        slideMargin: 5,
        auto : true,
        stopAutoOnClick : true,
        pager : true,
    });
});

</script>
<jsp:include page="/WEB-INF/views/template/ListTable.jsp"/>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>