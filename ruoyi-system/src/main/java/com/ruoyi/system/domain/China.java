package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 城市管理对象 t_china
 * 
 * @author ruoyi
 * @date 2024-09-06
 */
public class China extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 省/市/县ID */
    private Long cityId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    public void setCityId(Long cityId) 
    {
        this.cityId = cityId;
    }

    public Long getCityId() 
    {
        return cityId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("cityId", getCityId())
            .append("name", getName())
            .append("parentId", getParentId())
            .toString();
    }
}
