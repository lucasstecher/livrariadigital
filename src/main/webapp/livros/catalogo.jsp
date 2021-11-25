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

<br>
<br>
<h3 lang="pt-BR" >Livros disponiveis para compra:</h3>
<div>
    <table summary="layout">
        <c:forEach var="livro" begin="0" items="${livrariaBean.livros}">
            <tr>
                <c:set var="idLivro" value="${livro.idLivro}" />
                <td class="tdLivro" bgcolor="#ffffaa">
                    <c:url var="url" value="/livros/detalhesLivro" >
                        <c:param name="idLivro" value="${idLivro}"/>
                    </c:url>
                    <a href="${url}"><strong>${livro.titulo}</strong></a>
                </td>
                <td class="tdPreco" bgcolor="#ffffaa" rowspan=2>
                    <fmt:formatNumber value="${livro.preco}" type="currency"/>
                </td>
                <td class="tdAdd" bgcolor="#ffffaa" rowspan=2>
                    <c:url var="url" value="/livros/catalogo" >
                        <c:param name="Add" value="${idLivro}"/>
                    </c:url>
                    <a href="${url}">Adicionar livro ao carrinho</a>
                </td>
            </tr>
            <tr>
                <td class="tdAutor" bgcolor="#ffffff">
                    <em>${livro.autores} </em>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<br>

<div>
    <c:if test="${not empty param.Add}">
        <c:set var="idL" value="${param.Add}"/>
        <jsp:setProperty name="livrariaBean" property="idLivro" value="${idL}" />
        <c:set var="livroAdicionado" value="${livrariaBean.livro}" />
        <h3>
            <font color="red" size="+2">Voce adicionou o livro <em>${livroAdicionado.titulo}</em> ao seu carrinho de compras.</font>
        </h3>
    </c:if>

            <c:url var="url" value="/livros/mostrarCarrinho">
                <c:param name="limpar" value="0"/>
                <c:param name="remover" value="0"/>
            </c:url>
            <p>
                <a href="${url}">Ver carrinho de compras</a>
                <c:url var="url" value="/livros/comprar" />
                <a href="${url}">Finalizar compras</a></strong>
            </p>
</div>

<br>
<hr>
<center><em>Copyright 2010 Livraria Virtual. </em></center>
</body>
</html>
