package cn.edu.cuit.service;

import cn.edu.cuit.entity.Deposit;
import cn.edu.cuit.entity.User;

import java.util.List;

/**
 * @Author: xxx
 * @Date: 2022/12/14 14:59
 */
public interface SaveGoalService {

    //判断是否存在进行的目标
    public Integer isRun(int uid);

    //添加存款目标
    public boolean addSaveGoal(Deposit savegoal);

    //获取家庭所有成员
    public List<User> getAllUser(int uid);

}
