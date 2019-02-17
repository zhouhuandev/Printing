package com.yiying.printing.domain;

import com.yiying.printing.commons.persistence.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 打印历史记录实体类
 *
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 12:45
 */
@Data
public class TbOrder extends BaseEntity {
    //订单编号
    private String orderId;
    //取货姓名
    private String userName;
    //取货电话
    private String tel;
    //文件存储地址
    private String url;
    //原文件名
    private String fileName;
    //店铺 id
    private Long storeId;
    //是否双面打印
    private Boolean isTwoFace;
    //是否彩印
    private Boolean isColorPrinting;
    //数量
    private Long numberPrinting;
    //是否立取
    private Boolean isPickNow;
    //取货时间
    private Date pickTime;
    //后台打印用户
    private String byUser;
    //是否删除
    private Boolean isDelete;


}
