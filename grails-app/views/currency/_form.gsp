<%@ page import="racetrack.Currency" %>
<html>
	<g:javascript src="countries.js" />
<head>
</head>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="currency.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:textField name="country" required="" value="${currencyInstance?.country}"/>
	--%>
	<select id="country" name ="country"></select>
	<script language="javascript">print_country("country")</script>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="currency.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${currencyInstance.amount}" required=""/>
</div>

</html>