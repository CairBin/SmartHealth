package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ChinaMapper;
import com.ruoyi.system.domain.China;
import com.ruoyi.system.service.IChinaService;

/**
 * 中国省/市/县Service业务层处理
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@Service
public class ChinaServiceImpl implements IChinaService 
{
    @Autowired
    private ChinaMapper chinaMapper;

    /**
     * 查询中国省/市/县
     * 
     * @param id 中国省/市/县主键
     * @return 中国省/市/县
     */
    @Override
    public China selectChinaById(Long id)
    {
        return chinaMapper.selectChinaById(id);
    }

    /**
     * 查询中国省/市/县列表
     * 
     * @param china 中国省/市/县
     * @return 中国省/市/县
     */
    @Override
    public List<China> selectChinaList(China china)
    {
        return chinaMapper.selectChinaList(china);
    }

    /**
     * 新增中国省/市/县
     * 
     * @param china 中国省/市/县
     * @return 结果
     */
    @Override
    public int insertChina(China china)
    {
        return chinaMapper.insertChina(china);
    }

    /**
     * 修改中国省/市/县
     * 
     * @param china 中国省/市/县
     * @return 结果
     */
    @Override
    public int updateChina(China china)
    {
        return chinaMapper.updateChina(china);
    }

    /**
     * 批量删除中国省/市/县
     * 
     * @param ids 需要删除的中国省/市/县主键
     * @return 结果
     */
    @Override
    public int deleteChinaByIds(Long[] ids)
    {
        return chinaMapper.deleteChinaByIds(ids);
    }

    /**
     * 删除中国省/市/县信息
     * 
     * @param id 中国省/市/县主键
     * @return 结果
     */
    @Override
    public int deleteChinaById(Long id)
    {
        return chinaMapper.deleteChinaById(id);
    }
}
