package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>(); // ArrayList를 Product로 캐스팅
    private static ProductRepository instance = new ProductRepository();
    public static ProductRepository getInstance(){
        return instance;
    }


	public ProductRepository() {
		Product Portal = new Product("400", "Portal", 12000);
		Portal.setDescription("Portal™ is a new single player game from Valve. Set in the mysterious Aperture Science Laboratories, Portal has been called one of the most innovative new games on the horizon and will offer gamers hours of unique gameplay.");
		Portal.setCategory("Puzzle game");
		Portal.setDeveloper("Valve");
        Portal.setPublisher("Valve");
        Portal.setThumbnail("image/thumbnail/Portal.jpg");
        Portal.setPicture("image/picture/Portal_Picture_1.jpg");
        Portal.setBiglogo("image/biglogo/Portal_Big_logo.jpg");
        
		Product Portal2 = new Product("620", "Portal 2", 12000);
		Portal2.setDescription("The \"Perpetual Testing Initiative\" has been expanded to allow you to design co-op puzzles for you and your friends!");
		Portal2.setCategory("Puzzle");
		Portal2.setDeveloper("Valve");
        Portal2.setPublisher("Valve");
        Portal2.setThumbnail("image/thumbnail/Portal_2.jpg");
        Portal2.setPicture("image/picture/Portal_2_Picture_1.jpg");
        Portal2.setBiglogo("image/biglogo/Portal_2_Big_logo.jpg");

		Product Baba = new Product("736260", "Baba Is You", 15000);
		Baba.setDescription("Baba Is You is a puzzle game where the rules you have to follow are present as blocks you can interact with. By manipulating them, you can change how the game works, repurpose things you find in the levels and cause surprising interactions!");
		Baba.setCategory("Puzzle");
		Baba.setDeveloper("Hempuli Oy");
        Baba.setPublisher("Hempuli Oy");
        Baba.setThumbnail("image/thumbnail/Baba_Is_You.jpg");
        Baba.setPicture("image/picture/Baba_Is_You_Picture_1.jpg");
        Baba.setBiglogo("image/biglogo/Baba_Is_You_Big_logo.jpg");
		
		// 위와 같이 상품 초기화 하고 아래에 상품을 추가

		listOfProducts.add(Portal);
		listOfProducts.add(Portal2);
		listOfProducts.add(Baba);
		// listOfProducts.add(상품명);
	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
    
    public void addProduct(Product product) {
        listOfProducts.add(product);
    }
    
    public Product getProductById(String productId) {
        for (Product product : listOfProducts) {
            if (product.getProductId().equals(productId)) {
                return product;
            }
        }
        return null; // 상품이 없을 경우 null 반환
    }
}
