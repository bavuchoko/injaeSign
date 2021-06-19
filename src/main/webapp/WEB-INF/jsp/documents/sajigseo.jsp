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
    <article class="Resignation_contract">

        <div class="text-center mb-30">
            <h1 class="con-title">사직서</h1>
            <span class="con-description">(본 계약서는 인재 싸인에서 제공하는 샘플 계약서 입니다.)</span>
        </div>

        <div>
            <table border="1px solid #dbdbdb">

                <tr>
                    <th width="10%" style="text-align: center;">회사</th>
                    <td width="40%" style="text-align: center;"><input type="text" class="border-outline-none" style="width: 100%;"></td>
                    <th width="10%" style="text-align: center;">직위</th>
                    <td width="40%" style="text-align: center;"><input type="text" class="border-outline-none" style="width: 100%;"></td>
                </tr>

                <tr>
                    <th style="text-align: center;">성명</th>
                    <td><input type="text" class="border-outline-none" style="width: 100%;"></td>
                    <th style="text-align: center;">생년월일</th>
                    <td>
                        <input type="text" class="border-outline-none" style="width: 100%;">
                    </td>
                </tr>

                <tr>
                    <th style="text-align: center;">입사일</th>
                    <td>
                        <input type="text" class="border-outline-none" style="width: 100%;">
                    </td>
                    <th style="text-align: center;">주민등록번호</th>
                    <td>
                        <input type="text" class="text-w100 border-outline-none" style="text-align: right;"> - <input type="text" class="text-w100 border-outline-none">
                    </td>
                </tr>

                <tr>
                    <th style="text-align: center;">주소</th>
                    <td colspan="3"><input type="text" class="border-outline-none" style="width: 100%;"></td>
                </tr>

                <tr>
                    <td colspan="4">
                        <div class="">
                            상기 본인은 <input type="text">년 <input type="text">월
                            <input type="text">일<br>부로 사직하고자 이에 사직서를 제출합니다.
                        </div>
                    </td>
                </tr>

            </table>
        </div>
    </article>
</body>
</html>