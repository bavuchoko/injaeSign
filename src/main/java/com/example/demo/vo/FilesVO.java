package com.example.demo.vo;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("FileVO")
public class FilesVO {
    public int d_num;
    public String file_name;
}
