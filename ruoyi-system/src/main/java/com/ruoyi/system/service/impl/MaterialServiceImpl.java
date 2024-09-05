package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MaterialMapper;
import com.ruoyi.system.domain.Material;
import com.ruoyi.system.service.IMaterialService;

/**
 * 必备材料Service业务层处理
 * 
 * @author cairbin
 * @date 2024-09-05
 */
@Service
public class MaterialServiceImpl implements IMaterialService 
{
    @Autowired
    private MaterialMapper materialMapper;

    /**
     * 查询必备材料
     * 
     * @param id 必备材料主键
     * @return 必备材料
     */
    @Override
    public Material selectMaterialById(Long id)
    {
        return materialMapper.selectMaterialById(id);
    }

    /**
     * 查询必备材料列表
     * 
     * @param material 必备材料
     * @return 必备材料
     */
    @Override
    public List<Material> selectMaterialList(Material material)
    {
        return materialMapper.selectMaterialList(material);
    }

    /**
     * 新增必备材料
     * 
     * @param material 必备材料
     * @return 结果
     */
    @Override
    public int insertMaterial(Material material)
    {
        material.setCreateTime(DateUtils.getNowDate());
        return materialMapper.insertMaterial(material);
    }

    /**
     * 修改必备材料
     * 
     * @param material 必备材料
     * @return 结果
     */
    @Override
    public int updateMaterial(Material material)
    {
        material.setUpdateTime(DateUtils.getNowDate());
        return materialMapper.updateMaterial(material);
    }

    /**
     * 批量删除必备材料
     * 
     * @param ids 需要删除的必备材料主键
     * @return 结果
     */
    @Override
    public int deleteMaterialByIds(Long[] ids)
    {
        return materialMapper.deleteMaterialByIds(ids);
    }

    /**
     * 删除必备材料信息
     * 
     * @param id 必备材料主键
     * @return 结果
     */
    @Override
    public int deleteMaterialById(Long id)
    {
        return materialMapper.deleteMaterialById(id);
    }
}
