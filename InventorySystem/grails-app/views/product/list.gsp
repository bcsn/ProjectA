
<%@ page import="inventorysystem.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'product.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="productCode" title="${message(code: 'product.productCode.label', default: 'Product Code')}" />
                        
                            <g:sortableColumn property="productName" title="${message(code: 'product.productName.label', default: 'Product Name')}" />
                        
                            <g:sortableColumn property="productDescription" title="${message(code: 'product.productDescription.label', default: 'Product Description')}" />
                        
                            <g:sortableColumn property="productPrice" title="${message(code: 'product.productPrice.label', default: 'Product Price')}" />
                        
                            <th><g:message code="product.company.label" default="Company" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInstanceList}" status="i" var="productInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "productCode")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "productName")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "productDescription")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "productPrice")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "company")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
