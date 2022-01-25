/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flaviodev.orm_web;

import com.flaviodev.orm_web.provider.ControllerSession;
import helpers.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Film;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author flavio
 */
@WebServlet(name = "getDataMovies", urlPatterns = {"/getDataMovies"})
public class getDataMovies extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here.  You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet getDataMovies</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getDataMovies at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //Esta instrucción se usará en todas las clases en las que deseemos //realizar operaciones con nuestra base de datos.
        SessionFactory sF = HibernateUtil.getSessionFactory();
        Session session = sF.openSession();

        /**
         * Aqui lo que hacemos con el gson builder es registrar nuestro
         * hibernate proxy que es la que nos permitira poder convetir nuestro
         * pojos a json.
         */
        /*GsonBuilder b = new GsonBuilder();
        b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
        Gson gson = b.create();*/
        String query_name = request.getParameter("query");
        String value = request.getParameter("filter_searched");

        System.out.println("valor del select: " + value);

        String filter = "film.title"; //value by default

        switch (value) {
            case "1":
                filter = "film.title";
                break;
            case "2":
                filter = "film.description";
                break;

            case "3":
                filter = "film.rating";
                break;
        }

        System.out.println("filter es: " + filter);

        ArrayList<Film> films = ControllerSession.getMovieByTerm(query_name, filter, session);

        request.getSession().setAttribute("films_list", films);
        response.sendRedirect("./index.jsp");


        /*String json = gson.toJson(films);
        System.out.println("la json  es: " + json);*/
 /*response.setContentType("aplication/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);*/
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
