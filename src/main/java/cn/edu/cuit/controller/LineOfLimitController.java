package cn.edu.cuit.controller;

import cn.edu.cuit.VO.Status;
import cn.edu.cuit.VO.UserAndSpendingVO;
import cn.edu.cuit.VO.status.AccountTypeAddStatus;
import cn.edu.cuit.VO.status.LimitListStatus;
import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.entity.Spending;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.LimitManagerService;
import cn.edu.cuit.service.LineOfLimitService;
import cn.edu.cuit.service.SaveGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/limit")
public class LineOfLimitController {
    @Autowired
    private LineOfLimitService lineOfLimitService;
	@Autowired
	private LimitManagerService limitManagerService;
    @Autowired
    private SaveGoalService saveGoalService;
    
    @RequestMapping(value = {"/index"})
    public String toLimitIndex() {
        // 跳转到limitmanager.jsp页面。
        return "limitmanager";
    }


    @RequestMapping(value = {"/page"})
    public String toLineOfLimit() {
        // 跳转到SaveGoal.jsp页面。
        return "lineoflimit";
    }

    @RequestMapping(value = {"/setlimit"})
    @ResponseBody
    public Status doLimit(HttpSession session, @RequestBody Spending limit){
        Status status=new Status();
        lineOfLimitService.addLimit(limit);
        status.setCode(200);
        status.setInfo("设置额度成功");
        return status;
    }

    @RequestMapping(value={"/getmembers"})
    @ResponseBody
    public List<User> getMembers(HttpSession session, @RequestBody User user){
        return saveGoalService.getAllUser(user.getUid());
    }
    
    @RequestMapping(value={"/getAllLimit"})
    @ResponseBody
    public LimitListStatus getAllLimit(HttpSession session, Integer page,Integer limit){
    	LimitListStatus limitListStatus = new LimitListStatus();
    	User user = (User) session.getAttribute("user");
    	List<UserAndSpendingVO> usVOList = limitManagerService.getAllLimit(user.getUid(), page, limit);
    	limitListStatus.setData(usVOList);
    	return limitListStatus;
    }
    

    //删除指定id的账目类型
    @RequestMapping(value = {"/delete"})
    @ResponseBody
    public Status deleteLimit(HttpSession session, @RequestBody Spending limit){
    	Status delStatus = new Status();
        limitManagerService.deleteLimit(limit.getSid());
        delStatus.setCode(200);
        delStatus.setInfo("删除成功");
        return delStatus;
    }
}
