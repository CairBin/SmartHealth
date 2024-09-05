package com.ruoyi.system.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医保政策管理对象 t_medical_policy
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public class MedicalPolicy extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 政策编号 */
    @Excel(name = "政策编号")
    private Long code;

    /** 政策标题 */
    @Excel(name = "政策标题")
    private String title;

    /** 政策内容 */
    @Excel(name = "政策内容")
    private String message;

    /** 城市ID */
    @Excel(name = "城市ID")
    private Long cityId;

    /** 城市管理信息 */
    private List<China> chinaList;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCode(Long code) 
    {
        this.code = code;
    }

    public Long getCode() 
    {
        return code;
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
    public void setCityId(Long cityId) 
    {
        this.cityId = cityId;
    }

    public Long getCityId() 
    {
        return cityId;
    }

    public List<China> getChinaList()
    {
        return chinaList;
    }

    public void setChinaList(List<China> chinaList)
    {
        this.chinaList = chinaList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("code", getCode())
            .append("title", getTitle())
            .append("message", getMessage())
            .append("cityId", getCityId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("chinaList", getChinaList())
            .toString();
    }
}
