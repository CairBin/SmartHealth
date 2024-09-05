package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.China;

/**
 * 中国省/市/县Mapper接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface ChinaMapper 
{
    /**
     * 查询中国省/市/县
     * 
     * @param id 中国省/市/县主键
     * @return 中国省/市/县
     */
    public China selectChinaById(Long id);

    /**
     * 查询中国省/市/县列表
     * 
     * @param china 中国省/市/县
     * @return 中国省/市/县集合
     */
    public List<China> selectChinaList(China china);

    /**
     * 新增中国省/市/县
     * 
     * @param china 中国省/市/县
     * @return 结果
     */
    public int insertChina(China china);

    /**
     * 修改中国省/市/县
     * 
     * @param china 中国省/市/县
     * @return 结果
     */
    public int updateChina(China china);

    /**
     * 删除中国省/市/县
     * 
     * @param id 中国省/市/县主键
     * @return 结果
     */
    public int deleteChinaById(Long id);

    /**
     * 批量删除中国省/市/县
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChinaByIds(Long[] ids);
}
