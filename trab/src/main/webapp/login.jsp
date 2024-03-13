<%--
  Created by IntelliJ IDEA.
  User: joaor
  Date: 06/03/2024
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="estilo/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
</head>
<body>
<div class="background">
    <%@ include file ="cabecalho.html"%>
    <section class="vh-100 gradient-custom" style=" height: 550px;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-50">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card bg-dark text-white" style="border-radius: 1rem; max-height: 550px !important;">
                        <div class="card-body p-5 text-center">

                            <div class="mb-md-5 mt-md-4 pb-5">

                                <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                <p class="text-white-50 mb-5">Por favor, entre com seu e-mail e sua senha!</p>

                                <div class="form-outline form-white mb-4">
                                    <label class="form-label" for="typeEmailX">Email</label>
                                    <input type="email" id="typeEmailX" class="form-control form-control-lg" />

                                </div>

                                <div class="form-outline form-white mb-4">
                                    <label class="form-label" for="typePasswordX">Senha</label>
                                    <input type="password" id="typePasswordX" class="form-control form-control-lg" />

                                </div>

                                <button class="btn btn-outline-light btn-lg px-8" type="submit" onclick="validarLogin()">Login</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function validarLogin() {
            var email = document.getElementById("typeEmailX").value;
            var senha = document.getElementById("typePasswordX").value;

            var emailValido = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

            if (emailValido) {
                var parteAntesArroba = email.split("@")[0];

                if (senha === parteAntesArroba) {

                    window.location.href = "enviamusica.jsp";
                } else {
                    alert("Senha incorreta. Por favor, tente novamente.");
                }
            } else {

                alert("Email inválido. Por favor, insira um email válido.");
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</div>
</body>
</html>
