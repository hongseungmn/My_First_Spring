<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<jsp:include page="/WEB-INF/views/template/Modal.jsp"/>
<div class="container mt-5">
    <div class="ml-5">
        <form action="/hashtag.do" method="post">
            <input name='postTag' placeholder="#해시태그">
            <input name="searchTags" type="hidden" id="hiddenInput">
            <button type="submit" class="btn btn-primary ml-3">검색</button>
        </form>
    </div>
    <div class="ml-5">
        <a href="#" style="font-style:italic;font-weight: bold;color:palevioletred">#20대</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:mediumpurple ">#인기많은</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:sandybrown">#요즘 인기상품</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:salmon ">#비타민</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:lightskyblue ">#오메가3</a>&nbsp;
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

// initialize Tagify on the above input node reference
var tagify = new Tagify(input)
tagify.on('input', e => console.log(e.detail));
$('a').click(function() {
    tagify.addTags([{value:$(this).html(), style:"--tag-bg:"+$(this).css('color')}]);
});
tagify.on('add', e=> {
    var data = $('#hiddenInput').attr('value')===undefined ? '': $('#hiddenInput').attr('value');
    $('#hiddenInput').attr('value','#'+data+e.detail.data.value);
});
</script>
<jsp:include page="/WEB-INF/views/template/ListTable.jsp"/>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>