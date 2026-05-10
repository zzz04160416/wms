package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.PurchaseIn;
import java.util.List;

public interface PurchaseInMapper {

    List<PurchaseIn> selectPurchaseInList(PurchaseIn purchaseIn);

    PurchaseIn selectPurchaseInById(Long id);

    int insertPurchaseIn(PurchaseIn purchaseIn);

    int updatePurchaseIn(PurchaseIn purchaseIn);

    int deletePurchaseInById(Long id);

    int deletePurchaseInByIds(Long[] ids);
}