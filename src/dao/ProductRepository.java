package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>(); // ArrayList를 Product로 캐스팅

	public ProductRepository() {
		Product Portal = new Product("400", "Portal", 12000);
		Portal.setDescription("Portal™ is a new single player game from Valve. Set in the mysterious Aperture Science Laboratories, Portal has been called one of the most innovative new games on the horizon and will offer gamers hours of unique gameplay.");
		Portal.setCategory("Puzzle game");
		Portal.setManufacturer("Valve");
		Portal.setUnitsInStock(1000);
		Portal.setCondition("New");
        Portal.setThumbnail("image/Portal1.jpg");
        
		Product Portal2 = new Product("620", "Portal 2", 12000);
		Portal2.setDescription("The \"Perpetual Testing Initiative\" has been expanded to allow you to design co-op puzzles for you and your friends!");
		Portal2.setCategory("Puzzle");
		Portal2.setManufacturer("Valve");
		Portal2.setUnitsInStock(1000);
		Portal2.setCondition("New");
        Portal2.setThumbnail("image/Portal2.jpg");

		Product Baba = new Product("736260", "Baba Is You", 15000);
		Baba.setDescription("Baba Is You is a puzzle game where the rules you have to follow are present as blocks you can interact with. By manipulating them, you can change how the game works, repurpose things you find in the levels and cause surprising interactions!");
		Baba.setCategory("Puzzle");
		Baba.setManufacturer("Hempuli Oy");
		Baba.setUnitsInStock(1000);
		Baba.setCondition("New");
        Baba.setThumbnail("image/baba.jpg");
		
		// 위와 같이 상품 초기화 하고 아래에 상품을 추가

		listOfProducts.add(Portal);
		listOfProducts.add(Portal2);
		listOfProducts.add(Baba);
		// listOfProducts.add(상품명);
	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
}
