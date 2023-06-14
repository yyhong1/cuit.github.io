package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.ListStatus;
import cn.edu.cuit.entity.Deposit;

import java.awt.*;
import java.util.List;

/**
 * @Author: xxx
 * @Date: 2022/12/17 10:31
 */
public class GoalListStatus extends ListStatus {
    private List<Deposit>data;

    public List<Deposit> getData() {
        return data;
    }

    public void setData(List<Deposit> data) {
        this.data = data;
    }
}
