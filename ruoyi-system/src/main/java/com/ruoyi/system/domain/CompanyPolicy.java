package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 公司政策对象 t_company_policy
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public class CompanyPolicy extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 政策ID */
    private Long id;

    /** 公司ID */
    @Excel(name = "公司ID")
    private Long companyId;

    /** 政策标题 */
    @Excel(name = "政策标题")
    private String title;

    /** 政策内容 */
    @Excel(name = "政策内容")
    private String message;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCompanyId(Long companyId) 
    {
        this.companyId = companyId;
    }

    public Long getCompanyId() 
    {
        return companyId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setMessage(String message) 
    {
        this.message = message;
    }

    public String getMessage() 
    {
        return message;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("companyId", getCompanyId())
            .append("title", getTitle())
            .append("message", getMessage())
            .append("createTime", getCreateTime())
            .toString();
    }
}
