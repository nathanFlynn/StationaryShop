// @author C

package stationary_shop.servlet;

import stationary_shop.entity.PrintJob;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.PersistenceUnit;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManager;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;

@WebServlet(name = "AddJobServlet", urlPatterns = {"/AddJob"})
public class AddJobServlet extends HttpServlet {

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
            String pagesize = (String) request.getParameter("pagesize");
            float priceperpage = Float.parseFloat(request.getParameter("priceperpage"));

            //Create a product instance out of it
            PrintJob printJob = new PrintJob(pagesize, priceperpage);

            //begin a transaction
            utx.begin();
            //create an em. 
            //Since the em is created inside a transaction, it is associsated with 
            //the transaction
            em = emf.createEntityManager();
            //persist the person entity
            em.persist(printJob);
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
