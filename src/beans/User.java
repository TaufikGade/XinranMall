package beans;


public class User {
    private int user_id;
    private String username;
    private String password;
    // private String address; // 如果需要address字段，取消注释

    public int getId() {
        return user_id;
    }
    public void setId(int id) {
        this.user_id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    @Override
    public String toString() {
        return "User [user_id=" + user_id + ", username=" + username + ", password=" + password + "]";
    }

    public User(int user_id, String username, String password/*, String address*/) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        // this.address = address;
    }

    public User() {
        super();
    }
}
