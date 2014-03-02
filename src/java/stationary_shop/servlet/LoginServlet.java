/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stationary_shop.servlet;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import stationary_shop.entity.Customer;
import stationary_shop.entity.Employee;

/**
 *
 * @author NFLYN_000
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    @PersistenceUnit
    private EntityManagerFactory emf;

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
            throws ServletException, IOException 
    {

        assert emf != null;  //Make sure injection went through correctly.
        EntityManager em = null;

        // get username & password
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        String type = request.getParameter("type");
        HttpSession session = request.getSession();

        // validate login information
        
        em = emf.createEntityManager();
        if("Employee".equals(type)) 
        {
            List employee = em.createQuery("select c from Employee c "
                + "where c.email = '" + email + "' and c.password = '" +password +"'").getResultList();
            

            if (!employee.isEmpty()) 
            {
                Employee empl = (Employee) employee.get(0);
                request.setAttribute("login", "Logged in!");
                session.setAttribute("email", email);
                session.setAttribute("name", empl.getName());
                session.setAttribute("password", password);
                session.setAttribute("type", type);
                session.setAttribute("logged_in", true);
            }
            else 
            {
                request.setAttribute("login", "Could not login!");
            }
        }
        else 
        {
            List customer = em.createQuery("select c from Customer c "
                    + "where c.email = '" + email + "' and c.password = '" +password +"'").getResultList();
            if (!customer.isEmpty()) 
            {
            Customer cust = (Customer) customer.get(0);
            request.setAttribute("login", "Logged in!");
            session.setAttribute("email", email);
            session.setAttribute("name", cust.getName());
            session.setAttribute("address", cust.getAddress());
            session.setAttribute("password", password);
            session.setAttribute("type", type);
            session.setAttribute("logged_in", true);
            }
            else 
            {
                request.setAttribute("login", "Could not login!");
            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);

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
