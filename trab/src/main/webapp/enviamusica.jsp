<%--
  Created by IntelliJ IDEA.
  User: samue
  Date: 29/02/2024
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.trabalhof3.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    User user= (User)session.getAttribute("user");
    if(user==null || !user.isAccess())
    {
        System.out.println(user);
        response.sendRedirect(".");
    }
%>
<head>
    <title>Enviar música</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="estilo/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
    <style>

        input[type="file"]::placeholder {
            color: #ffffff;
            font-style: italic;
            font-size: 12px;
        }
        input[type="file"] + label {
            background-color: #f0f0f0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }
        body{background-color: #696969}
    </style>

</head>
<body>
<%@ include file="cabecalho.html"%>
<form method="POST" action="upservlet" enctype="multipart/form-data">
<div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-50">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5" style="width: 100%">
            <div class="card bg-dark text-white" style="border-radius: 1rem; max-height: 590px !important;">
                <div class="card-body p-5 text-center">
                    <div class="mb-md-5 mt-md-4 pb-5">
                        <h2 class="fw-bold mb-2 text-uppercase">Cadastre uma nova música</h2>
                        <p class="text-white-50 mb-5">Sinta a potência do seu som, bebê!</p>
                        <div class="form-outline form-white mb-4">
                            <label class="form-label">Nome da Música</label>
                            <input type="text" name="nameMusic" class="form-control form-control-lg" />
                        </div>
                        <div class="form-outline form-white mb-4" style="display: flex; justify-content: center;">
                            <div style="margin: 5px; width: 55%;">
                                <label class="form-label">Autor</label>
                                <input type="text" name="autor" class="form-control form-control-lg" />
                            </div>
                            <div style="margin: 5px; width: 55%;">
                                <label class="form-label">Gênero</label>
                                <input type="text" name="genero" class="form-control form-control-lg" />
                            </div>
                        </div>
                        <div class="form-outline form-white mb-4" style="display: flex; justify-content: center;">
                            <div style="margin: 5px;">
                                <label class="form-label">Envie sua música</label>
                                <input type="file"  id="music" name="music">
                            </div>
                            <div style="margin: 5px;">
                                <label class="form-label">Envie a imagem do álbum</label>
                                <input type="file" name="image" id="image">
                            </div>
                        </div>
                        <button class="btn btn-outline-light btn-lg px-8" type="submit">Gravar Música</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form>

<a href=".">voltar</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
