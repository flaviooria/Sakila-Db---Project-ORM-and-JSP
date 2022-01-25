<%-- 
    Document   : inforamtion
    Created on : 24 ene. 2022, 13:35:44
    Author     : flavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

            .link {
                margin-top: 30px;
            }

            .link a {
                margin-left: 5px;
                text-decoration: underline;
                color: black;
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
                            <a class="nav-link active" aria-current="page" href="./create.jsp">Crear</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
            if (session.getAttribute("info") != null) {

        %>
        <div class="info">
            <span class="badge bg-secondary"><%=session.getAttribute("info")%></span>
            <%}
                session.removeAttribute("info");%>
            <p class="link">Volver a la página inicial!!! <a href="../index.jsp">Home</a></p>
        </div>



    </body>
</html>
