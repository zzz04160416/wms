package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Stock;
import com.ruoyi.system.mapper.StockMapper;
import com.ruoyi.system.service.IStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StockServiceImpl implements IStockService {

    @Autowired
    private StockMapper stockMapper;

    @Override
    public List<Stock> selectStockList(Stock stock) {
        return stockMapper.selectStockList(stock);
    }

    @Override
    public Stock selectStockById(Long id) {
        return stockMapper.selectStockById(id);
    }

    @Override
    @Transactional
    public int insertStock(Stock stock) {
        // 1. 检查 location 是否为空（防止插入不带库位的记录）
        if (stock.getLocation() == null || stock.getLocation().trim().isEmpty()) {
            throw new RuntimeException("库位不能为空，请填写库位信息");
        }

        // 2. 检查数量是否有效
        if (stock.getQuantity() == null || stock.getQuantity() <= 0) {
            throw new RuntimeException("数量必须大于0");
        }

        // 3. 查询是否存在相同库位+批次的库存
        Stock existing = stockMapper.selectStockByBatch(
                stock.getLocation(),        // 参数1: location
                stock.getProductName(),     // 参数2: productName
                stock.getProductionDate(),  // 参数3: productionDate
                stock.getShelfLife(),       // 参数4: shelfLife
                stock.getUnit()             // 参数5: unit
        );

        if (existing != null) {
            // 4. 存在则累加数量
            int newQuantity = existing.getQuantity() + stock.getQuantity();
            existing.setQuantity(newQuantity);
            stockMapper.updateStock(existing);
            return 1;
        } else {
            // 5. 不存在则插入新记录
            return stockMapper.insertStock(stock);
        }
    }

    @Override
    @Transactional
    public int updateStock(Stock stock) {
        // 更新时也检查 location 不能为空
        if (stock.getLocation() == null || stock.getLocation().trim().isEmpty()) {
            throw new RuntimeException("库位不能为空");
        }
        return stockMapper.updateStock(stock);
    }

    @Override
    public int deleteStockByIds(Long[] ids) {
        return stockMapper.deleteStockByIds(ids);
    }

    @Override
    public int deleteStockById(Long id) {
        return stockMapper.deleteStockById(id);
    }
}