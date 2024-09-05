package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Drug;

/**
 * 药物信息Mapper接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface DrugMapper 
{
    /**
     * 查询药物信息
     * 
     * @param drugId 药物信息主键
     * @return 药物信息
     */
    public Drug selectDrugByDrugId(Long drugId);

    /**
     * 查询药物信息列表
     * 
     * @param drug 药物信息
     * @return 药物信息集合
     */
    public List<Drug> selectDrugList(Drug drug);

    /**
     * 新增药物信息
     * 
     * @param drug 药物信息
     * @return 结果
     */
    public int insertDrug(Drug drug);

    /**
     * 修改药物信息
     * 
     * @param drug 药物信息
     * @return 结果
     */
    public int updateDrug(Drug drug);

    /**
     * 删除药物信息
     * 
     * @param drugId 药物信息主键
     * @return 结果
     */
    public int deleteDrugByDrugId(Long drugId);

    /**
     * 批量删除药物信息
     * 
     * @param drugIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDrugByDrugIds(Long[] drugIds);
}
