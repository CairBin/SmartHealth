package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Company;
import com.ruoyi.system.domain.CompanyPolicy;

/**
 * 药品公司Mapper接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface CompanyMapper 
{
    /**
     * 查询药品公司
     * 
     * @param companyId 药品公司主键
     * @return 药品公司
     */
    public Company selectCompanyByCompanyId(Long companyId);

    /**
     * 查询药品公司列表
     * 
     * @param company 药品公司
     * @return 药品公司集合
     */
    public List<Company> selectCompanyList(Company company);

    /**
     * 新增药品公司
     * 
     * @param company 药品公司
     * @return 结果
     */
    public int insertCompany(Company company);

    /**
     * 修改药品公司
     * 
     * @param company 药品公司
     * @return 结果
     */
    public int updateCompany(Company company);

    /**
     * 删除药品公司
     * 
     * @param companyId 药品公司主键
     * @return 结果
     */
    public int deleteCompanyByCompanyId(Long companyId);

    /**
     * 批量删除药品公司
     * 
     * @param companyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCompanyByCompanyIds(Long[] companyIds);

    /**
     * 批量删除公司政策
     * 
     * @param companyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCompanyPolicyByCompanyIds(Long[] companyIds);
    
    /**
     * 批量新增公司政策
     * 
     * @param companyPolicyList 公司政策列表
     * @return 结果
     */
    public int batchCompanyPolicy(List<CompanyPolicy> companyPolicyList);
    

    /**
     * 通过药品公司主键删除公司政策信息
     * 
     * @param companyId 药品公司ID
     * @return 结果
     */
    public int deleteCompanyPolicyByCompanyId(Long companyId);
}
