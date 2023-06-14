package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.UserAndSpendingVO;
import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.dao.SpendingMapper;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.*;
import cn.edu.cuit.service.LimitManagerService;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: xxx
 * @Date: 2022/12/16 15:44
 */
@Service
public class LimitManagerServiceImpl implements LimitManagerService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    SpendingMapper spendingMapper;
    @Autowired
    AccountMapper accountMapper;

    //额度使用情况
    @Override
    public List<UserAndSpendingVO> getAllLimit(int uid,Integer page,Integer limit) {
        List<UserAndSpendingVO> usVOList=new ArrayList<UserAndSpendingVO>();
        
        //获取家庭成员列表
        UserExample ueByUid=new UserExample();
        UserExample.Criteria uebCriteria=ueByUid.createCriteria();
        uebCriteria.andUidEqualTo(uid);
        int fid=userMapper.selectByExample(ueByUid).get(0).getFid();

        UserExample ueByFid=new UserExample();
        UserExample.Criteria uefCriteria=ueByFid.createCriteria();
        uefCriteria.andFidEqualTo(fid);
        uefCriteria.andIsAvaliableEqualTo(1);
        RowBounds rowBounds = new RowBounds((page - 1) * limit, limit);
        List<User> userList=userMapper.selectByExampleWithRowbounds(ueByFid, rowBounds);
        //
        SpendingExample se=new SpendingExample();
        SpendingExample.Criteria seCriteria=se.createCriteria();
        AccountExample accountExample = new AccountExample();
        AccountExample.Criteria accountCriteria=accountExample.createCriteria();

        for(int i=0;i<userList.size();i++){
            UserAndSpendingVO usVO=new UserAndSpendingVO();
            User fUser = userList.get(i);
            int fUid = fUser.getUid();
            seCriteria.andUidEqualTo(fUid);
            List<Spending> spendingList = spendingMapper.selectByExample(se);
            
            if(CollectionUtils.isEmpty(spendingList)) continue;
            
            Spending spending = spendingList.get(0);
            accountCriteria.andUidEqualTo(fUid);
            accountCriteria.andIsAvaliableEqualTo(1);
            List<Account> accountList = accountMapper.selectByExample(accountExample);
            long consumeAccount = 0;
            for(Account account : accountList) {
            	consumeAccount += account.getAmount();
            }
            
            usVO.setAmount(spending.getAmount());
            usVO.setSid(spending.getSid());
            usVO.setUid(fUid);
            usVO.setStartDate(spending.getStartDate());
            usVO.setEndDate(spending.getEndDate());
            usVO.setName(fUser.getName());
            usVO.setIsAvaliable(fUser.getIsAvaliable());
            usVO.setConsumption(consumeAccount);
            usVOList.add(usVO);
        }
        return usVOList;
    }

	@Override
	public void deleteLimit(Integer sid) {
		spendingMapper.deleteByPrimaryKey(sid);
	}
    
    
}
