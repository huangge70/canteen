package com.canteen.pojo;

public class Salestatistics {
    private Integer month;
    private Double sum;

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    @Override
    public String toString() {
        return "Salestatistics{" +
                "month=" + month +
                ", sum=" + sum +
                '}';
    }
}
