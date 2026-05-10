package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Outbound;
import java.util.List;

public interface OutboundMapper {

    List<Outbound> selectOutboundList(Outbound outbound);

    Outbound selectOutboundById(Long id);

    int insertOutbound(Outbound outbound);

    int updateOutbound(Outbound outbound);

    int deleteOutboundById(Long id);

    int deleteOutboundByIds(Long[] ids);
}