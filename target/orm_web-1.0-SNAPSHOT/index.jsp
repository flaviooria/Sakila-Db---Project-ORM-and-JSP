<%-- 
    Document   : index
    Created on : 20 ene. 2022, 12:11:18
    Author     : flavio
--%>

<%@page import="com.flaviodev.orm_web.provider.ControllerSession"%>
<%@page import="org.hibernate.Session"%>
<%@page import="helpers.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="models.Film"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session sessionH = sessionFactory.openSession();

    ArrayList<Film> all_films_searched = new ArrayList<>();
    ArrayList<Film> all_films_by_term = new ArrayList<>();

    if (session.getAttribute("films_list") != null) {
        all_films_by_term = (ArrayList<Film>) session.getAttribute("films_list");
        session.removeAttribute("films_list");
    }

    all_films_searched = ControllerSession.getAllMovies(sessionH);
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakila</title>
        <link rel="stylesheet" href="css/home.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Sakila</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./pages/create.jsp">Crear</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Search Bar -->
        <section class="container-fluid mt-5 search-bar mb-5">
            <div class="lead mb-3">Busca todo lo que quieras y crea tu lista de peliculas favoritas !!!</div>
            <div class="container-search">
                <!-- Dropdown Genre Movies -->
                <select name="filter_searched" id="filter_search" class="menu-genres btn btn-outline-dark dropdown-toggle">
                    <option selected value="0">Fitrar Género</option>
                    <option value="1">Nombre</option>
                    <option value="2">Descripcion</option>
                    <option value="3">Rating</option>
                </select>
                <!-- Form -->
                <form method="get" action="${pageContext.request.contextPath}/getDataMovies" class="form-search" autocomplete="off">
                    <input type="hidden" name="filter_searched" id="value_selected">
                    <input class="form-control text-secondary" id="input_search" type="search" placeholder="Buscar..." aria-label="Search"
                           name="query">
                    <button type="submit" id="btn-search" class="btn btn-outline-dark" >Buscar</button>
                </form>
            </div>
        </section>
        <!-- Aquí insertaremos la pelicula que busquen -->
        <%
            if (!all_films_by_term.isEmpty()) {
        %>
        <div class="wrapper">
            <div class="container-movies">
                <%
                    for (Film film : all_films_by_term) {
                %>
                <!-- Cards Created -->
                <div class="card" style="width: 18rem;">
                    <div class="card-header bg-secondary text-white">
                        <h5 class="card-title"><%=film.getTitle()%></h5>
                    </div>
                    <div class="card-body">
                        <p class="card-subtitle"><%=film.getDescription()%></p>
                        <p class="card-text mt-3"><b>Clasificación: </b><%=film.getRating()%></p>
                        <p class="card-text"><b>Año de realización: </b><%=film.getReleaseYear()%></p>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/updateFilm?id_movie=<%=film.getFilmId()%>" class="btn btn-secondary">Editar</a>
                            <a href="${pageContext.request.contextPath}/deleteFilm?id_movie=<%=film.getFilmId()%>" class="btn btn-danger">Eliminar</a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <% } else {%>

        <%
            if (!all_films_searched.isEmpty()) {
        %>
        <div class="wrapper">
            <div class="container-movies">
                <%
                    for (Film film : all_films_searched) {

                %>
                <!-- Cards Created -->
                <div class="card" style="width: 18rem;">
                    <div class="card-header bg-secondary text-white">
                        <h5 class="card-title"><%=film.getTitle()%></h5>
                    </div>
                    <div class="card-body">
                        <p class="card-subtitle"><%=film.getDescription()%></p>
                        <p class="card-text mt-3"><b>Clasificación: </b><%=film.getRating()%></p>
                        <p class="card-text"><b>Año de realización: </b><%=film.getReleaseYear()%></p>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/updateFilm?id_movie=<%=film.getFilmId()%>" class="btn btn-secondary">Editar</a>
                            <a href="${pageContext.request.contextPath}/deleteFilm?id_movie=<%=film.getFilmId()%>" class="btn btn-danger">Eliminar</a>
                        </div>
                    </div>
                </div>
                <%}%>
                <% } else {%>
                <p>Realiza una busqueda!!!</p>
                <%}

                    }%>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <script>
            const options = document.querySelector('#filter_search')
            const btn_create = document.querySelector('#btn-search')
            const input = document.querySelector('#value_selected')


            //Función que al cargar desactiva el boton de busqueda para evitar que el usuario haga una busqueda sin escoge un filtro
            window.addEventListener('load', function () {
                if (options.children[0].value === '0') {
                    btn_create.setAttribute('disabled', '')
                }
            })


            //Aqui activamos o descativamos el boton de busqueda si se selecciona un campo valido
            options.addEventListener('change', function (e) {
                let value_options = e.target.children
                let value = value_options[e.target.value].value

                if (value != '0') {
                    btn_create.removeAttribute('disabled')
                    input.value = value
                    input.setAttribute('value',value)

                } else {
                    btn_create.setAttribute('disabled', '')
                }
            })
        </script>
    </body>

</html>