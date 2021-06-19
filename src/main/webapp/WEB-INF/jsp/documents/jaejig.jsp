<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/contract.css">
</head>
<body>
    <article class="Collection_of_personal_information_contract">
        
        <div class="text-center mb-30">
            <h1 class="con-title">재직 증명서</h1>
            <span class="con-description">(본 계약서는 인재 싸인에서 제공하는 샘플 계약서 입니다.)</span>
        </div>
        
        <div>
            <table border="1px solid #dbdbdb">
                
                <tr>
                    <th rowspan="2" width="10%">인적사항</th>
                    <th width="10%">성명</th>
                    <td width="26%"><input type="text" style="text-align: left; width: 100%;" class="border-outline-none"></td>
                    <th width="10%">주민등록번호</th>
                    <td width="34%"><input type="text" class="text-w100 border-outline-none" style="text-align: right;"> - <input type="text" class="text-w100 border-outline-none"></td>
                </tr>

                <tr>
                    <th>주소</th>
                    <td colspan="3" style="text-align: left;"><input type="text" style="width:100%;" class="border-outline-none"></td>
                </tr>

                <tr>
                    <th rowspan="3">재직사항</th>

                    <th>소속</th>
                    <td colspan="3" style="text-align: left;"><input type="text" style="width:100%;" class="border-outline-none"></td>
                </tr>

                <tr>
                    <th>직위</th>
                    <td colspan="3">
                        <input type="text" style="text-align: left; width: 100%;" class="border-outline-none">
                       
                    </td>
                </tr>

                <tr>
                    <th>재직기간</th>
                    <td colspan="3">
                        <input type="text" class="text-w50 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">년&nbsp;
                        <input type="text" class="text-w50 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">월&nbsp;
                        <input type="text" class="text-w50 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">일&nbsp;~&nbsp;

                        <input type="text" class="text-w50 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">년&nbsp;
                        <input type="text" class="text-w50 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">월&nbsp;
                        <input type="text" class="text-w50 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">일&nbsp;
                    </td>
                </tr>

                <tr>
                    <th colspan="2">용도</th>
                    <td colspan="3" style="text-align: left;"><input type="text" style="width: 100%;" class="border-outline-none"></td>
                </tr>

                <tr class="table-body">
                    <td colspan="5">
                        <div>위와 같이 재직을 증명합니다</div>
                        <div>
                            <input type="text" class="text-w50 border-outline-none" style="text-align: right; border-bottom: 1px solid #dbdbdb;">년&nbsp;
                            <input type="text" class="text-w50 border-outline-none" style="text-align: right; border-bottom: 1px solid #dbdbdb;">월&nbsp;
                            <input type="text" class="text-w50 border-outline-none" style="text-align: right; border-bottom: 1px solid #dbdbdb">일
                        </div>
                        <div><span class="inline-w120">업체명:</span><input type="text" class="text-w150"></div>
                        <div><span class="inline-w120">사업자등록번호:</span><input type="text" class="text-w150"></div>
                        <div class="signBox">
                            <span class="inline-w120 mb-80">대표자명:</span><input type="text" class="text-w150">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)
                            <img src="../images/sign.png" alt="sign">
                        </div>

                    </td>
                </tr>
            </table>
        </div>
    </article>
</body>
</html>