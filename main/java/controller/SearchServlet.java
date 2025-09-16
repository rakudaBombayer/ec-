package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.ECsiteDAO;
import model.Shohin;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String keyword = request.getParameter("keyword");
        String category = request.getParameter("category");

        ECsiteDAO dao = new ECsiteDAO();
        
        List<Shohin> shohinList = dao.searchShohin(keyword, category);

        request.setAttribute("shohinList", shohinList);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/menu.jsp");
        rd.forward(request, response);
    }
}