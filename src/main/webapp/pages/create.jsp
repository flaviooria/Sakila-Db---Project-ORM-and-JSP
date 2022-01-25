<%-- 
    Document   : create.jsp
    Created on : 22 ene. 2022, 22:14:54
    Author     : flavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakila</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            .info {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-top: 50px;
            }

            .badge {
                padding: 10px;
                width: 80%;
            }


        </style>
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
                            <a class="nav-link active" aria-current="page" href="../index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Crear</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid p-5">
            <form method="POST" action="${pageContext.request.contextPath}/createFilm" autocomplete="off">
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Título</label>
                    <div class="col-sm-10">
                        <input type="text" required name="title" class="form-control" id="inputEmail3" placeholder="Título">
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Descripción</label>
                    <div class="col-sm-10">
                        <input type="text" name="description" required class="form-control" id="inputPassword3" placeholder="Descripción">
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Año de lanzamiento</label>
                    <div class="col-sm-10">
                        <input type="text" name="year" required class="form-control" id="inputPassword3" placeholder="2022">
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Clasificación</label>
                    <div class="col-sm-10">
                        <input type="text" name="clasification" required class="form-control" id="inputPassword3" placeholder="G , PG , PG-13 , R , NC-17">
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Idioma: </label>
                    <div class="col-sm-8">
                        <input type="text" name="language" required class="form-control" id="language"
                               placeholder="idioma" disabled>
                    </div>
                    <div class="col-sm-2">
                        <select class="form-select" name="languages-option" id="languages-option">
                            <option selected>Escoge un idioma</option>
                            <option value="1">Ingles</option>
                            <option value="2">Italiano</option>
                            <option value="3">Japanese</option>
                            <option value="4">Mandarin</option>
                            <option value="5">Frances</option>
                            <option value="6">Aleman</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <div class="col-sm-10">
                        <button type="submit" id="create_button" class="btn btn-primary">Crear Película</button>
                    </div>
                </div>
            </form>
        </div>
        <%
            if (session.getAttribute("hasError") != null) {
                if (session.getAttribute("hasError").equals("true")) {

        %>
        <div class="info">
            <p class="badge bg-warning text-wrap text-danger">Error, no se pudo crear la película</p>
        </div>
        <%} else {%>
        <div class="info">
            <p class="badge bg-success text-wrap text-white">Película creada correctamente!!!</p>
        </div>
        <%
                }
                session.removeAttribute("hasError");
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <script>
            let input_langugage = document.querySelector('#language')
            const options = document.querySelector('#languages-option')
            const btn_create = document.querySelector('#create_button')

            window.addEventListener('load', function () {
                if (input_langugage.innerText === '') {
                    btn_create.setAttribute('disabled', '')
                }
            })


            options.addEventListener('change', function (e) {
                if (btn_create.getAttribute('disabled') === '') {
                    btn_create.removeAttribute('disabled')
                }
                input_langugage.value = e.target.children[e.target.value].innerText
            })
        </script>
    </body>
</html>
