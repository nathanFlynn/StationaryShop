package stationary_shop.entity;

import javax.persistence.*;

@Entity
@Table(name = "customer")

public class Customer {
    @Id
    @Column(name = "id")
    private int id;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "address")
    private String address;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "password")
    private String password;
    
    // constructor
    public Customer() {
    }
    
    // ID auto-added by database
    public Customer(String name, String address, String email, String password){
        this.name = name;
        this.address = address;
        this.email = email;
        this.password = password;
    }
    
    // getters
    public int getID() { return id; }
    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getEmail() { return email; }  
}
