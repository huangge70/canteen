package com.canteen.dao;

import com.canteen.pojo.Takeaway;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface TakeawayMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Takeaway record);

    int insertSelective(Takeaway record);

    Takeaway selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Takeaway record);

    int updateByPrimaryKey(Takeaway record);

    int updateTakeawayStatus(Integer id);

    List<Takeaway> selectByParam(@Param("address") String address,@Param("ophone") String ophone);

    List<Takeaway> selectByDelivery(int uid);
}