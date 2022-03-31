package dat.startcode.web;

import dat.startcode.config.ApplicationStart;
import dat.startcode.entities.SaunaEvent;
import dat.startcode.exceptions.DatabaseException;
import dat.startcode.persistence.ConnectionPool;
import dat.startcode.persistence.EventMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletConfirmation", value = "/ServletConfirmation")
public class ServletConfirmation extends HttpServlet
{

    ConnectionPool connectionPool = null;

    @Override
    public void init() throws ServletException
    {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        EventMapper eventMapper = new EventMapper(connectionPool);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        int eventID = Integer.parseInt(request.getParameter("saunaevent"));

        try {
            SaunaEvent saunaEvent = eventMapper.getEvent(eventID);
            request.setAttribute("saunaevent", saunaEvent);
        } catch (DatabaseException e) {
            e.printStackTrace();
        }

        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("mobile", mobile);


                request.getRequestDispatcher("WEB-INF/confirmation.jsp").forward(request, response);
    }
}
