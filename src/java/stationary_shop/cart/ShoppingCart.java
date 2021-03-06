/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stationary_shop.cart;

import java.text.DecimalFormat;
import stationary_shop.entity.Product;
import stationary_shop.entity.PrintJob;
import java.util.*;

/**
 *
 * @author tgiunipero
 */
public class ShoppingCart {

    List<ShoppingCartItem> items;
    List<JobCart> jobs;
    int numberOfItems;
    double total;

    public ShoppingCart() {
        items = new ArrayList<ShoppingCartItem>();
        jobs= new ArrayList<JobCart>();
        numberOfItems = 0;
        total = 0;
    }

    /**
     * Adds a <code>ShoppingCartItem</code> to the <code>ShoppingCart</code>'s
     * <code>items</code> list. If item of the specified <code>product</code>
     * already exists in shopping cart list, the quantity of that item is
     * incremented.
     *
     * @param product the <code>Product</code> that defines the type of shopping
     * cart item
     * @see ShoppingCartItem
     */
    public synchronized void addItem(Product product) {
        boolean newItem = true;

        for (ShoppingCartItem scItem : items) {
            if (scItem.getProduct().getID() == product.getID()) {

                newItem = false;
                scItem.incrementQuantity();
            }
        }

        if (newItem) {
            ShoppingCartItem scItem = new ShoppingCartItem(product);
            items.add(scItem);
        }
    }
    public synchronized void addjob(PrintJob printJob, String URL) {
        boolean newJob = true;

        for (JobCart scJobs : jobs) {
            if (scJobs.getJob().getID() == printJob.getID() && scJobs.getURL() == URL) {

                newJob = false;
                scJobs.incrementQuantity();
            }
        }

        if (newJob) {
            JobCart scJobs= new JobCart(printJob,URL);
            jobs.add(scJobs);
        }
    }
    public synchronized void decementItemQuantity(Product product) {
        boolean remove = false;
        for (ShoppingCartItem scItem : items) {
            if (scItem.getProduct().getID() == product.getID()) {

                if (scItem.quantity < 1) {
                    remove = true;
                }
                else {
                    scItem.decrementQuantity();
                }
            }
        }
        
        if (remove) {
            this.removeItem(product);
        }
    }
    
    public synchronized void decementJobQuantity(PrintJob printJob) {
        boolean remove = false;
        for (JobCart scjobs : jobs) {
            if (scjobs.getJob().getID() == printJob.getID()) {

                if (scjobs.quantity < 1) {
                    remove = true;
                }
                else {
                    scjobs.decrementQuantity();
                }
            }
        }
        
        if (remove) {
            this.removeJob(printJob);
        }
    }

    // remove an item
    public synchronized void removeItem(Product prod) {
        ShoppingCartItem item = null;
        // get ShoppingCartItem
        for (ShoppingCartItem scItem : items) {
            if (scItem.getProduct().getID() == prod.getID()) {
                item = scItem;
            }
        }

        items.remove(item);
    }
    
    public synchronized void removeJob(PrintJob printJob) {
        JobCart job = null;
        // get ShoppingCartItem
        for (JobCart scjobs : jobs) {
            if (scjobs.getJob().getID() == printJob.getID()) {
                job = scjobs;
            }
        }

        jobs.remove(job);
    }

    /**
     * Updates the <code>ShoppingCartItem</code> of the specified
     * <code>product</code> to the specified quantity. If '<code>0</code>' is
     * the given quantity, the <code>ShoppingCartItem</code> is removed from the
     * <code>ShoppingCart</code>'s <code>items</code> list.
     *
     * @param product the <code>Product</code> that defines the type of shopping
     * cart item
     * @param quantity the number which the <code>ShoppingCartItem</code> is
     * updated to
     * @see ShoppingCartItem
     */
    public synchronized void update(Product product, String quantity) {

        short qty = -1;

        // cast quantity as short
        qty = Short.parseShort(quantity);

        if (qty >= 0) {

            ShoppingCartItem item = null;

            for (ShoppingCartItem scItem : items) {

                if (scItem.getProduct().getID() == product.getID()) {

                    if (qty != 0) {
                        // set item quantity to new value
                        scItem.setQuantity(qty);
                    }
                    else {
                        // if quantity equals 0, save item and break
                        item = scItem;
                        break;
                    }
                }
            }

            if (item != null) {
                // remove from cart
                items.remove(item);
            }
        }
    }
    
    public synchronized void updatejobs(PrintJob printJob, String quantity) {

        short qty = -1;

        // cast quantity as short
        qty = Short.parseShort(quantity);

        if (qty >= 0) {

            JobCart job = null;

            for (JobCart scjobs : jobs) {

                if (scjobs.getJob().getID() == printJob.getID()) {

                    if (qty != 0) {
                        // set item quantity to new value
                        scjobs.setQuantity(qty);
                    }
                    else {
                        // if quantity equals 0, save item and break
                        job = scjobs;
                        break;
                    }
                }
            }

            if (job != null) {
                // remove from cart
                items.remove(job);
            }
        }
    }

    /**
     * Returns the list of <code>ShoppingCartItems</code>.
     *
     * @return the <code>items</code> list
     * @see ShoppingCartItem
     */
    public synchronized List<ShoppingCartItem> getItems() {

        return items;
    }
    
    public synchronized List<JobCart> getjobs() {

        return jobs;
    }

    /**
     * Returns the sum of quantities for all items maintained in shopping cart
     * <code>items</code> list.
     *
     * @return the number of items in shopping cart
     * @see ShoppingCartItem
     */
    public synchronized int getNumberOfItems() {

        numberOfItems = 0;

        for (ShoppingCartItem scItem : items) {

            numberOfItems += scItem.getQuantity();
        }

        return numberOfItems;
    }

    /**
     * Returns the sum of the product price multiplied by the quantity & 
     * sum of the job price multiplied by the quantity for all
     * items in shopping cart list. This is the total cost excluding the
     * surcharge.
     *
     * @return the cost of all items times their quantities
     * @see ShoppingCartItem
     */
    public synchronized double getSubtotal() {

        double amount = 0;

        for (ShoppingCartItem scItem : items) {

            Product product = (Product) scItem.getProduct();
            amount += (scItem.getQuantity() * product.getPrice());  
            
        }
        for (JobCart scjobs : jobs) {

            PrintJob job = (PrintJob) scjobs.getJob();
            amount += (scjobs.getQuantity() * job.getPriceperPage());  
            
        }

        return amount;
    }

    /**
     * Calculates the total cost of the order. This method adds the subtotal to
     * the designated surcharge and sets the <code>total</code> instance
     * variable with the result.
     *
     * @param surcharge the designated surcharge for all orders
     * @see ShoppingCartItem
     */
    public synchronized void calculateTotal(String surcharge) {

        double amount = 0;

        // cast surcharge as double
        double s = Double.parseDouble(surcharge);

        amount = this.getSubtotal();
        amount += s;

        total = amount;
    }

    /**
     * Returns the total cost of the order for the given
     * <code>ShoppingCart</code> instance.
     *
     * @return the cost of all items times their quantities plus surcharge
     */
    public synchronized double getTotal() {
        calculateTotal("0.0");
        return total;
    }

    // returns total as formatted string
    public String getTotalString() {
        getTotal();

        DecimalFormat numberFormat = new DecimalFormat("#.00");
        return numberFormat.format(total);
    }

    /**
     * Empties the shopping cart. All items are removed from the shopping cart
     * <code>items</code> list, <code>numberOfItems</code> and
     * <code>total</code> are reset to '<code>0</code>'.
     *
     * @see ShoppingCartItem
     */
    public synchronized void clear() {
        items.clear();
        jobs.clear();
        numberOfItems = 0;
        total = 0;
    }

}
