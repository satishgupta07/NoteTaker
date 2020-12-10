package com.satishkrgupta.notetaker.servlets;

import com.satishkrgupta.notetaker.entities.Note;
import com.satishkrgupta.notetaker.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class SaveNoteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try {
            //title,content fetch
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            Note note = new Note(title, content, new Date());
            
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            
            session.save(note);
            
            tx.commit();
            session.close();
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
            out.println("<h1 style='text-align:center;'><a href='allnotes.jsp'>View All Notes</a></h1>");
            
        } catch (Exception e) {
            e.printStackTrace();
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

}
