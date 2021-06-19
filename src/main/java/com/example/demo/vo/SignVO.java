package com.example.demo.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("SignVO")
@Data
public class SignVO {
   private int s_num;
   private String sign;
   private int ai_num;
   private String sign_path;
   private String stamp;
}