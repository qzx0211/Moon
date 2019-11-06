package com.baizhi.action;

import com.baizhi.entity.Pj;
import com.baizhi.entity.User;
import com.baizhi.service.UserServiceImpl;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;


//网络上修改的备注
public class UserAction {
    private String name;
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String login() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UserServiceImpl userService = new UserServiceImpl();
        if (name != null) {
            User user = userService.selectOne(name);
            if (password!=null){
                if(password.equals(user.getPassword())){
                    session.setAttribute("loginUser",user);
                    return "login";
                }else {
                    System.out.println(1);
                    return "sb";
                }
            }else {
                System.out.println(2);
                return "sb";
            }
        }else {
            System.out.println(3);
            return "sb";
        }

    }
    private List<Pj> pjs;

    public List<Pj> getPjs() {
        return pjs;
    }

    public void setPjs(List<Pj> pjs) {
        this.pjs = pjs;
    }

    public String AllPj(){
        UserServiceImpl userService = new UserServiceImpl();
        pjs = userService.selectPj();
        return "all";
    }
    private String wen;

    public String getWen() {
        return wen;
    }

    public void setWen(String wen) {
        this.wen = wen;
    }

    public String add(){
        System.out.println(wen);
        HttpSession session = ServletActionContext.getRequest().getSession();
        User user = (User)session.getAttribute("loginUser");
        UserServiceImpl userService = new UserServiceImpl();
        Pj pj = new Pj();
        pj.setPid(UUID.randomUUID().toString());
        pj.setText(wen);
        pj.setCount(1);
        pj.setUname(user.getName());
        userService.addPj(pj);
        return null;
    }
    private String pid;


    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }


    public String update(){

        UserServiceImpl userService = new UserServiceImpl();
        Pj pj = userService.selectPjOne(pid);
        int count=pj.getCount();
        System.out.println(count);
        userService.update(pid,count+1);

        return null;
    }
}
