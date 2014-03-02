package stationary_shop.entity;

import javax.persistence.*;

@Entity
@Table(name = "employee")

public class Employee {
    @Id
    @Column(name = "id")
    private int id;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "password")
    private String password;
    
    // constructor
    public Employee() {
    }
    
    // ID auto-added by database
    public Employee(String name, String email, String password){
        this.name = name;
        this.email = email;
        this.password = password;
    }
    
    // getters
    public int getID() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }  
}
