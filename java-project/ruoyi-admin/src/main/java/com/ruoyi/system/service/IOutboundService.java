package com.ruoyi.system.service;

import com.ruoyi.system.domain.Outbound;
import java.util.List;

public interface IOutboundService {

    List<Outbound> selectOutboundList(Outbound outbound);

    Outbound selectOutboundById(Long id);

    int insertOutbound(Outbound outbound);

    int updateOutbound(Outbound outbound);

    int deleteOutboundByIds(Long[] ids);

    int deleteOutboundById(Long id);
}