<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<jsp:include page="/WEB-INF/views/template/Modal.jsp"/>
<div>
<input name='basic'>
</div>
<a href="#" style="font-style:italic;font-weight: bold;">#20대</a>&nbsp;
<a href="#" style="font-style:italic;font-weight: bold;">#인기많은</a>&nbsp;
<a href="#" style="font-style:italic;font-weight: bold;">#요즘 인기상품</a>&nbsp;
<a href="#" style="font-style:italic;font-weight: bold;">#비타민</a>&nbsp;
<a href="#" style="font-style:italic;font-weight: bold;">#오메가3</a>&nbsp;
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
    tagify.addTags([{value:$(this).html(), style:"--tag-bg:"+getRandomColor()}]);
});
function getRandomColor() {
    return "#"+Math.floor(Math.random() * 16777215).toString(16);
}
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>