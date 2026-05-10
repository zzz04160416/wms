package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 货架信息对象 shelf
 * 
 * @author ruoyi
 * @date 2026-05-06
 */
public class Shelf extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 货架ID */
    private Long id;

    /** 库位编码，如：A01、B02 */
    @Excel(name = "库位编码，如：A01、B02")
    private String locationCode;

    /** 库位名称（可选） */
    @Excel(name = "库位名称", readConverterExp = "可=选")
    private String locationName;

    /** 3D场景 X 坐标 */
    @Excel(name = "3D场景 X 坐标")
    private BigDecimal posX;

    /** 3D场景 Z 坐标 */
    @Excel(name = "3D场景 Z 坐标")
    private BigDecimal posZ;

    /** 最大容量（件数） */
    @Excel(name = "最大容量", readConverterExp = "件=数")
    private Long capacity;

    /** 状态：0-禁用 1-正常 2-维修中 */
    @Excel(name = "状态：0-禁用 1-正常 2-维修中")
    private Long status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setLocationCode(String locationCode) 
    {
        this.locationCode = locationCode;
    }

    public String getLocationCode() 
    {
        return locationCode;
    }

    public void setLocationName(String locationName) 
    {
        this.locationName = locationName;
    }

    public String getLocationName() 
    {
        return locationName;
    }

    public void setPosX(BigDecimal posX) 
    {
        this.posX = posX;
    }

    public BigDecimal getPosX() 
    {
        return posX;
    }

    public void setPosZ(BigDecimal posZ) 
    {
        this.posZ = posZ;
    }

    public BigDecimal getPosZ() 
    {
        return posZ;
    }

    public void setCapacity(Long capacity) 
    {
        this.capacity = capacity;
    }

    public Long getCapacity() 
    {
        return capacity;
    }

    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("locationCode", getLocationCode())
            .append("locationName", getLocationName())
            .append("posX", getPosX())
            .append("posZ", getPosZ())
            .append("capacity", getCapacity())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
