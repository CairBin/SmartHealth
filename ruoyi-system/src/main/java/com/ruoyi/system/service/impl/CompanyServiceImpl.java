package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.system.domain.CompanyPolicy;
import com.ruoyi.system.mapper.CompanyMapper;
import com.ruoyi.system.domain.Company;
import com.ruoyi.system.service.ICompanyService;

/**
 * 药品公司Service业务层处理
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@Service
public class CompanyServiceImpl implements ICompanyService 
{
    @Autowired
    private CompanyMapper companyMapper;

    /**
     * 查询药品公司
     * 
     * @param companyId 药品公司主键
     * @return 药品公司
     */
    @Override
    public Company selectCompanyByCompanyId(Long companyId)
    {
        return companyMapper.selectCompanyByCompanyId(companyId);
    }

    /**
     * 查询药品公司列表
     * 
     * @param company 药品公司
     * @return 药品公司
     */
    @Override
    public List<Company> selectCompanyList(Company company)
    {
        return companyMapper.selectCompanyList(company);
    }

    /**
     * 新增药品公司
     * 
     * @param company 药品公司
     * @return 结果
     */
    @Transactional
    @Override
    public int insertCompany(Company company)
    {
        company.setCreateTime(DateUtils.getNowDate());
        int rows = companyMapper.insertCompany(company);
        insertCompanyPolicy(company);
        return rows;
    }

    /**
     * 修改药品公司
     * 
     * @param company 药品公司
     * @return 结果
     */
    @Transactional
    @Override
    public int updateCompany(Company company)
    {
        company.setUpdateTime(DateUtils.getNowDate());
        companyMapper.deleteCompanyPolicyByCompanyId(company.getCompanyId());
        insertCompanyPolicy(company);
        return companyMapper.updateCompany(company);
    }

    /**
     * 批量删除药品公司
     * 
     * @param companyIds 需要删除的药品公司主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteCompanyByCompanyIds(Long[] companyIds)
    {
        companyMapper.deleteCompanyPolicyByCompanyIds(companyIds);
        return companyMapper.deleteCompanyByCompanyIds(companyIds);
    }

    /**
     * 删除药品公司信息
     * 
     * @param companyId 药品公司主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteCompanyByCompanyId(Long companyId)
    {
        companyMapper.deleteCompanyPolicyByCompanyId(companyId);
        return companyMapper.deleteCompanyByCompanyId(companyId);
    }

    /**
     * 新增公司政策信息
     * 
     * @param company 药品公司对象
     */
    public void insertCompanyPolicy(Company company)
    {
        List<CompanyPolicy> companyPolicyList = company.getCompanyPolicyList();
        Long companyId = company.getCompanyId();
        if (StringUtils.isNotNull(companyPolicyList))
        {
            List<CompanyPolicy> list = new ArrayList<CompanyPolicy>();
            for (CompanyPolicy companyPolicy : companyPolicyList)
            {
                companyPolicy.setCompanyId(companyId);
                list.add(companyPolicy);
            }
            if (list.size() > 0)
            {
                companyMapper.batchCompanyPolicy(list);
            }
        }
    }
}
