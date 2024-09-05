package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.system.domain.China;
import com.ruoyi.system.mapper.MedicalPolicyMapper;
import com.ruoyi.system.domain.MedicalPolicy;
import com.ruoyi.system.service.IMedicalPolicyService;

/**
 * 医保政策管理Service业务层处理
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@Service
public class MedicalPolicyServiceImpl implements IMedicalPolicyService 
{
    @Autowired
    private MedicalPolicyMapper medicalPolicyMapper;

    /**
     * 查询医保政策管理
     * 
     * @param id 医保政策管理主键
     * @return 医保政策管理
     */
    @Override
    public MedicalPolicy selectMedicalPolicyById(Long id)
    {
        return medicalPolicyMapper.selectMedicalPolicyById(id);
    }

    /**
     * 查询医保政策管理列表
     * 
     * @param medicalPolicy 医保政策管理
     * @return 医保政策管理
     */
    @Override
    public List<MedicalPolicy> selectMedicalPolicyList(MedicalPolicy medicalPolicy)
    {
        return medicalPolicyMapper.selectMedicalPolicyList(medicalPolicy);
    }

    /**
     * 新增医保政策管理
     * 
     * @param medicalPolicy 医保政策管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertMedicalPolicy(MedicalPolicy medicalPolicy)
    {
        medicalPolicy.setCreateTime(DateUtils.getNowDate());
        int rows = medicalPolicyMapper.insertMedicalPolicy(medicalPolicy);
        insertChina(medicalPolicy);
        return rows;
    }

    /**
     * 修改医保政策管理
     * 
     * @param medicalPolicy 医保政策管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateMedicalPolicy(MedicalPolicy medicalPolicy)
    {
        medicalPolicy.setUpdateTime(DateUtils.getNowDate());
        medicalPolicyMapper.deleteChinaByCityId(medicalPolicy.getId());
        insertChina(medicalPolicy);
        return medicalPolicyMapper.updateMedicalPolicy(medicalPolicy);
    }

    /**
     * 批量删除医保政策管理
     * 
     * @param ids 需要删除的医保政策管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMedicalPolicyByIds(Long[] ids)
    {
        medicalPolicyMapper.deleteChinaByCityIds(ids);
        return medicalPolicyMapper.deleteMedicalPolicyByIds(ids);
    }

    /**
     * 删除医保政策管理信息
     * 
     * @param id 医保政策管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMedicalPolicyById(Long id)
    {
        medicalPolicyMapper.deleteChinaByCityId(id);
        return medicalPolicyMapper.deleteMedicalPolicyById(id);
    }

    /**
     * 新增城市管理信息
     * 
     * @param medicalPolicy 医保政策管理对象
     */
    public void insertChina(MedicalPolicy medicalPolicy)
    {
        List<China> chinaList = medicalPolicy.getChinaList();
        Long id = medicalPolicy.getId();
        if (StringUtils.isNotNull(chinaList))
        {
            List<China> list = new ArrayList<China>();
            for (China china : chinaList)
            {
                china.setCityId(id);
                list.add(china);
            }
            if (list.size() > 0)
            {
                medicalPolicyMapper.batchChina(list);
            }
        }
    }
}
