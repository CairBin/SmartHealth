package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SaleMapper;
import com.ruoyi.system.domain.Sale;
import com.ruoyi.system.service.ISaleService;

/**
 * 商店信息Service业务层处理
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@Service
public class SaleServiceImpl implements ISaleService 
{
    @Autowired
    private SaleMapper saleMapper;

    /**
     * 查询商店信息
     * 
     * @param saleId 商店信息主键
     * @return 商店信息
     */
    @Override
    public Sale selectSaleBySaleId(Long saleId)
    {
        return saleMapper.selectSaleBySaleId(saleId);
    }

    /**
     * 查询商店信息列表
     * 
     * @param sale 商店信息
     * @return 商店信息
     */
    @Override
    public List<Sale> selectSaleList(Sale sale)
    {
        return saleMapper.selectSaleList(sale);
    }

    /**
     * 新增商店信息
     * 
     * @param sale 商店信息
     * @return 结果
     */
    @Override
    public int insertSale(Sale sale)
    {
        sale.setCreateTime(DateUtils.getNowDate());
        return saleMapper.insertSale(sale);
    }

    /**
     * 修改商店信息
     * 
     * @param sale 商店信息
     * @return 结果
     */
    @Override
    public int updateSale(Sale sale)
    {
        sale.setUpdateTime(DateUtils.getNowDate());
        return saleMapper.updateSale(sale);
    }

    /**
     * 批量删除商店信息
     * 
     * @param saleIds 需要删除的商店信息主键
     * @return 结果
     */
    @Override
    public int deleteSaleBySaleIds(Long[] saleIds)
    {
        return saleMapper.deleteSaleBySaleIds(saleIds);
    }

    /**
     * 删除商店信息信息
     * 
     * @param saleId 商店信息主键
     * @return 结果
     */
    @Override
    public int deleteSaleBySaleId(Long saleId)
    {
        return saleMapper.deleteSaleBySaleId(saleId);
    }
}
