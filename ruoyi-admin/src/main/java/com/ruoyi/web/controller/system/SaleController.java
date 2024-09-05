package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Sale;
import com.ruoyi.system.service.ISaleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商店信息Controller
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@RestController
@RequestMapping("/system/sale")
public class SaleController extends BaseController
{
    @Autowired
    private ISaleService saleService;

    /**
     * 查询商店信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:sale:list')")
    @GetMapping("/list")
    public TableDataInfo list(Sale sale)
    {
        startPage();
        List<Sale> list = saleService.selectSaleList(sale);
        return getDataTable(list);
    }

    /**
     * 导出商店信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:sale:export')")
    @Log(title = "商店信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Sale sale)
    {
        List<Sale> list = saleService.selectSaleList(sale);
        ExcelUtil<Sale> util = new ExcelUtil<Sale>(Sale.class);
        util.exportExcel(response, list, "商店信息数据");
    }

    /**
     * 获取商店信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sale:query')")
    @GetMapping(value = "/{saleId}")
    public AjaxResult getInfo(@PathVariable("saleId") Long saleId)
    {
        return success(saleService.selectSaleBySaleId(saleId));
    }

    /**
     * 新增商店信息
     */
    @PreAuthorize("@ss.hasPermi('system:sale:add')")
    @Log(title = "商店信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Sale sale)
    {
        return toAjax(saleService.insertSale(sale));
    }

    /**
     * 修改商店信息
     */
    @PreAuthorize("@ss.hasPermi('system:sale:edit')")
    @Log(title = "商店信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Sale sale)
    {
        return toAjax(saleService.updateSale(sale));
    }

    /**
     * 删除商店信息
     */
    @PreAuthorize("@ss.hasPermi('system:sale:remove')")
    @Log(title = "商店信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{saleIds}")
    public AjaxResult remove(@PathVariable Long[] saleIds)
    {
        return toAjax(saleService.deleteSaleBySaleIds(saleIds));
    }
}
