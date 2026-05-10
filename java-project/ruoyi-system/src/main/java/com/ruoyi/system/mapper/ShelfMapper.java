package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Shelf;

/**
 * 货架信息Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-06
 */
public interface ShelfMapper 
{
    /**
     * 查询货架信息
     * 
     * @param id 货架信息主键
     * @return 货架信息
     */
    public Shelf selectShelfById(Long id);

    /**
     * 查询货架信息列表
     * 
     * @param shelf 货架信息
     * @return 货架信息集合
     */
    public List<Shelf> selectShelfList(Shelf shelf);

    /**
     * 新增货架信息
     * 
     * @param shelf 货架信息
     * @return 结果
     */
    public int insertShelf(Shelf shelf);

    /**
     * 修改货架信息
     * 
     * @param shelf 货架信息
     * @return 结果
     */
    public int updateShelf(Shelf shelf);

    /**
     * 删除货架信息
     * 
     * @param id 货架信息主键
     * @return 结果
     */
    public int deleteShelfById(Long id);

    /**
     * 批量删除货架信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteShelfByIds(Long[] ids);
}
