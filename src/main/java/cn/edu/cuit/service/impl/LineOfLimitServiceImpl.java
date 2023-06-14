package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.SpendingMapper;
import cn.edu.cuit.entity.Spending;
import cn.edu.cuit.entity.SpendingExample;
import cn.edu.cuit.service.LineOfLimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: xxx
 * @Date: 2022/12/15 16:31
 */
@Service
public class LineOfLimitServiceImpl implements LineOfLimitService {
    @Autowired
    SpendingMapper spendingMapper;

    @Override
    public boolean addLimit(Spending limit) {
    	SpendingExample spendingExample = new SpendingExample();
    	spendingExample.createCriteria().andUidEqualTo(limit.getUid());
    	long count = spendingMapper.countByExample(spendingExample);
    	if(count > 0) {
    		return false;
    	}
    	
        int rs=spendingMapper.insert(limit);
        return rs>=1;
    }
}
