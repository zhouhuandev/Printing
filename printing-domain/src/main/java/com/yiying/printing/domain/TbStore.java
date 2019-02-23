package com.yiying.printing.domain;

import com.yiying.printing.commons.persistence.BaseEntity;
import lombok.Data;

/**
 * 店铺实体类
 *
 * @Title:TbStore
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/2/23 14:23
 */
@Data
public class TbStore extends BaseEntity {
    //店铺名
    private String name;
    //地址
    private String address;
    //店铺照片
    private String imgUrl;
    //联系电话
    private String tel;
    //店主
    private String shopman;
    //打印数量
    private Long number;
    //是否删除
    private Boolean isDelete;




}
