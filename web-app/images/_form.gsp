
<script>
function clear_form_elements(ele) {

    $(ele).find(':input').each(function() {
        switch(this.type) {
            case 'password':
            case 'select-multiple':
            case 'select-one':
            case 'text':
            case 'textarea':
                $(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;
        }
    });
    document.forms["searchForm"].submit();
}

</script>

<div class="addrole">
	<h2><g:message code="invoiceIncomeServiceCharge.invoiceDetails.label"
							default="Invoice Details" /></h2>
<g:form action="dashboard" name="searchForm" id="searchForm">
	<div id="listTable">
		
		<table cellpadding="0" cellspacing="5" width="100%" class="addcust">
						
			<tr>				
				<td width="200" align="right"><label for="receivedFrom"><span class="required">*</span>
						<g:message code="invoiceIncomeServiceCharge.receivedFrom.label"
							default="Received From" />:
				</label>
				</td>
				
				<td colspan="3" class="width150">
					<g:textField id="receivedFrom" name="receivedFrom"
						class="width150" value="${params.receivedFrom}"/><span id="image">
					<g:img dir="images"	file="hoam-search.jpg" alt="search" border="0" align="middle" /></span>
				</td>
				
			</tr>
			
			<tr>
				<td width="200" align="right"><label for="invoiceNo"><span class="required">*</span> <g:message
							code="invoiceIncomeServiceCharge.invoiceNo.label" default="Invoice No" />:
				</label></td>
				
				<td><g:textField id="invoiceNo" name="invoiceNo"
						class="width150" value="${params.invoiceNo}" class="width150"/></td>
				
				<td width="200" align="right"><label for="invoiceAmount"><span class="required">*</span> <g:message
							code="invoiceIncomeServiceCharge.invoiceAmount.label" default="Invoice Amount" />:
				</label></td>
				<td><g:textField id="invoiceAmount" name="invoiceAmount"
						class="width150" value="${params.invoiceAmount}" class="width150"/></td>
			</tr>
			
						
			<tr>				
				<td width="200" align="right"><label for="invoiceDate"><span class="required">*</span>
						<g:message code="invoiceIncomeServiceCharge.invoiceDate.label"
							default="Invoice Date" />:
				</label>
				</td>
				
				<td class="width150">
				
					<g:textField id="invoiceDate" name="invoiceDate"
					value="${formatDate(format:'MM/dd/yyyy',date:invoiceFrom)}"
					readonly="readonly" class="width125"  />
					
				
				</td>			
					
					
				<td width="200" align="right"><label for="dueDate"><span class="required">*</span>
						<g:message code="invoiceIncomeServiceCharge.dueDate.label"
							default="Due Date" />:
				</label></td>
				
				<td class="width150">	<g:textField	id="dueDate" name="dueDate"
					value="${formatDate(format:'MM/dd/yyyy',date:invoiceTo)}"
					readonly="readonly" class="width125" />
					
				</td>
			</tr>
					
		<tr>
				<td width="200" align="right" valign="top"><label for="reference"><g:message
							code="invoiceIncomeServiceCharge.reference.label" default="Reference" />:
				</label></td>
				
				<td><g:textArea id="reference" name="reference"
						class="width150" value="${params.reference}" cols="36" rows="4" maxlength="200"/></td>
				
				<td width="200" align="right" valign="top"><label for="note"> <g:message
							code="invoiceIncomeServiceCharge.note.label" default="Note" />:
				</label></td>
				<td><g:textArea id="note" name="note"
						class="width150" value="${params.note}" cols="36" rows="4" maxlength="200"/></td>
			</tr>
		
			<tr>
				<td colspan="4">
					<h4>Account Details</h4>
					</td>
				</tr>
				<tr align="center">
					<td colspan="4">
					<table cellpadding="0" cellspacing="5" class="cust_details"  width="100%">
		
						<tr onmousedown="return false;">
			

							<th align="left">${message(code: 'invoiceIncomeServiceCharge.accountName.label', default: 'Account Name')}</th>

							<th style="text-align:right;">${message(code: 'invoiceIncomeServiceCharge.generalFund.label', default: 'General Fund')}</th>
			
							<th style="text-align:right;">${message(code: 'invoiceIncomeServiceCharge.reserveFund.label', default: 'Reserve Fund')}</th>
			
							<th style="text-align:right;">${message(code: 'invoiceIncomeServiceCharge.total.label', default: 'Total')}</th>

		</tr>

	<tbody>
		<g:if test="${propertyInstanceList?.size() > 0}">
			<g:each in="${propertyInstanceList}" status="i"
				var="propertyInstance">				
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" onmousedown="return false;">
					<td>
						${fieldValue(bean: propertyInstance, field: "accountName")}
						</td>
					<td align="right">
						${fieldValue(bean: propertyInstance, field: "generalFund")}
					</td>
					<td align="right">
						${fieldValue(bean: propertyInstance, field: "reserveFund")}
					</td>
					<td align="right">
						${fieldValue(bean: propertyInstance, field: "total")}
					</td>
					
				</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr>
				<td colspan="8" align="center"><g:message
						code="default.recordNotFound" /></td>
			</tr>
		</g:else>
	</tbody>
</table>
				</td>
			</tr>
		<tr>
			<td colspan="4">
				<g:img dir="images"	file="addInvoice.png" alt="Add" border="0" align="middle" /><g:img dir="images"	file="deleteInvoice.png" alt="Delete" border="0" align="middle" />
			</td>
		</tr>
		
		</table>
	</div>
	
</g:form>
</div>
<script> 
	$("#invoiceDate,#dueDate").datepicker({
		showOn : "button",
		buttonImage: "${resource(dir: 'images', file: 'calendar.gif')}",
		buttonImageOnly : true,
		dateFormat: 'mm/dd/yy'			
	});

</script>