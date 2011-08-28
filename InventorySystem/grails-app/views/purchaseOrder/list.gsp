
<%@ page import="inventorysystem.PurchaseOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseOrder.label', default: 'PurchaseOrder')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'purchaseOrder.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="invoiceNumber" title="${message(code: 'purchaseOrder.invoiceNumber.label', default: 'Invoice Number')}" />
                        
                            <g:sortableColumn property="orderDateTime" title="${message(code: 'purchaseOrder.orderDateTime.label', default: 'Order Date Time')}" />
                        
                            <g:sortableColumn property="totalPrice" title="${message(code: 'purchaseOrder.totalPrice.label', default: 'Total Price')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseOrderInstanceList}" status="i" var="purchaseOrderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${purchaseOrderInstance.id}">${fieldValue(bean: purchaseOrderInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: purchaseOrderInstance, field: "invoiceNumber")}</td>
                        
                            <td><g:formatDate date="${purchaseOrderInstance.orderDateTime}" /></td>
                        
                            <td>${fieldValue(bean: purchaseOrderInstance, field: "totalPrice")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseOrderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
