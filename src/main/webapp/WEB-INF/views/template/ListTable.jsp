<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .link-detail {
        opacity: 0.7; /*투명도 속성*/
    }
    .link-detail:hover {
        opacity: 1;
    }
</style>
<div class="container mt-1">
    <c:if test="${empty listData}" var="listIsEmpty">
        등록된 제품이 없습니다
    </c:if>
    <c:if test="${not listIsEmpty}">
    <c:forEach var="record" items="${listData}" varStatus="loop">
        <c:if test="${loop.count % 3 == 1}">
        <div class="row">
        </c:if>
            <div class="card mt-5 ml-5" style="width: 18rem">
                <img src="test.jpg" alt="" class="card-img-top pt-3">
                <div class="card-body">
                    <h1 class="card-title">${record.name}</h1>
                    <p class="card-text">상품 요약</p>
                </div>
                <div class="card-footer">
                    <a href='/detail.do?no=${record.no}' class="btn link-detail btn-outline-info">상품 보러 가기!</a>
                </div>
            </div>
        <c:if test="${loop.count % 3 == 0}">
            </div>
        </c:if>
    </c:forEach>
    </c:if>
</div>