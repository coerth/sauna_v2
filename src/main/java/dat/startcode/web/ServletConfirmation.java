package dat.startcode.web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletConfirmation", value = "/ServletConfirmation")
public class ServletConfirmation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");


        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("mobile", mobile);

        request.getRequestDispatcher("WEB-INF/confirmation.jsp").forward(request, response);
    }
}
