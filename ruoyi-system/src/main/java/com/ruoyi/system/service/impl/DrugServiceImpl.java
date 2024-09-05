package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DrugMapper;
import com.ruoyi.system.domain.Drug;
import com.ruoyi.system.service.IDrugService;

/**
 * 药物信息Service业务层处理
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@Service
public class DrugServiceImpl implements IDrugService 
{
    @Autowired
    private DrugMapper drugMapper;

    /**
     * 查询药物信息
     * 
     * @param drugId 药物信息主键
     * @return 药物信息
     */
    @Override
    public Drug selectDrugByDrugId(Long drugId)
    {
        return drugMapper.selectDrugByDrugId(drugId);
    }

    /**
     * 查询药物信息列表
     * 
     * @param drug 药物信息
     * @return 药物信息
     */
    @Override
    public List<Drug> selectDrugList(Drug drug)
    {
        return drugMapper.selectDrugList(drug);
    }

    /**
     * 新增药物信息
     * 
     * @param drug 药物信息
     * @return 结果
     */
    @Override
    public int insertDrug(Drug drug)
    {
        drug.setCreateTime(DateUtils.getNowDate());
        return drugMapper.insertDrug(drug);
    }

    /**
     * 修改药物信息
     * 
     * @param drug 药物信息
     * @return 结果
     */
    @Override
    public int updateDrug(Drug drug)
    {
        return drugMapper.updateDrug(drug);
    }

    /**
     * 批量删除药物信息
     * 
     * @param drugIds 需要删除的药物信息主键
     * @return 结果
     */
    @Override
    public int deleteDrugByDrugIds(Long[] drugIds)
    {
        return drugMapper.deleteDrugByDrugIds(drugIds);
    }

    /**
     * 删除药物信息信息
     * 
     * @param drugId 药物信息主键
     * @return 结果
     */
    @Override
    public int deleteDrugByDrugId(Long drugId)
    {
        return drugMapper.deleteDrugByDrugId(drugId);
    }
}
