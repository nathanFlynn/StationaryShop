/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package stationary_shop.cart;

import stationary_shop.entity.PrintJob;

/**
 *
 * @author User
 */
public class JobCart {
    PrintJob printJob;
    short quantity;
    String URL;

    public JobCart(PrintJob printJob,String URL) {
        this.printJob = printJob;
        this.URL = URL;
        quantity = 1;
    }

    public PrintJob getJob() {
        return printJob;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }
    
    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public void incrementQuantity() {
        quantity++;
    }

    public void decrementQuantity() {
        quantity--;
    }

    public double getTotal() {
        double amount = 0;
        amount = (this.getQuantity() * printJob.getPriceperPage());
        return amount;
    }

}