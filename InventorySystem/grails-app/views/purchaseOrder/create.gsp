

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
                                    <label for="poDescription"><g:message code="purchaseOrder.poDescription.label" default="Po Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseOrderInstance, field: 'poDescription', 'errors')}">
                                    <g:textField name="poDescription" value="${purchaseOrderInstance?.poDescription}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="poDateTime"><g:message code="purchaseOrder.poDateTime.label" default="Po Date Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseOrderInstance, field: 'poDateTime', 'errors')}">
                                    <g:datePicker name="poDateTime" precision="day" value="${purchaseOrderInstance?.poDateTime}"  />
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
