package com.ruoyi.system.service;

import com.ruoyi.system.domain.PurchaseIn;
import java.util.List;

public interface IPurchaseInService {

    List<PurchaseIn> selectPurchaseInList(PurchaseIn purchaseIn);

    PurchaseIn selectPurchaseInById(Long id);

    int insertPurchaseIn(PurchaseIn purchaseIn);

    int updatePurchaseIn(PurchaseIn purchaseIn);

    int deletePurchaseInByIds(Long[] ids);

    int deletePurchaseInById(Long id);
}