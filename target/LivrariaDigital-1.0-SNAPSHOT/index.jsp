<%@ include file="cabecalho.jsp" %>

<center>
    <p><b>Livraria Online</b></p>
    <c:url var="url" value="/livros/catalogo"/>
    <p><b><a href="${url}?Add=">Iniciar compras</a></b></p>
</center>

<%@ include file="rodape.jsp" %>