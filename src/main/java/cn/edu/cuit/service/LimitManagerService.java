package cn.edu.cuit.service;

import cn.edu.cuit.VO.UserAndSpendingVO;

import java.util.List;

/**
 * @Author: xxx
 * @Date: 2022/12/16 15:40
 */
public interface LimitManagerService {
    //查询家庭成员额度
    public List<UserAndSpendingVO> getAllLimit(int uid,Integer page,Integer limit);
    // 删除
	public void deleteLimit(Integer sid);

}
