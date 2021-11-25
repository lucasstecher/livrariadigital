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

<h3>Obrigado ${param.nome}.</h3><br>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:setProperty name="now" property="time" value="${now.time+432000000}"/>
Seus livros serao enviados para voce em
<fmt:formatDate value="${now}" type="date" dateStyle="full"/>.<br><br>
<c:remove var="cart" scope="session" />
<c:url var="url" value="livraria.jsp" />
<strong>
    <a href="${url}">Continuar comprando</a>
</strong>

<br>
<hr>
<center><em>Copyright 2010 Livraria Virtual. </em></center>
</body>
</html>
