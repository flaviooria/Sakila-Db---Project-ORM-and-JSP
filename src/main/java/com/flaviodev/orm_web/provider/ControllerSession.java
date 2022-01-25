/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flaviodev.orm_web.provider;

import java.util.ArrayList;
import models.Film;
import models.FilmCreator;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author flavio
 */
public class ControllerSession {

    public static Film getFilmById(int id, Session session) {
        ArrayList<Film> films = new ArrayList<>();
        Transaction transaction = null;
        Film film = null;
        try {
            transaction = session.beginTransaction();
            String sql = "select * from film where film.film_id =:id";
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(Film.class);
            query.setParameter("id", id);
            films = (ArrayList<Film>) query.list();

            if (!films.isEmpty()) {
                film = films.get(0);
            }

            transaction.commit();
            return film;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {

            session.close();

        }
        return film;
    }

    public static ArrayList<Film> getMovieByTerm(String q, String term, Session session) {
        ArrayList<Film> films = new ArrayList<>();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            String sql = "select * from film where " + term + " like :query";
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(Film.class);

            if (term.equals("film.rating")) {
                query.setParameter("query", "%" + q);
            } else {
                query.setParameter("query", "%" + q + "%");
            }

            films = (ArrayList<Film>) query.list();

            transaction.commit();
            return films;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {

            session.close();

        }
        return films;
    }

    public static boolean deleteMovieById(int id, Session session) {
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            String sql = "delete from film where film.film_id=:id";
            SQLQuery query = session.createSQLQuery(sql);
            query.setParameter("id", id);
            int row = query.executeUpdate();

            transaction.commit();

            return transaction.wasCommitted() && row == 1;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }

        return false;
    }

    public static ArrayList<Film> getAllMovies(Session session) {
        ArrayList<Film> films = new ArrayList<>();
        Transaction transaction = session.beginTransaction();

        try {
            String sql = "FROM Film";
            Query query = session.createQuery(sql);
            query.setMaxResults(30);
            films = (ArrayList<Film>) query.list();

            transaction.commit();
        } catch (Exception e) {
            if (transaction == null) {
                transaction.rollback();
            }
        } finally {

            session.close();

        }
        return films;
    }

    public static boolean createFilm(FilmCreator film, Session session) {

        Transaction transaction = session.beginTransaction();

        try {

            String hlq = "insert into film (film.title , film.description, film.language_id, film.rating,film.release_year) values (:title,:desc,:l_id,:rat,:year)";
            Query query = session.createSQLQuery(hlq);
            query.setParameter("title", film.getTitle());
            query.setParameter("desc", film.getDescription());
            query.setParameter("l_id", film.getLanguage_id());
            query.setParameter("rat", film.getClasification());
            query.setParameter("year", film.getRelease_year());
            int row = query.executeUpdate();

            transaction.commit();
            return transaction.wasCommitted() && row == 1;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction == null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }

        return false;
    }

    public static boolean updateFilm(FilmCreator film, Session session) {

        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            String sql = "update film set film.title =:title ,film.description =:desc , film.language_id =:l_id, film.rating =:rat ,film.release_year =:year where film.film_id =:id_film";
            SQLQuery query = session.createSQLQuery(sql);
            query.setParameter("title", film.getTitle());
            query.setParameter("desc", film.getDescription());
            query.setParameter("l_id", film.getLanguage_id());
            query.setParameter("rat", film.getClasification());
            query.setParameter("year", film.getRelease_year());
            query.setParameter("id_film", film.getId());
            int row = query.executeUpdate();

            transaction.commit();

            return transaction.wasCommitted() && row == 1;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return false;
    }
}
