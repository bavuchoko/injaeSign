package com.example.demo.vo;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.util.Date;


@Alias("PlVO")
@Getter
@Setter
public class ProcessLineVO {
    private int pl_num, d_num, status, s_num;
    private String sign, p_image, p_name, p_department, p_grade;
    private Date confirm_date;
    private int orders;
    private int p_s_num;
    private String signiture, list;

}
