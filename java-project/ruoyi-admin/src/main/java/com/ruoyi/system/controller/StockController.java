package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Stock;
import com.ruoyi.system.service.IStockService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

@RestController
@RequestMapping("/system/stock")
public class StockController extends BaseController {

    @Autowired
    private IStockService stockService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list")
    public TableDataInfo list(Stock stock) {
        startPage();
        List<Stock> list = stockService.selectStockList(stock);
        return getDataTable(list);
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "库存管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Stock stock) {
        List<Stock> list = stockService.selectStockList(stock);
        ExcelUtil<Stock> util = new ExcelUtil<>(Stock.class);
        util.exportExcel(response, list, "库存数据");
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable Long id) {
        return success(stockService.selectStockById(id));
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "库存管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Stock stock) {
        return toAjax(stockService.insertStock(stock));
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "库存管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Stock stock) {
        return toAjax(stockService.updateStock(stock));
    }

    @PreAuthorize("isAuthenticated()")
    @Log(title = "库存管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(stockService.deleteStockByIds(ids));
    }

    // ================= 库存检查（修改：支持查询指定库位的库存） =================
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/check")
    public AjaxResult checkStock(@RequestParam(required = false) String location,
                                 String productName,
                                 String unit,
                                 Integer quantity) {
        // 查询库存（支持按库位查询）
        Stock query = new Stock();
        query.setProductName(productName);
        query.setUnit(unit);
        query.setLocation(location);
        List<Stock> stockList = stockService.selectStockList(query);

        int totalStock = stockList.stream().mapToInt(s -> s.getQuantity() != null ? s.getQuantity() : 0).sum();
        boolean sufficient = totalStock >= (quantity == null ? 0 : quantity);

        return success(sufficient).put("currentStock", totalStock);
    }
}