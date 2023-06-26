<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<jsp:include page="/WEB-INF/views/template/Modal.jsp"/>
<div class="container mt-5">
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

</script>
<jsp:include page="/WEB-INF/views/template/ListTable.jsp"/>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>