package beans;

public class Good {
    private String goods_id;
    private String goods_name;
    private String unitprice;
    private String details;
    private String photo;

    // 修改 getter 方法为 getPhoto()
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(String unitprice) {
        this.unitprice = unitprice;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "Good [goods_id=" + goods_id +
                ", goods_name=" + goods_name +
                ", unitprice=" + unitprice +
                ", details=" + details + ", photo=" + photo;
    }

    public Good() {
        super();
    }
}
