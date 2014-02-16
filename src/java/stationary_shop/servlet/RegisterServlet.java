package stationary_shop.servlet;

import stationary_shop.entity.Customer;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import javax.persistence.PersistenceUnit;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManager;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

    @PersistenceUnit
    private EntityManagerFactory emf;

    @Resource
    private UserTransaction utx;

    // process requests for get and post
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        assert emf != null;  //Make sure injection went through correctly.
        EntityManager em = null;

        try {

            //Get the data from user's form
            String name = (String) request.getParameter("name");
            String address = (String) request.getParameter("address");
            String email = (String) request.getParameter("email");
            String password = (String) request.getParameter("password");

            //Create a customer instance out of it
            Customer customer = new Customer(name, address, email, password);

            //begin a transaction
            utx.begin();
            //create an em. 
            //Since the em is created inside a transaction, it is associsated with 
            //the transaction
            em = emf.createEntityManager();
            //persist the person entity
            em.persist(customer);
            //commit transaction which will trigger the em to 
            //commit newly created entity into database
            utx.commit();

            //Forward to ListPerson servlet to list persons along with the newly
            //created person above
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex);
        } finally {
            //close the em to release any resources held up by the persistebce provider
            if (em != null) {
                em.close();
            }
        }
    }

    // handles get
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // handles post
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
}
