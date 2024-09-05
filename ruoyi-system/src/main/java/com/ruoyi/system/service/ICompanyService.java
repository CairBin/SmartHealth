package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Company;

/**
 * 药品公司Service接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface ICompanyService 
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
     * 批量删除药品公司
     * 
     * @param companyIds 需要删除的药品公司主键集合
     * @return 结果
     */
    public int deleteCompanyByCompanyIds(Long[] companyIds);

    /**
     * 删除药品公司信息
     * 
     * @param companyId 药品公司主键
     * @return 结果
     */
    public int deleteCompanyByCompanyId(Long companyId);
}
