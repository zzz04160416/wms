package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ShelfMapper;
import com.ruoyi.system.domain.Shelf;
import com.ruoyi.system.service.IShelfService;

/**
 * 货架信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-06
 */
@Service
public class ShelfServiceImpl implements IShelfService 
{
    @Autowired
    private ShelfMapper shelfMapper;

    /**
     * 查询货架信息
     * 
     * @param id 货架信息主键
     * @return 货架信息
     */
    @Override
    public Shelf selectShelfById(Long id)
    {
        return shelfMapper.selectShelfById(id);
    }

    /**
     * 查询货架信息列表
     * 
     * @param shelf 货架信息
     * @return 货架信息
     */
    @Override
    public List<Shelf> selectShelfList(Shelf shelf)
    {
        return shelfMapper.selectShelfList(shelf);
    }

    /**
     * 新增货架信息
     * 
     * @param shelf 货架信息
     * @return 结果
     */
    @Override
    public int insertShelf(Shelf shelf)
    {
        shelf.setCreateTime(DateUtils.getNowDate());
        return shelfMapper.insertShelf(shelf);
    }

    /**
     * 修改货架信息
     * 
     * @param shelf 货架信息
     * @return 结果
     */
    @Override
    public int updateShelf(Shelf shelf)
    {
        shelf.setUpdateTime(DateUtils.getNowDate());
        return shelfMapper.updateShelf(shelf);
    }

    /**
     * 批量删除货架信息
     * 
     * @param ids 需要删除的货架信息主键
     * @return 结果
     */
    @Override
    public int deleteShelfByIds(Long[] ids)
    {
        return shelfMapper.deleteShelfByIds(ids);
    }

    /**
     * 删除货架信息信息
     * 
     * @param id 货架信息主键
     * @return 结果
     */
    @Override
    public int deleteShelfById(Long id)
    {
        return shelfMapper.deleteShelfById(id);
    }
}
