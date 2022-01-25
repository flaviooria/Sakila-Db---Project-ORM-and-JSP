/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flaviodev.orm_web;

import com.flaviodev.orm_web.provider.ControllerSession;
import helpers.HibernateUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Film;
import models.FilmCreator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author flavio
 */
@WebServlet(name = "updateFilm", urlPatterns = {"/updateFilm"})
public class updateFilm extends HttpServlet {

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
        int film_id = Integer.parseInt(request.getParameter("id_movie"));

        SessionFactory sF = HibernateUtil.getSessionFactory();
        Session session = sF.openSession();

        Film film = ControllerSession.getFilmById(film_id, session);

        if (film != null) {
            request.getSession().setAttribute("film", film);
            response.sendRedirect("./pages/edit.jsp");
        } else {
            request.getSession().setAttribute("hasError", "true");
            request.getSession().setAttribute("err", "Película no encontrada!!!");
            response.sendRedirect("./index.jsp");
        }
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
        request.setCharacterEncoding("UTF-8");
        int film_id = Integer.parseInt(request.getParameter("film_id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String year = request.getParameter("year").substring(0, 4);
        String clasificaction = request.getParameter("clasification");
        String language_id = request.getParameter("languages-option");

        System.out.println(title);
        System.out.println(description);
        System.out.println(year);
        System.out.println(clasificaction);
        System.out.println(language_id);

        SessionFactory sF = HibernateUtil.getSessionFactory();
        Session session = sF.openSession();

        FilmCreator film = new FilmCreator(title, description, clasificaction, Integer.parseInt(language_id), Integer.parseInt(year));
        film.setId(film_id);

        if (ControllerSession.updateFilm(film, session)) {
            request.getSession().setAttribute("hasError", "false");
            response.sendRedirect("./pages/edit.jsp");
        } else {
            request.getSession().setAttribute("hasError", "true");
            response.sendRedirect("./pages/edit.jsp");
        }
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
