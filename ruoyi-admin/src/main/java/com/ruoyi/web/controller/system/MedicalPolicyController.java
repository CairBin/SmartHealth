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
import com.ruoyi.system.domain.MedicalPolicy;
import com.ruoyi.system.service.IMedicalPolicyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医保政策管理Controller
 * 
 * @author cairbin
 * @date 2024-09-06
 */
@RestController
@RequestMapping("/system/policy")
public class MedicalPolicyController extends BaseController
{
    @Autowired
    private IMedicalPolicyService medicalPolicyService;

    /**
     * 查询医保政策管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:policy:list')")
    @GetMapping("/list")
    public TableDataInfo list(MedicalPolicy medicalPolicy)
    {
        startPage();
        List<MedicalPolicy> list = medicalPolicyService.selectMedicalPolicyList(medicalPolicy);
        return getDataTable(list);
    }

    /**
     * 导出医保政策管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:policy:export')")
    @Log(title = "医保政策管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MedicalPolicy medicalPolicy)
    {
        List<MedicalPolicy> list = medicalPolicyService.selectMedicalPolicyList(medicalPolicy);
        ExcelUtil<MedicalPolicy> util = new ExcelUtil<MedicalPolicy>(MedicalPolicy.class);
        util.exportExcel(response, list, "医保政策管理数据");
    }

    /**
     * 获取医保政策管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:policy:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(medicalPolicyService.selectMedicalPolicyById(id));
    }

    /**
     * 新增医保政策管理
     */
    @PreAuthorize("@ss.hasPermi('system:policy:add')")
    @Log(title = "医保政策管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MedicalPolicy medicalPolicy)
    {
        return toAjax(medicalPolicyService.insertMedicalPolicy(medicalPolicy));
    }

    /**
     * 修改医保政策管理
     */
    @PreAuthorize("@ss.hasPermi('system:policy:edit')")
    @Log(title = "医保政策管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MedicalPolicy medicalPolicy)
    {
        return toAjax(medicalPolicyService.updateMedicalPolicy(medicalPolicy));
    }

    /**
     * 删除医保政策管理
     */
    @PreAuthorize("@ss.hasPermi('system:policy:remove')")
    @Log(title = "医保政策管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(medicalPolicyService.deleteMedicalPolicyByIds(ids));
    }
}
