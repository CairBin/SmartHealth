package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Sale;

/**
 * 商店信息Mapper接口
 * 
 * @author cairbin
 * @date 2024-09-06
 */
public interface SaleMapper 
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
     * 删除商店信息
     * 
     * @param saleId 商店信息主键
     * @return 结果
     */
    public int deleteSaleBySaleId(Long saleId);

    /**
     * 批量删除商店信息
     * 
     * @param saleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSaleBySaleIds(Long[] saleIds);
}
