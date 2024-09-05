package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.China;

/**
 * 城市管理Service接口
 * 
 * @author ruoyi
 * @date 2024-09-06
 */
public interface IChinaService 
{
    /**
     * 查询城市管理
     * 
     * @param cityId 城市管理主键
     * @return 城市管理
     */
    public China selectChinaByCityId(Long cityId);

    /**
     * 查询城市管理列表
     * 
     * @param china 城市管理
     * @return 城市管理集合
     */
    public List<China> selectChinaList(China china);

    /**
     * 新增城市管理
     * 
     * @param china 城市管理
     * @return 结果
     */
    public int insertChina(China china);

    /**
     * 修改城市管理
     * 
     * @param china 城市管理
     * @return 结果
     */
    public int updateChina(China china);

    /**
     * 批量删除城市管理
     * 
     * @param cityIds 需要删除的城市管理主键集合
     * @return 结果
     */
    public int deleteChinaByCityIds(Long[] cityIds);

    /**
     * 删除城市管理信息
     * 
     * @param cityId 城市管理主键
     * @return 结果
     */
    public int deleteChinaByCityId(Long cityId);
}
