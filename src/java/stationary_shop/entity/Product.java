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
    
    // constructor
    public Product() {
    }
    
    // ID auto-added by database
    public Product(String name, String description, float price){
        this.name = name;
        this.description = description;
        this.price = price;
    }
    
    // getters
    public int getID() { return id; }
    public String getName() { return name; }
    public String getDesc() { return description; }
    public float getPrice() { return price; }  
}
