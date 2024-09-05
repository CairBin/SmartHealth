package com.ruoyi.system.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品公司对象 t_company
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public class Company extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 公司ID */
    private Long companyId;

    /** 公司名称 */
    @Excel(name = "公司名称")
    private String companyName;

    /** 公司电话 */
    @Excel(name = "公司电话")
    private String companyPhone;

    /** 公司政策信息 */
    private List<CompanyPolicy> companyPolicyList;

    public void setCompanyId(Long companyId) 
    {
        this.companyId = companyId;
    }

    public Long getCompanyId() 
    {
        return companyId;
    }
    public void setCompanyName(String companyName) 
    {
        this.companyName = companyName;
    }

    public String getCompanyName() 
    {
        return companyName;
    }
    public void setCompanyPhone(String companyPhone) 
    {
        this.companyPhone = companyPhone;
    }

    public String getCompanyPhone() 
    {
        return companyPhone;
    }

    public List<CompanyPolicy> getCompanyPolicyList()
    {
        return companyPolicyList;
    }

    public void setCompanyPolicyList(List<CompanyPolicy> companyPolicyList)
    {
        this.companyPolicyList = companyPolicyList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("companyId", getCompanyId())
            .append("companyName", getCompanyName())
            .append("companyPhone", getCompanyPhone())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("companyPolicyList", getCompanyPolicyList())
            .toString();
    }
}
