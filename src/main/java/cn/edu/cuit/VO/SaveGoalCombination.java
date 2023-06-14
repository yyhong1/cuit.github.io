package cn.edu.cuit.VO;

import cn.edu.cuit.entity.Deposit;

/**
 * @Author: xxx
 * @Date: 2022/12/17 9:20
 */
public class SaveGoalCombination {
    private int limit;
    private int page;
    private int uid;

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}

