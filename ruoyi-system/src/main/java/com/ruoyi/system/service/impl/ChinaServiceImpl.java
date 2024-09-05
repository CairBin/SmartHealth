package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ChinaMapper;
import com.ruoyi.system.domain.China;
import com.ruoyi.system.service.IChinaService;

/**
 * 城市管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-06
 */
@Service
public class ChinaServiceImpl implements IChinaService 
{
    @Autowired
    private ChinaMapper chinaMapper;

    /**
     * 查询城市管理
     * 
     * @param cityId 城市管理主键
     * @return 城市管理
     */
    @Override
    public China selectChinaByCityId(Long cityId)
    {
        return chinaMapper.selectChinaByCityId(cityId);
    }

    /**
     * 查询城市管理列表
     * 
     * @param china 城市管理
     * @return 城市管理
     */
    @Override
    public List<China> selectChinaList(China china)
    {
        return chinaMapper.selectChinaList(china);
    }

    /**
     * 新增城市管理
     * 
     * @param china 城市管理
     * @return 结果
     */
    @Override
    public int insertChina(China china)
    {
        return chinaMapper.insertChina(china);
    }

    /**
     * 修改城市管理
     * 
     * @param china 城市管理
     * @return 结果
     */
    @Override
    public int updateChina(China china)
    {
        return chinaMapper.updateChina(china);
    }

    /**
     * 批量删除城市管理
     * 
     * @param cityIds 需要删除的城市管理主键
     * @return 结果
     */
    @Override
    public int deleteChinaByCityIds(Long[] cityIds)
    {
        return chinaMapper.deleteChinaByCityIds(cityIds);
    }

    /**
     * 删除城市管理信息
     * 
     * @param cityId 城市管理主键
     * @return 结果
     */
    @Override
    public int deleteChinaByCityId(Long cityId)
    {
        return chinaMapper.deleteChinaByCityId(cityId);
    }
}
