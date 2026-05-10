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
import com.ruoyi.system.domain.Shelf;
import com.ruoyi.system.service.IShelfService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 货架信息Controller
 * 
 * @author ruoyi
 * @date 2026-05-06
 */
@RestController
@RequestMapping("/system/shelf")
public class ShelfController extends BaseController
{
    @Autowired
    private IShelfService shelfService;

    /**
     * 查询货架信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:shelf:list')")
    @GetMapping("/list")
    public TableDataInfo list(Shelf shelf)
    {
        startPage();
        List<Shelf> list = shelfService.selectShelfList(shelf);
        return getDataTable(list);
    }

    /**
     * 导出货架信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:shelf:export')")
    @Log(title = "货架信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Shelf shelf)
    {
        List<Shelf> list = shelfService.selectShelfList(shelf);
        ExcelUtil<Shelf> util = new ExcelUtil<Shelf>(Shelf.class);
        util.exportExcel(response, list, "货架信息数据");
    }

    /**
     * 获取货架信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:shelf:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shelfService.selectShelfById(id));
    }

    /**
     * 新增货架信息
     */
    @PreAuthorize("@ss.hasPermi('system:shelf:add')")
    @Log(title = "货架信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Shelf shelf)
    {
        return toAjax(shelfService.insertShelf(shelf));
    }

    /**
     * 修改货架信息
     */
    @PreAuthorize("@ss.hasPermi('system:shelf:edit')")
    @Log(title = "货架信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Shelf shelf)
    {
        return toAjax(shelfService.updateShelf(shelf));
    }

    /**
     * 删除货架信息
     */
    @PreAuthorize("@ss.hasPermi('system:shelf:remove')")
    @Log(title = "货架信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(shelfService.deleteShelfByIds(ids));
    }
}
