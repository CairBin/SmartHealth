package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Material;

/**
 * 必备材料Service接口
 * 
 * @author cairbin
 * @date 2024-09-05
 */
public interface IMaterialService 
{
    /**
     * 查询必备材料
     * 
     * @param id 必备材料主键
     * @return 必备材料
     */
    public Material selectMaterialById(Long id);

    /**
     * 查询必备材料列表
     * 
     * @param material 必备材料
     * @return 必备材料集合
     */
    public List<Material> selectMaterialList(Material material);

    /**
     * 新增必备材料
     * 
     * @param material 必备材料
     * @return 结果
     */
    public int insertMaterial(Material material);

    /**
     * 修改必备材料
     * 
     * @param material 必备材料
     * @return 结果
     */
    public int updateMaterial(Material material);

    /**
     * 批量删除必备材料
     * 
     * @param ids 需要删除的必备材料主键集合
     * @return 结果
     */
    public int deleteMaterialByIds(Long[] ids);

    /**
     * 删除必备材料信息
     * 
     * @param id 必备材料主键
     * @return 结果
     */
    public int deleteMaterialById(Long id);
}
