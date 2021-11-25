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

<c:if test="${param.limpar == 'limpar'}">
    <font color="red" size="+2">
        <strong>O carrinho de compras foi esvaziado!</strong><br> <br>
    </font>
</c:if>

<c:if test="${param.remover != '0' && param.remover != null}">
    <c:set var="id" value="${param.remover}"/>
    <jsp:setProperty name="livrariaBean" property="idLivro" value="${id}" />
    <c:set var="livroRemovido" value="${livrariaBean.livro}" />
    <font color="red" size="+2">O seguinte livro foi removido do carrinho:
        <em>${livroRemovido.titulo}</em>.
        <br> <br>
    </font>
</c:if>

<c:if test="${sessionScope.cart.numeroItens > 0}">
    <font size="+2">Quantidade de itens do carrinho: ${sessionScope.cart.numeroItens}
        <c:if test="${sessionScope.cart.numeroItens == 1}">
            livro.
        </c:if>
        <c:if test="${sessionScope.cart.numeroItens > 1}">
            livros.
        </c:if>
    </font><br>
    <table summary="layout">
        <tr>
            <th align=left colspan="3">Quantidade</th>
            <th align=left>Titulo</th>
            <th align=left>Preco</th>
        </tr>
        <c:forEach var="itemCompra" items="${sessionScope.cart.itens}">
            <c:set var="livro" value="${itemCompra.item}" />
            <tr>
                <td class="tdMais" bgcolor="#ffffff">
                    <c:url var="url" value="/livros/mostrarCarrinho" >
                        <c:param name="alterar" value="${livro.idLivro}" />
                        <c:param name="quantidade" value="1" />
                        <c:param name="remover" value="0" />
                    </c:url>
                    <a href="${url}" style="text-decoration: none;">[+]</a>
                </td>
                <td class="tdMenos" bgcolor="#ffffff">
                    <c:url var="url" value="/livros/mostrarCarrinho" >
                        <c:param name="alterar" value="${livro.idLivro}" />
                        <c:param name="quantidade" value="-1" />
                        <c:param name="remover" value="0" />
                    </c:url>
                    <a href="${url}" style="text-decoration: none;">[-]</a>
                </td>
                <td class="tdQtd" align="left" bgcolor="#ffffff">${itemCompra.quantidade}</td>
                <td class="tdLivro" bgcolor="#ffffaa">
                    <c:url var="url" value="/livros/detalhesLivro" >
                        <c:param name="idLivro" value="${livro.idLivro}"/>
                        <c:param name="Clear" value="0"/></c:url>
                    <strong><a href="${url}">${livro.titulo}</a></strong>
                </td>
                <td class="tdPreco" bgcolor="#ffffaa" align="right">
                    <fmt:formatNumber value="${livro.preco}" type="currency"/>
                </td>
                <td class="tdAdd" bgcolor="#ffffaa">
                    <c:url var="url" value="/livros/mostrarCarrinho" >
                        <c:param name="remover" value="${livro.idLivro}"/></c:url><strong><a href="${url}">Remover</a></strong>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5" bgcolor="#ffffff"><br></td>
        </tr>
        <tr>
            <td class="tdTotal" colspan="2" align="right" bgcolor="#ffffff">Subtotal</td>
            <td class="tdValor" bgcolor="#ffffaa" align="right">
                <fmt:formatNumber value="${sessionScope.cart.total}" type="currency"/>
            </td>
            <td><br></td>
        </tr>
    </table>
    <p> <p>
    <c:url var="url" value="/livros/catalogo" >
        <c:param name="Add" value="" />
    </c:url>
    <strong>
        <a href="${url}">Continuar comprando</a>
        <c:url var="url" value="/livros/comprar" />
        <a href="${url}">Finalizar compra</a>
        <c:url var="url" value="/livros/mostrarCarrinho">
            <c:param name="limpar" value="limpar"/>
            <c:param name="remover" value="0"/>
        </c:url>
        <a href="${url}">Esvaziar carrinho</a>
    </strong>
</c:if>

<c:if test="${sessionScope.cart.numeroItens <= 0}">
    <font size="+2">Carrinho vazio</font>
    <br> <br>
    <c:url var="url" value="/livros/catalogo" >
        <c:param name="Add" value="" />
    </c:url>
    <strong><a href="${url}">Ver catalogo</a></strong>
</c:if>

        <br>
<hr>
<center><em>Copyright 2010 Livraria Virtual. </em></center>
</body>
</html>