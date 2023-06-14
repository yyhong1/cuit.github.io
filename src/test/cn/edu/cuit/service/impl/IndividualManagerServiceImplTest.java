package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.SaveGoalCombination;
import cn.edu.cuit.entity.Deposit;
import cn.edu.cuit.service.IndividualManagerService;
import cn.edu.cuit.service.SaveGoalService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

/**
 * @Author: xxx
 * @Date: 2022/12/16 22:36
 */
public class IndividualManagerServiceImplTest {
    private ApplicationContext applicationContext;

    @Autowired
    private IndividualManagerService individualManagerService;
    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 导入需要测试的
        individualManagerService = applicationContext.getBean(IndividualManagerService.class);
    }

    @Test
    public void getIndividualState() {
        SaveGoalCombination saveGoalCombination=new SaveGoalCombination();
        Deposit deposit=new Deposit();
        deposit.setUid(1);
        saveGoalCombination.setPage(1);
        saveGoalCombination.setLimit(10);
        saveGoalCombination.setUid(1);
        //System.out.println(individualManagerService.getHistoryGoal(saveGoalCombination).size());
        //System.out.println(individualManagerService.getCountHistoryGoal(saveGoalCombination));
        System.out.println(individualManagerService.getIndividualState(1).getComplete());
    }
}