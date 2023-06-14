package cn.edu.cuit.VO.status;

import java.util.List;

import cn.edu.cuit.VO.ListStatus;
import cn.edu.cuit.VO.UserAndSpendingVO;

public class LimitListStatus extends ListStatus {
    private List<UserAndSpendingVO> data;

    public List<UserAndSpendingVO> getData() {
        return data;
    }

    public void setData(List<UserAndSpendingVO> data) {
        this.data = data;
    }
}
