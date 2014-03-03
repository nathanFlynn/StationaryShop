package stationary_shop.entity;

import javax.persistence.*;

@Entity
@Table(name = "printJob")

public class PrintJob {
    @Id
    @Column(name = "printID")
    private int PrintID;
    
    @Column(name = "priceperpage")
    private float PriceperPage;
    
    @Column(name = "pagesize")
    private String PageSize;
    
    // constructor
    public PrintJob() {
    }
    
    // ID auto-added by database
    public PrintJob(String PageSize, float PriceperPage){
        this.PageSize = PageSize;
        this.PriceperPage = PriceperPage;
       
    }
    
    // getters
    public int getID() { return PrintID; }
    public float getPriceperPage() { return PriceperPage; }
    public String getPageSize() { return PageSize; }  
}
