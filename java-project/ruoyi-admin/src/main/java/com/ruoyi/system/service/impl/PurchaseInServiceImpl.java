package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.PurchaseIn;
import com.ruoyi.system.domain.Stock;
import com.ruoyi.system.mapper.PurchaseInMapper;
import com.ruoyi.system.mapper.StockMapper;
import com.ruoyi.system.service.IPurchaseInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class PurchaseInServiceImpl implements IPurchaseInService {

    @Autowired
    private PurchaseInMapper purchaseInMapper;

    @Autowired
    private StockMapper stockMapper;

    @Override
    public List<PurchaseIn> selectPurchaseInList(PurchaseIn purchaseIn) {
        return purchaseInMapper.selectPurchaseInList(purchaseIn);
    }

    @Override
    public PurchaseIn selectPurchaseInById(Long id) {
        return purchaseInMapper.selectPurchaseInById(id);
    }

    // 新增入库
    @Override
    @Transactional
    public int insertPurchaseIn(PurchaseIn purchaseIn) {
        // 1. 保存入库记录
        int rows = purchaseInMapper.insertPurchaseIn(purchaseIn);

        // 2. 更新库存（增加数量）
        updateStockForPurchaseIn(purchaseIn, purchaseIn.getQuantity());

        return rows;
    }

    // 修改入库
    @Override
    @Transactional
    public int updatePurchaseIn(PurchaseIn purchaseIn) {
        // 1. 查询原入库记录
        PurchaseIn old = purchaseInMapper.selectPurchaseInById(purchaseIn.getId());

        // 2. 回滚原数量（减少库存）
        updateStockForPurchaseIn(old, -old.getQuantity());

        // 3. 应用新数量（增加库存）
        updateStockForPurchaseIn(purchaseIn, purchaseIn.getQuantity());

        // 4. 更新入库记录
        return purchaseInMapper.updatePurchaseIn(purchaseIn);
    }

    // 批量删除入库
    @Override
    @Transactional
    public int deletePurchaseInByIds(Long[] ids) {
        for (Long id : ids) {
            PurchaseIn purchaseIn = purchaseInMapper.selectPurchaseInById(id);
            if (purchaseIn != null) {
                // 回滚库存（减少库存）
                updateStockForPurchaseIn(purchaseIn, -purchaseIn.getQuantity());
            }
        }
        return purchaseInMapper.deletePurchaseInByIds(ids);
    }

    // 删除入库
    @Override
    @Transactional
    public int deletePurchaseInById(Long id) {
        PurchaseIn purchaseIn = purchaseInMapper.selectPurchaseInById(id);
        if (purchaseIn != null) {
            // 回滚库存（减少库存）
            updateStockForPurchaseIn(purchaseIn, -purchaseIn.getQuantity());
        }
        return purchaseInMapper.deletePurchaseInById(id);
    }

    /**
     * 更新库存（入库操作）
     */
    private void updateStockForPurchaseIn(PurchaseIn in, int quantityChange) {
        // 查询是否存在相同库位+批次的库存
        Stock stock = stockMapper.selectStockByBatch(
                in.getLocation(),        // location
                in.getProductName(),
                in.getProductionDate(),
                in.getShelfLife(),
                in.getUnit()
        );

        if (stock == null && quantityChange > 0) {
            // 不存在且是增加，则新增库存记录（必须设置 location）
            stock = new Stock();
            stock.setLocation(in.getLocation());        // ✅ 添加这一行！关键修复
            stock.setProductName(in.getProductName());
            stock.setQuantity(quantityChange);
            stock.setUnit(in.getUnit());
            stock.setProductionDate(in.getProductionDate());
            stock.setShelfLife(in.getShelfLife());
            stockMapper.insertStock(stock);
        } else if (stock != null) {
            // 存在则更新数量
            if (quantityChange > 0) {
                stockMapper.increaseQuantity(stock.getId(), quantityChange);
            } else if (quantityChange < 0) {
                stockMapper.decreaseQuantity(stock.getId(), -quantityChange);
            }
        }
    }
}