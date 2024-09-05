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
 * 中国省/市/县Controller
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@RestController
@RequestMapping("/system/china")
public class ChinaController extends BaseController
{
    @Autowired
    private IChinaService chinaService;

    /**
     * 查询中国省/市/县列表
     */
    @PreAuthorize("@ss.hasPermi('system:china:list')")
    @GetMapping("/list")
    public AjaxResult list(China china)
    {
        List<China> list = chinaService.selectChinaList(china);
        return success(list);
    }

    /**
     * 导出中国省/市/县列表
     */
    @PreAuthorize("@ss.hasPermi('system:china:export')")
    @Log(title = "中国省/市/县", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, China china)
    {
        List<China> list = chinaService.selectChinaList(china);
        ExcelUtil<China> util = new ExcelUtil<China>(China.class);
        util.exportExcel(response, list, "中国省/市/县数据");
    }

    /**
     * 获取中国省/市/县详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:china:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(chinaService.selectChinaById(id));
    }

    /**
     * 新增中国省/市/县
     */
    @PreAuthorize("@ss.hasPermi('system:china:add')")
    @Log(title = "中国省/市/县", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody China china)
    {
        return toAjax(chinaService.insertChina(china));
    }

    /**
     * 修改中国省/市/县
     */
    @PreAuthorize("@ss.hasPermi('system:china:edit')")
    @Log(title = "中国省/市/县", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody China china)
    {
        return toAjax(chinaService.updateChina(china));
    }

    /**
     * 删除中国省/市/县
     */
    @PreAuthorize("@ss.hasPermi('system:china:remove')")
    @Log(title = "中国省/市/县", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(chinaService.deleteChinaByIds(ids));
    }
}
