package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.PurchaseIn;
import com.ruoyi.system.domain.Stock;
import com.ruoyi.system.mapper.StockMapper;
import com.ruoyi.system.service.IPurchaseInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/system/purchaseIn")
public class PurchaseInController extends BaseController {

    @Autowired
    private IPurchaseInService purchaseInService;

    @Autowired
    private StockMapper stockMapper;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseIn purchaseIn) {
        startPage();
        List<PurchaseIn> list = purchaseInService.selectPurchaseInList(purchaseIn);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('system:purchaseIn:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable Long id) {
        return success(purchaseInService.selectPurchaseInById(id));
    }

    @PreAuthorize("@ss.hasPermi('system:purchaseIn:add')")
    @Log(title = "入库管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PurchaseIn purchaseIn) {
        // 1. 保存入库记录
        int rows = purchaseInService.insertPurchaseIn(purchaseIn);

        // 2. 更新库存表
        if (rows > 0 && purchaseIn.getLocation() != null && !purchaseIn.getLocation().isEmpty()) {
            // 查询该库位下是否有该商品
            Stock stock = stockMapper.selectByLocationAndProduct(
                    purchaseIn.getLocation(),
                    purchaseIn.getProductName()
            );

            if (stock == null) {
                // 没有就新增
                stock = new Stock();
                stock.setLocation(purchaseIn.getLocation());
                stock.setProductName(purchaseIn.getProductName());
                stock.setQuantity(purchaseIn.getQuantity());
                stock.setUnit(purchaseIn.getUnit());
                stock.setProductionDate(purchaseIn.getProductionDate());
                stock.setShelfLife(purchaseIn.getShelfLife());
                stockMapper.insertStock(stock);
            } else {
                // 有就增加数量
                stock.setQuantity(stock.getQuantity() + purchaseIn.getQuantity());
                stockMapper.updateStock(stock);
            }
        }

        return toAjax(rows);
    }

    @PreAuthorize("@ss.hasPermi('system:purchaseIn:edit')")
    @Log(title = "入库管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseIn purchaseIn) {
        return toAjax(purchaseInService.updatePurchaseIn(purchaseIn));
    }

    @PreAuthorize("@ss.hasPermi('system:purchaseIn:remove')")
    @Log(title = "入库管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(purchaseInService.deletePurchaseInByIds(ids));
    }
}