package cetpa;

public class User {
    
    public String userid,pass,email,num,city,type;

    public User(String userid, String pass, String email, String num, String city, String type) {
        this.userid = userid;
        this.pass = pass;
        this.email = email;
        this.num = num;
        this.city = city;
        this.type = type;
    }

    public String getCity() {
        return city;
    }

    public String getEmail() {
        return email;
    }

    public String getNum() {
        return num;
    }

    public String getPass() {
        return pass;
    }

    public String getType() {
        return type;
    }

    public String getUserid() {
        return userid;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
    
    
}
