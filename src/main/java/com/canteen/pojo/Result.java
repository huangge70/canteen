package com.canteen.pojo;

public class Result {
    private String dname;
    private int count;

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Result{" +
                "dname='" + dname + '\'' +
                ", count=" + count +
                '}';
    }
}
