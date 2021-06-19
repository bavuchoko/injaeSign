package com.example.demo.vo;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

import java.util.List;

@Alias("DocVO")
@Data
public class DocumentVO {
    private int d_num, s_num, status;
    private String grade, title, d_code, department_name, content, d_name, name, image;
    private Date reg_date, end_date;
    private int nextap;
    private String files;
    private List<ProcessLineVO> process_line;
    private MultipartFile target;
    private List<UserVO> users;
    
    //뷰페이지에서 넘겨줘야되는 변수
    // d_num, s_num
    //grade : 직급
    //department_name : 부서명(한글)
    //title:제목
    //d_code: 문서타입
    //content: 텍스트에어리어
    //target:업로드 파일
    //process_line : 결재라인
    //orders : 결제순서
    //

}

