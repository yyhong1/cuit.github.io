package cn.edu.cuit.service;

import cn.edu.cuit.entity.Spending;

import java.util.List;

/**
 * @Author: xxx
 * @Date: 2022/12/15 16:29
 */
public interface LineOfLimitService {
    public boolean addLimit(Spending limit);
}
