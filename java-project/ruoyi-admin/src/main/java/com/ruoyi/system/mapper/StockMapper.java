package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Stock;
import org.apache.ibatis.annotations.Param;
import java.util.Date;
import java.util.List;

public interface StockMapper {

    List<Stock> selectStockList(Stock stock);

    Stock selectStockById(Long id);

    // 根据库位和商品名查询库存
    Stock selectByLocationAndProduct(@Param("location") String location,
                                     @Param("productName") String productName);

    // 根据产品名称和单位查询库存（返回所有批次）
    List<Stock> selectStockByProductAndUnit(@Param("productName") String productName,
                                            @Param("unit") String unit);

    // 根据完整信息查询单个批次（修改：加上 location 参数）
    Stock selectStockByBatch(@Param("location") String location,
                             @Param("productName") String productName,
                             @Param("productionDate") Date productionDate,
                             @Param("shelfLife") Integer shelfLife,
                             @Param("unit") String unit);

    int insertStock(Stock stock);

    int updateStock(Stock stock);

    // 增加库存数量
    int increaseQuantity(@Param("id") Long id, @Param("quantity") Integer quantity);

    // 减少库存数量
    int decreaseQuantity(@Param("id") Long id, @Param("quantity") Integer quantity);

    int deleteStockById(Long id);

    int deleteStockByIds(Long[] ids);
}