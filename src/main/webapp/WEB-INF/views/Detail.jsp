<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Header.jsp"/>
<style>
    table.type09 {
        border-collapse: collapse;
        text-align: left;
        line-height: 1.5;

    }
    table.type09 thead th {
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        color: #369;
        border-bottom: 3px solid #036;
    }
    table.type09 tbody th {
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
        background: #f3f6f7;
    }
    table.type09 td {
        width: 600px;
        padding: 15px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }
</style>

<div class="container">
    <div class="row no-gutters">
        <h1 class="display-4 mt-5" style="background-color: lightsteelblue;width:100%">${listOne.productName}</h1>
        <div class="col-8">

            <table class="type09 mt-3">
                <thead>
                <tr>
                    <th scope="cols">타이틀</th>
                    <th scope="cols">내용</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">회사명</th>
                    <td>${listOne.marketName}</td>
                </tr>
                <tr>
                    <th scope="row">등록번호</th>
                    <td>${listOne.postNo}</td>
                </tr>
                <tr>
                    <th scope="row">등록날짜</th>
                    <td>${listOne.postDate}</td>
                </tr>
                <tr>
                    <th scope="row">유통기한</th>
                    <td>${listOne.expirationDate}</td>
                </tr>
                <tr>
                    <th scope="row">설명</th>
                    <td>${listOne.data}</td>
                </tr>
                <tr>
                    <th scope="row">복용방법</th>
                    <td>${listOne.intake}</td>
                </tr>
                <tr>
                    <th scope="row">보관용기</th>
                    <td>${listOne.packageWay}</td>
                </tr>
                <tr>
                    <th scope="row">보관방법</th>
                    <td>${listOne.preservation}</td>
                </tr>
                <tr>
                    <th scope="row">주의사항</th>
                    <td>${listOne.caution}</td>
                </tr>
                <tr>
                    <th scope="row">성분</th>
                    <td>${listOne.otherText}</td>
                </tr>
                <tr>
                    <th scope="row">상세</th>
                    <td>${listOne.standard}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-2">
            <div class="container-fluid m-5">
                <div style="width:400px;height:400px;">
                    <canvas id="line-chart" width="200" height="250"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var dataset = [];
    $(function() {
        $.ajax({
            url : '<c:url value="/LineGraphArray.do"/>',
            dataType: 'json',
            method : 'post',
            contentType : 'application/json',
            data : JSON.stringify( {productNo : '${listOne.no}'}),
        }).done(function(data) {
            console.log(data);
            new Chart(document.getElementById('line-chart'), {
                type : 'line',
                data : {
                    labels : data['dateList'].map(function(date) {
                        return new Date(date).toLocaleDateString();
                    }),
                    datasets : [{
                        data : data['hitList'],
                        label : "일별 조회수",
                        borderColor : "#3e95cd",
                        fill : true,
                        pointStyle : 'circle',
                        pointRadius : 10,
                        pointHoverRadius : 15,
                    }]},
                options : {
                    title : {
                        display : true,
                        text : '제품 일별 조회수',
                    }
                }
            });
        });
    });

</script>


<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
