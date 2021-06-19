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
    <article class="Letter_Of_Approval_contract">

        <div class="text-center mb-30">
            <h1 class="con-title">품의서</h1>
            <span class="con-description">(본 계약서는 인재 싸인에서 제공하는 샘플 계약서 입니다.)</span>
        </div>

        <div>
            <table class="tableFirst" border="1px solid #dbdbdb">
                <tr>
                    <th width="10%" style="text-align: center;">소속</th>
                    <td width="40%"><input type="text" class="border-outline-none" style="width: 100%;"></td>
                    <th width="10%" style="text-align: center;">직급</th>
                    <td width="40%"><input type="text" class="border-outline-none" style="width: 100%;"></td>
                </tr>

                <tr>
                    <th style="text-align: center;">성명</th>
                    <td><input type="text" class="border-outline-none" style="width: 100%;"></td>
                    <th style="text-align: center;">작성일</th>
                    <td>
                        <input type="text" class="text-w50 border-outline-none" style="text-align: center; border-bottom: 1px solid #dbdbdb;">년&nbsp;
                        <input type="text" class="text-w50 border-outline-none" style="text-align: center; border-bottom: 1px solid #dbdbdb;">월&nbsp;
                        <input type="text" class="text-w50 border-outline-none" style="text-align: center; border-bottom: 1px solid #dbdbdb;">일
                    </td>
                </tr>

                <tr>
                    <th style="text-align: center;">제목</th>
                    <td colspan="3">
                        <input type="text" class="border-outline-none" style="width: 100%;">
                    </td>
                </tr>
            </table>
        </div>

        <div class="mt-30">
            <table class="tableSecond" border="1px solid #dbdbdb">
                <tr>
                    <th width="10%" style="text-align: center;">품의사유<br>및<br>상세내역</th>
                    <td width="90%"><textarea name=""></textarea></td>
                </tr>

                <tr>
                    <th style="text-align: center;">예상비용</th>
                    <td><input type="text" class="border-outline-none" style="width: 100%;"></td>
                </tr>

                <tr>
                    <th style="text-align: center;">비고</th>
                    <td><input type="text" class="border-outline-none" style="width: 100%;"></td>
                </tr>
            </table>
        </div>

        <div class="mt-30">
            위와 같은 사유로 품의서를 제출하오니 허가하여 주시기 바랍니다.
        </div>

        <div class="text-right mt-30">
            <input type="text" class="text-w50 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">년&nbsp;
            <input type="text" class="text-w30 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">월&nbsp;
            <input type="text" class="text-w30 border-outline-none" style="border-bottom: 1px solid #dbdbdb;">일
        </div>

        <div class="text-right mt-15 signBox">
            작성자
            <input type="text" class="text-w75">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)
            <img src="../images/sign.png" alt="sign">
        </div>
    </article>
</body>
</html>