package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药物信息对象 t_drug
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public class Drug extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药品ID */
    private Long drugId;

    /** 药品图片URL */
    @Excel(name = "药品图片URL")
    private String drugImg;

    /** 药品成分 */
    @Excel(name = "药品成分")
    private String drugInfo;

    /** 药品功效 */
    @Excel(name = "药品功效")
    private String drugEffect;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String drugName;

    public void setDrugId(Long drugId) 
    {
        this.drugId = drugId;
    }

    public Long getDrugId() 
    {
        return drugId;
    }
    public void setDrugImg(String drugImg) 
    {
        this.drugImg = drugImg;
    }

    public String getDrugImg() 
    {
        return drugImg;
    }
    public void setDrugInfo(String drugInfo) 
    {
        this.drugInfo = drugInfo;
    }

    public String getDrugInfo() 
    {
        return drugInfo;
    }
    public void setDrugEffect(String drugEffect) 
    {
        this.drugEffect = drugEffect;
    }

    public String getDrugEffect() 
    {
        return drugEffect;
    }
    public void setDrugName(String drugName) 
    {
        this.drugName = drugName;
    }

    public String getDrugName() 
    {
        return drugName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("drugId", getDrugId())
            .append("drugImg", getDrugImg())
            .append("drugInfo", getDrugInfo())
            .append("drugEffect", getDrugEffect())
            .append("drugName", getDrugName())
            .append("createTime", getCreateTime())
            .toString();
    }
}
