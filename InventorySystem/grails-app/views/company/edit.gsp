

<%@ page import="inventorysystem.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
            <div class="errors">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${companyInstance?.id}" />
                <g:hiddenField name="version" value="${companyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="companyName"><g:message code="company.companyName.label" default="Company Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'companyName', 'errors')}">
                                    <g:textField name="companyName" value="${companyInstance?.companyName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="employees"><g:message code="company.employees.label" default="Employees" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'employees', 'errors')}">
                                    
<ul>
<g:each in="${companyInstance?.employees?}" var="e">
    <li><g:link controller="user" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="user" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="products"><g:message code="company.products.label" default="Products" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'products', 'errors')}">
                                    
<ul>
<g:each in="${companyInstance?.products?}" var="p">
    <li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="product" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'product.label', default: 'Product')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="purchaseOrders"><g:message code="company.purchaseOrders.label" default="Purchase Orders" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'purchaseOrders', 'errors')}">
                                    <g:select name="purchaseOrders" from="${inventorysystem.PurchaseOrder.list()}" multiple="yes" optionKey="id" size="5" value="${companyInstance?.purchaseOrders*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
