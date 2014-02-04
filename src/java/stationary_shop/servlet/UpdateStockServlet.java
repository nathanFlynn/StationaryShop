package stationary_shop.servlet;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import stationary_shop.entity.Product;

/**
 *
 * @author Dara
 */
@WebServlet(name = "UpdateStockServlet", urlPatterns = {"/UpdateStock"})
public class UpdateStockServlet extends HttpServlet {

    @PersistenceUnit
    private EntityManagerFactory emf;
    
    @Resource
    private UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        assert emf != null;  //Make sure injection went through correctly.
        EntityManager em = null;
        
        try {
            // Get parameters from the .jsp page.
            int id = Integer.parseInt(request.getParameter("id"));
            int newStockLevel = Integer.parseInt(request.getParameter("stockLevel"));
            
            /*
            // Find the product by the ID entered.
            Product prod = em.getReference(Product.class, id);
            
            if(prod == null){
            utx.begin();
            
            em = emf.createEntityManager();
            prod.setStock(newStockLevel);
            em.persist(prod);
            
            utx.commit();
            }
            else
                System.out.println("FFS");
            */
            
            String updateString = "UPDATE Product SET stock = :stock WHERE id = :id";
            
            Query q = em.createQuery(updateString);
            q.setParameter("id", id);
            q.setParameter("stock", newStockLevel);
            
            //utx.begin();
            //em = emf.createEntityManager();
            q.executeUpdate();
            //dutx.commit();
            
            
            //Forward to the jsp page for rendering
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
