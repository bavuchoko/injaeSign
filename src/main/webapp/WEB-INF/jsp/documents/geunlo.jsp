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
    <article class="standard_labor_contract">

        <div>
            <h1>근로계약서</h1>
            <span>(본 계약서는 인재 싸인에서 제공하는 샘플 계약서 입니다.)</span>
        </div>

        <div>
            <input type="text" name="gap" class="text-w100">
            (이하 '갑'이라 함)와 근로자
            <input type="text" name="eul" class="text-w100">
            (이하 '을'이라 함)는(은) 다음<br>
            과 같이 근로계약을 체결하고 이를 성실히 이행할 것을 약정한다.

        </div>

        <div>
            <h4>제 1조 [계약기간]</h4>
            <div class="text-indent">
                가. 근로계약 기간은&nbsp;
                <input type="text" name="start_year" class="text-w50 border-outline-none" style="border-bottom:1px solid #dbdbdb;">년&nbsp;
                <input type="text" name="start_month" class="text-w30 border-outline-none" style="border-bottom:1px solid #dbdbdb;">월&nbsp;
                <input type="text" name="start_day" class="text-w30 border-outline-none" style="border-bottom:1px solid #dbdbdb;">일
                부터&nbsp;
                <input type="text" name="year" class="text-w50 border-outline-none" style="border-bottom:1px solid #dbdbdb;">년&nbsp;
                <input type="text" name="month" class="text-w30 border-outline-none" style="border-bottom:1px solid #dbdbdb;">월&nbsp;
                <input type="text" name="day" class="text-w30 border-outline-none" style="border-bottom:1px solid #dbdbdb;">일&nbsp;
                까지로한다
            </div>
           
        </div>

        <div>
            <h4>제 2조 [근무 장소 및 업무 내용]</h4>
            <div class="text-indent">
                <div class="mb-10">가. 근무 장소:&nbsp;&nbsp;<input type="text" class="text-w450"></div>
                <div class="mb-10">나. 업무 내용:&nbsp;&nbsp;<input type="text" class="text-w450"></div>
                <div>다. 갑은 필요한 경우 '을'의 근무 장소 및 업무를 변경할 수 있다.</div>
            </div>
        </div>

        <div>
            <h4>제 3조 [근로시간 및 휴게시간]</h4>
            <div class="text-indent">
                <div class="mb-10">가. 근로시간: <input type="text" class="text-w100"></div>
                <div>나. 휴게시간: <input type="text" class="text-w100"></div>
            </div>
        </div>

        <div>
            <h4>제 4조 [임금]</h4>
            <div class="text-indent">
                <div class="mb-10"><span class="inline-w120">가. 계약 연봉 총액:</span> <input type="text" class="text-w150"></div>
                <div><span class="inline-w120">나. 월 지급액:</span> <input type="text" class="text-w150"></div>
            </div>
        </div>

        <div>
            <input type="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="vertical-align:top;">본인은 근로계약조건 및 관련 규정에 대해 확인 및 체결 후 문서를 교부 받았습니다.</span>
        </div>

        <div class="row">

            <div class="col-md-6">
                <div class="mb-10"><span class="inline-w50">'갑'</span><input type="text" class="text-w150"></div>
                <div class="mb-10"><span class="inline-w50">회사명:</span><input type="text" class="text-w150"></div>
                <div class="signBox">
                    <span class="inline-w50">대표자:</span><input type="text" class="text-w150">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)
                    <img src="../images/sign.png" alt="sign">
                </div>
                    

            </div>

            <div class="col-md-6">
                <div class="mb-10"><span class="inline-w50">'을'</span><input type="text" class="text-w150"></div>
                <div class="mb-10"><span class="inline-w50">연락처: </span><input type="text" class="text-w150"></div>
                <div class="signBox">
                    <span class="inline-w50">성 명:</span><input type="text" class="text-w150">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)
                    <img src="../images/sign.png" alt="sign">
                </div>
            </div>
        </div>
    </article>
</body>
</html>