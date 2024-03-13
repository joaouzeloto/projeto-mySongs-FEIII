<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.example.trabalhof3.uploadServlet.parseFileName" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Musical</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="estilo/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
</head>
<body>
<div class="background">
    <%@ include file ="cabecalho.html"%>
    <div class="container-text">
        <div class="text">
            <h1>Escolha uma <span>música</span></h1>
            <form action="" method="GET">
                    <label class="form-label" style="color: white; margin:0px;">Explorar</label>
                <div>
                    <input placeholder="Pesquise a sua música" type="text" id="pesquisar" name="pesquisa" style="border-radius: 10px; width: 360px; height: 35px; padding-left: 10px;" value="<%= request.getParameter("pesquisa") != null ? request.getParameter("pesquisa") : "" %>">
                    <button type="submit" class="buttonC btn" style="margin-bottom: 20px">PESQUISAR</button>
                </div>
            </form>
            <br>
            <table id= "tabela-music" style="width: 60%; text-align: center; background-color: white;border-radius: 7px">
                <tr>
                    <th>    </th>
                    <th>Nome</th>
                    <th>Gênero</th>
                    <th>Autor</th>
                    <th>Música</th>
                </tr>
                <%@ page import="java.nio.file.Paths" %>
                <%@ page import="java.nio.file.Path" %>
                <%@ page import="java.util.ArrayList" %>
                <%@ page import="java.util.List" %>
                <%
                    File pasta = new File(request.getServletContext().getRealPath("") + "/MUSICAS");
                    List<String> audioFileNames = new ArrayList<>();

                    if (pasta.isDirectory()) {
                        File[] arquivos = pasta.listFiles();

                        for (File arquivo : arquivos) {
                            if (arquivo.isFile()) {
                                String[] parts = parseFileName(arquivo.getName());
                                String nome = parts[0];
                                String estilo = parts[1];
                                String cantor = parts[2];

                                String termoPesquisa = request.getParameter("pesquisa");
                                boolean exibir = true;

                                if (termoPesquisa != null && !termoPesquisa.isEmpty()) {
                                    exibir = nome.toLowerCase().contains(termoPesquisa.toLowerCase());
                                }

                                // Se o arquivo deve ser exibido, adiciona-o à tabela
                                if (exibir) {
                %>
                <tr style='width: 100%;' onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='transparent';">
                    <td style='width: 25%;'> <img src="CAPA/<%= arquivo.getName().replace("mp3","png") %>" style='width: 48px; height: 48px;'></td>
                    <td style='width: 25%;'><%= nome %></td>
                    <td style='width: 25%;'><%= estilo %></td>
                    <td style='width: 25%;'><%= cantor %></td>
                    <td style='width: 25%;'><audio controls loop><source src="MUSICAS/<%= arquivo.getName() %>" type='audio/mpeg'></audio></td>
                </tr>
                <%
                                }
                            }
                        }
                    } else {
                        out.println("O caminho especificado não é um diretório.");
                    }
                %>

            </table>

        </div>
    </div>
</div>

<script>
    function pesquisar() {
        var flag = 0;
        var tabela = document.getElementById("tabela-music");
        var pesquisa = document.getElementById("pesquisar");
        tabela.deleteRow(0);
        for (var i = 0; i < tabela.rows.length; i++) {
            var linha = tabela.rows[i];
            for (var j = 1; j < linha.cells.length - 1; j++) {
                var celula = linha.cells[j].toString();
                for (var k = 0, l = 0; k < celula.length; k++) {
                    if (celula[k] == pesquisa[l]) {
                        l = 1;
                        for (; k < celula.length && l < pesquisa.length && [k] == pesquisa[l]; l++) {
                            if (pesquisa.length == l) {
                                flag = 1;
                            }
                        }
                    }
                }
            }
            if (flag != 1) {
                tabela.deleteRow(i);
            }
            flag = 0;
        }
    }
</script>
</body>
</html>
