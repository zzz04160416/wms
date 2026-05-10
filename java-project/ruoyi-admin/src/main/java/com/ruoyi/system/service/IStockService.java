package com.ruoyi.system.service;

import com.ruoyi.system.domain.Stock;
import java.util.List;

public interface IStockService {

    List<Stock> selectStockList(Stock stock);

    Stock selectStockById(Long id);

    int insertStock(Stock stock);

    int updateStock(Stock stock);

    int deleteStockByIds(Long[] ids);

    int deleteStockById(Long id);
}