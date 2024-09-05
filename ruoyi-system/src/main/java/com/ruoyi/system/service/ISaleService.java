package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Sale;

/**
 * 商店信息Service接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface ISaleService 
{
    /**
     * 查询商店信息
     * 
     * @param saleId 商店信息主键
     * @return 商店信息
     */
    public Sale selectSaleBySaleId(Long saleId);

    /**
     * 查询商店信息列表
     * 
     * @param sale 商店信息
     * @return 商店信息集合
     */
    public List<Sale> selectSaleList(Sale sale);

    /**
     * 新增商店信息
     * 
     * @param sale 商店信息
     * @return 结果
     */
    public int insertSale(Sale sale);

    /**
     * 修改商店信息
     * 
     * @param sale 商店信息
     * @return 结果
     */
    public int updateSale(Sale sale);

    /**
     * 批量删除商店信息
     * 
     * @param saleIds 需要删除的商店信息主键集合
     * @return 结果
     */
    public int deleteSaleBySaleIds(Long[] saleIds);

    /**
     * 删除商店信息信息
     * 
     * @param saleId 商店信息主键
     * @return 结果
     */
    public int deleteSaleBySaleId(Long saleId);
}
