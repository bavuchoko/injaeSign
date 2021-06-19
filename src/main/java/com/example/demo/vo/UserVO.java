package com.example.demo.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("UserVO")
@Data
public class UserVO {
		private int s_num;
		private String pw;
		private String department_name;
		private String name;
		private String auth;
		private String department_code;
		private String grade;
		private String reg_date;
		private String birth;
		private String zip_code;
		private String address;
		private String address_detail;
		private String image;
		private String phone;
		private String email;
		private String u_image;
		private String u_name;
		private String u_department;
		private String u_grade;
		private String u_status;
		private String stamp;
		private String signiture;
}
