<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<jsp:include page="/WEB-INF/views/template/Modal.jsp"/>
<div class="container mt-5">
    <div>
        <input name='basic'><button class="btn btn-primary ml-3">검색</button>
    </div>
        <a href="#" style="font-style:italic;font-weight: bold;color:palevioletred">#20대</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:mediumpurple ">#인기많은</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:sandybrown">#요즘 인기상품</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:salmon ">#비타민</a>&nbsp;
        <a href="#" style="font-style:italic;font-weight: bold;color:lightskyblue ">#오메가3</a>&nbsp;
</div>
<style>
    .tagify {
        width: 80%;
    }
</style>
<script>
// The DOM element you wish to replace with Tagify
var input = document.querySelector('input[name=basic]');

// initialize Tagify on the above input node reference
var tagify = new Tagify(input)
tagify.on('input', e => console.log(e.detail));
$('a').click(function() {
    tagify.addTags([{value:$(this).html(), style:"--tag-bg:"+$(this).css('color')}]);
});
function getRandomColor() {
    return "#"+Math.floor(Math.random() * 16777215).toString(16);
}
</script>
<jsp:include page="/WEB-INF/views/template/ListTable.jsp"/>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>