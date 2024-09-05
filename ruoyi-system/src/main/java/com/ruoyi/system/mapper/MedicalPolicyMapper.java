package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.MedicalPolicy;
import com.ruoyi.system.domain.China;

/**
 * 医保政策管理Mapper接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface MedicalPolicyMapper 
{
    /**
     * 查询医保政策管理
     * 
     * @param id 医保政策管理主键
     * @return 医保政策管理
     */
    public MedicalPolicy selectMedicalPolicyById(Long id);

    /**
     * 查询医保政策管理列表
     * 
     * @param medicalPolicy 医保政策管理
     * @return 医保政策管理集合
     */
    public List<MedicalPolicy> selectMedicalPolicyList(MedicalPolicy medicalPolicy);

    /**
     * 新增医保政策管理
     * 
     * @param medicalPolicy 医保政策管理
     * @return 结果
     */
    public int insertMedicalPolicy(MedicalPolicy medicalPolicy);

    /**
     * 修改医保政策管理
     * 
     * @param medicalPolicy 医保政策管理
     * @return 结果
     */
    public int updateMedicalPolicy(MedicalPolicy medicalPolicy);

    /**
     * 删除医保政策管理
     * 
     * @param id 医保政策管理主键
     * @return 结果
     */
    public int deleteMedicalPolicyById(Long id);

    /**
     * 批量删除医保政策管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicalPolicyByIds(Long[] ids);

    /**
     * 批量删除城市管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChinaByCityIds(Long[] ids);
    
    /**
     * 批量新增城市管理
     * 
     * @param chinaList 城市管理列表
     * @return 结果
     */
    public int batchChina(List<China> chinaList);
    

    /**
     * 通过医保政策管理主键删除城市管理信息
     * 
     * @param id 医保政策管理ID
     * @return 结果
     */
    public int deleteChinaByCityId(Long id);
}
