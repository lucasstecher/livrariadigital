<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="pt-BR">
<head>
    <title>
        Livraria Stiletto
    </title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Estonia&display=swap');
    </style>
</head>
<body>
<center>
    <hr>
    <br>
    <h1>
        <img width="100" src="../livro.gif">
        Minha Livraria Virtual
        <img width="100" src="../livro.gif">
    </h1>
</center>
<br>
<hr>

<center>
    <p><b>Livraria Online</b></p>
    <c:url var="url" value="/livros/catalogo"/>
    <p><b><a href="${url}?Add=">Iniciar compras</a></b></p>
</center>

<br>
<hr>
<center><em>Copyright 2010 Livraria Virtual. </em></center>
</body>
</html>