

<%@ page import="inventorysystem.PurchaseOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseOrder.label', default: 'PurchaseOrder')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${purchaseOrderInstance}">
            <div class="errors">
                <g:renderErrors bean="${purchaseOrderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="invoiceNumber"><g:message code="purchaseOrder.invoiceNumber.label" default="Invoice Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseOrderInstance, field: 'invoiceNumber', 'errors')}">
                                    <g:textField name="invoiceNumber" value="${purchaseOrderInstance?.invoiceNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orderDateTime"><g:message code="purchaseOrder.orderDateTime.label" default="Order Date Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseOrderInstance, field: 'orderDateTime', 'errors')}">
                                    <g:datePicker name="orderDateTime" precision="day" value="${purchaseOrderInstance?.orderDateTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="items"><g:message code="purchaseOrder.items.label" default="Items" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseOrderInstance, field: 'items', 'errors')}">
                                    <g:select name="items" from="${inventorysystem.Product.list()}" multiple="yes" optionKey="id" size="5" value="${purchaseOrderInstance?.items*.id}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalPrice"><g:message code="purchaseOrder.totalPrice.label" default="Total Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseOrderInstance, field: 'totalPrice', 'errors')}">
                                    <g:textField name="totalPrice" value="${fieldValue(bean: purchaseOrderInstance, field: 'totalPrice')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purchaseOrderOwner"><g:message code="purchaseOrder.purchaseOrderOwner.label" default="Purchase Order Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderOwner', 'errors')}">
                                    <g:select name="purchaseOrderOwner.id" from="${inventorysystem.User.list()}" optionKey="id" value="${purchaseOrderInstance?.purchaseOrderOwner?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
