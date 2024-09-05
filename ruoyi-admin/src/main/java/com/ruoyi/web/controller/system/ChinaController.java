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
import com.ruoyi.system.domain.China;
import com.ruoyi.system.service.IChinaService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 城市管理Controller
 * 
 * @author ruoyi
 * @date 2024-09-06
 */
@RestController
@RequestMapping("/system/china")
public class ChinaController extends BaseController
{
    @Autowired
    private IChinaService chinaService;

    /**
     * 查询城市管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:china:list')")
    @GetMapping("/list")
    public AjaxResult list(China china)
    {
        List<China> list = chinaService.selectChinaList(china);
        return success(list);
    }

    /**
     * 导出城市管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:china:export')")
    @Log(title = "城市管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, China china)
    {
        List<China> list = chinaService.selectChinaList(china);
        ExcelUtil<China> util = new ExcelUtil<China>(China.class);
        util.exportExcel(response, list, "城市管理数据");
    }

    /**
     * 获取城市管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:china:query')")
    @GetMapping(value = "/{cityId}")
    public AjaxResult getInfo(@PathVariable("cityId") Long cityId)
    {
        return success(chinaService.selectChinaByCityId(cityId));
    }

    /**
     * 新增城市管理
     */
    @PreAuthorize("@ss.hasPermi('system:china:add')")
    @Log(title = "城市管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody China china)
    {
        return toAjax(chinaService.insertChina(china));
    }

    /**
     * 修改城市管理
     */
    @PreAuthorize("@ss.hasPermi('system:china:edit')")
    @Log(title = "城市管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody China china)
    {
        return toAjax(chinaService.updateChina(china));
    }

    /**
     * 删除城市管理
     */
    @PreAuthorize("@ss.hasPermi('system:china:remove')")
    @Log(title = "城市管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cityIds}")
    public AjaxResult remove(@PathVariable Long[] cityIds)
    {
        return toAjax(chinaService.deleteChinaByCityIds(cityIds));
    }
}
