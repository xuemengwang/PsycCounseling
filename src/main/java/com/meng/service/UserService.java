package com.meng.service;

import com.meng.mapper.UserMapper;
import com.meng.model.User;
import com.meng.model.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:
 * @author: wangxuemeng
 * @create: 2018-04-02 15:05
 **/
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    //登陆验证
    public Map<String,Object> loginCheck(String userName, String password){
        //存储返回结果
        Map<String,Object> map = new HashMap<>();
        User user = null;
        //查询
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andPhoneEqualTo(userName);
        List<User> users = userMapper.selectByExample(example);
        for (User u :
                users) {
            if (password.equals(u.getPassword())) {
                user = u;
            }
        }
        //查询结果处理
        if (user!=null){
            //登陆成功
            map.put("status",1);
            map.put("user",user);
        }else {
            //登录失败
            map.put("status",0);
        }
        return map;
    }


    public void addNewUser(User user) {
        user.setAvatar("/image/default_avatar1.jpg");
        userMapper.insertSelective(user);
    }

    public User getUserById(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public boolean changePsw(Integer userId, String oldPsw, String newPsw) {
        User user = userMapper.selectByPrimaryKey(userId);
        if (user.getPassword().equals(oldPsw)){
            user.setPassword(newPsw);
            userMapper.updateByPrimaryKey(user);
            return true;
        }
        return false;
    }

    public void updateUserById(User user) {
        userMapper.updateByPrimaryKey(user);
    }


}
