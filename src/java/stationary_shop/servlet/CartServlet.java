/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stationary_shop.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import stationary_shop.cart.ShoppingCart;
import stationary_shop.entity.Product;

/**
 *
 * @author NFLYN_000
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/Cart"})
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");

        String type = request.getParameter("commandType");
        String path;

        int itemID = Integer.parseInt(request.getParameter("productID"));
        
        // get item
        List<Product> productList = (List) session.getAttribute("productsList");
        Product prod = null;
        
        for (Product p : productList) {
            if (p.getID() == itemID) {
                prod = p;
            }
        }
        
        // return to catalog or cart
        if (type.equalsIgnoreCase("new")) {
            path = "catalog.jsp";        
        }
        else {
            path = "cart.jsp";
        }

        // new cart
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("shoppingCart", cart);
        }

        // remove item, add item, or clear cart
        if (type.equalsIgnoreCase("remove")) {
            cart.removeItem(prod);
        }
        else if (type.equalsIgnoreCase("clear")) {
            cart.clear();
        }
        else {
            cart.addItem(prod);
        }

        request.getRequestDispatcher(path).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
