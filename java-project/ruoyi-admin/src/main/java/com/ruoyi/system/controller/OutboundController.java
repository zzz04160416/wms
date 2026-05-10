package com.ruoyi.system.controller;

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
import com.ruoyi.system.domain.Outbound;
import com.ruoyi.system.service.IOutboundService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

@RestController
@RequestMapping("/system/outbound")
public class OutboundController extends BaseController {

    @Autowired
    private IOutboundService outboundService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list")
    public TableDataInfo list(Outbound outbound) {
        startPage();
        List<Outbound> list = outboundService.selectOutboundList(outbound);
        return getDataTable(list);
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "出库管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Outbound outbound) {
        List<Outbound> list = outboundService.selectOutboundList(outbound);
        ExcelUtil<Outbound> util = new ExcelUtil<Outbound>(Outbound.class);
        util.exportExcel(response, list, "出库数据");
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(outboundService.selectOutboundById(id));
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "出库管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody Outbound outbound) {
        return toAjax(outboundService.insertOutbound(outbound));
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "出库管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Outbound outbound) {
        return toAjax(outboundService.updateOutbound(outbound));
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "出库管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(outboundService.deleteOutboundByIds(ids));
    }
}