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
import java.util.ArrayList;

@WebServlet(name = "ServletBooking", value = "/ServletBooking")
public class ServletBooking extends HttpServlet {

    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException
    {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        EventMapper eventMapper = new EventMapper(connectionPool);

        try {
            ArrayList<SaunaEvent> eventArrayList = eventMapper.getAllEvents();
        ServletContext servletContext = getServletContext();

        servletContext.setAttribute("eventArrayList", eventArrayList);

        log("Nu bliver alle events hentet fra databasen");


        } catch (DatabaseException e) {
            e.printStackTrace();
        }


        request.getRequestDispatcher("WEB-INF/booking.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
