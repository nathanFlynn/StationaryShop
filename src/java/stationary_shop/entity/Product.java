// @author Dara

package stationary_shop.entity;

import javax.persistence.*;

@Entity
@Table(name = "product")

public class Product {
    @Id
    @Column(name = "id")
    private int id;
    
    @Column(name = "name")
    private String name;
        
    @Column(name = "description")
    private String description;
    
    @Column(name = "price")
    private float price;
    
    @Column(name = "stock")
    private int stock;
    
    // constructor
    public Product() {
    }
    
    // ID auto-added by database
    public Product(String name, String description, float price, int stock){
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
    }
    
    // getters
    public int getID() { return id; }
    public String getName() { return name; }
    public String getDesc() { return description; }
    public float getPrice() { return price; }  
    public int getStock()   { return stock; }
    
    // setters
    public void setStock(int newStock){
        this.stock = newStock;
    }
}
