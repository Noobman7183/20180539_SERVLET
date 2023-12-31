package dto;
import java.io.Serializable; // 직렬화 클래스 연동

public class Product implements Serializable { // 인터페이스 선언

	private static final long serialVersionUID = -4274700572038677000L;

	private String productId;	//상품 아이디
	private String pname;		//상품명
	private Integer unitPrice; //상품 가격
	private String description; //상품 설명
	private String developer; //개발사
    private String publisher; //배급사
	private String category; 	//분류
    private String thumbnail; // 썸네일
    private String picture; // 이미지
    private String biglogo; // 큰 로고

    public Product() {
        super();
    }

    public Product(String productId, String pname, Integer unitPrice) {
        this.productId = productId;
        this.pname = pname;
        this.unitPrice = unitPrice;
    }

    public String getProductId() {
        return productId;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
		this.pname = pname;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}
    
    public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

    public String getThumbnail(){
        return thumbnail;
    }
    
    public void setThumbnail(String thumbnail){
        this.thumbnail = thumbnail;
    }
    
    public String getPicture(){
        return picture;
    }
    
    public void setPicture(String picture){
        this.picture = picture;
    }
    
    public String getBiglogo(){
        return biglogo;
    }
    
    public void setBiglogo(String biglogo){
        this.biglogo = biglogo;
    }
}
