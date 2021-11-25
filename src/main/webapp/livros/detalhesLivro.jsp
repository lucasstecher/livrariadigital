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

<jsp:useBean id="livrariaBean" class="livraria.negocio.LivrariaBean" scope="page" >
    <jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}" />
</jsp:useBean>

<c:if test="${!empty param.idLivro}">
    <c:set var="id" value="${param.idLivro}"/>
    <jsp:setProperty name="livrariaBean" property="idLivro" value="${id}" />
    <c:set var="livro" value="${livrariaBean.livro}" />

    <h2>${livro.titulo}</h2>
    <h4>Autor: </h4>  <em> ${livro.autores} (${livro.ano})</em>
    <br>   <br>
    <h4>Descricao: </h4>
    <blockquote>${livro.descricao}</blockquote>
    <h4>Preco: <fmt:formatNumber value="${livro.preco}" type="currency"/></h4>

    <c:url var="url" value="/livros/catalogo" >
        <c:param name="Add" value="${id}" />
    </c:url>
    <p><strong><a href="${url}">Adicionar ao carrinho</a>
</c:if>

<c:url var="url" value="/livros/catalogo" >
    <c:param name="Add" value="" />
</c:url>
<a href="${url}">Continuar comprando</a></strong></p>

<br>
<hr>
<center><em>Copyright 2010 Livraria Virtual. </em></center>
</body>
</html>