package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商店信息对象 t_sale
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public class Sale extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药店ID */
    private Long saleId;

    /** 药店名称 */
    @Excel(name = "药店名称")
    private String saleName;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String salePhone;

    public void setSaleId(Long saleId) 
    {
        this.saleId = saleId;
    }

    public Long getSaleId() 
    {
        return saleId;
    }
    public void setSaleName(String saleName) 
    {
        this.saleName = saleName;
    }

    public String getSaleName() 
    {
        return saleName;
    }
    public void setSalePhone(String salePhone) 
    {
        this.salePhone = salePhone;
    }

    public String getSalePhone() 
    {
        return salePhone;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("saleId", getSaleId())
            .append("saleName", getSaleName())
            .append("salePhone", getSalePhone())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
