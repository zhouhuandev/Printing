package com.yiying.printing.domain;

import com.yiying.printing.commons.persistence.BaseEntity;
import com.yiying.printing.commons.utils.RegexpUtils;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
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
    @Pattern(regexp = RegexpUtils.NAME, message = "请输入中文名或英文名，不包含特殊字符！")
    private String userName;
    //取货电话
    @Pattern(regexp = RegexpUtils.PHONE, message = "手机号格式不正确！")
    private String tel;
    //文件存储地址
    @Length(min = 21,message = "文件未上传！请上传文件")
    private String url;
    //原文件名
    private String fileName;
    //是否双面打印
    private Boolean isTwoFace;
    //是否彩印
    private Boolean isColorPrinting;
    //数量
    @Range(min = 1,max = 100,message = "打印范围请在 1 - 100 之间，若有需要请联系 zhouhuan88888@163.com")
    private Long numberPrinting;
    //是否立取
    private Boolean isPickNow;
    //取货时间
    @Future(message = "时间必须在下单时间之前！")
    @NotNull(message = "取货时间不能为空！")
    private Date pickTime;
    //后台打印用户
    private String byUser;
    //是否删除
    private Boolean isDelete;

    @NotNull(message = "店铺信息不能为空!")
    private TbStore tbStore;


}
