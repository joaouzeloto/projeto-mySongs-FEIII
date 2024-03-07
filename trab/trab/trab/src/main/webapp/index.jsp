
<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
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
            <form>
                <div>
                    <label class="form-label" style="color: white; margin: 5px" >Explorar</label>
                    <input type="text" id="pesquisar" style="border-radius: 10px; width: 360px; height: 35px">
                    <button  class="buttonC btn" style="margin-bottom: 20px">PESQUISAR</button>
                </div>
            </form>
            <br>
            <table style="width: 60%; text-align: center; background-color: white;border-radius: 7px">
                <tr>
                    <th>    </th>
                    <th>Nome</th>
                    <th>Gênero</th>
                    <th>Autor</th>
                    <th>Música</th>
                </tr>
                <%
                    List<String> audioFileNames = new ArrayList<>();
                    File pasta = new File(request.getServletContext().getRealPath("") + "/MUSICAS");
                    File pastaIMG = new File(request.getServletContext().getRealPath("") + "/CAPA");

                    if (pasta.isDirectory()) {
                        File[] arquivos = pasta.listFiles();

                        for (File arquivo : arquivos) {
                            if (arquivo.isFile()) {
                                String nomeArq = arquivo.getName();
                                String[] parts = parseFileName(nomeArq);
                                String nome = parts[0];
                                String estilo = parts[1];
                                String cantor = parts[2];
                                out.print("<tr style='width: 100%;' onmouseover=\"this.style.backgroundColor='#f5f5f5';\" onmouseout=\"this.style.backgroundColor='transparent';\">" +
                                        "<td style='width: 25%;'> <img src=\"CAPA/"+nomeArq.replace("mp3","png")+"\" style='width: 48px; height: 48px;'></td>" +
                                        "<td style='width: 25%;'>"+nome+"</td>" +
                                        "<td style='width: 25%;'>"+estilo+"</td>" +
                                        "<td style='width: 25%;'>"+cantor+"</td>" +
                                        "<td style='width: 25%;'><audio controls autoplay loop><source src=\"MUSICAS/"+ arquivo.getName() +
                                        "\" type='audio/mpeg'></audio></td></tr>");
                                System.out.println(arquivo.getName());
                            }
                        }
                    } else {
                        System.out.println("O caminho especificado não é um diretório.");
                    }
                %>

            </table>


        </div>
    </div>
</div>
</body>
</html>
