package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.MedicalPolicy;

/**
 * 医保政策管理Service接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface IMedicalPolicyService 
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
     * 批量删除医保政策管理
     * 
     * @param ids 需要删除的医保政策管理主键集合
     * @return 结果
     */
    public int deleteMedicalPolicyByIds(Long[] ids);

    /**
     * 删除医保政策管理信息
     * 
     * @param id 医保政策管理主键
     * @return 结果
     */
    public int deleteMedicalPolicyById(Long id);
}
