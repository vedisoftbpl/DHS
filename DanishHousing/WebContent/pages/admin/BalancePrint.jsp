<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>PrintBalance</title>

<style type="text/css" media="print">
@media print {
	.result {
		height: 100%;
		overflow: visible;
	}
}
</style>
<style>
.invoice-box {
	max-width: 900px;
	margin: auto;
	padding: 40px;
	font-size: 15px;
	line-height: 15px;
	font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	color: #555;
}

.invoice-box table {
	width: 100%;
	line-height: inherit;
	text-align: center;
}

.invoice-box table td {
	padding: 0px;
	vertical-align: top;
	text-align: left;
}
.table>thead>tr>th {
	border: 1px solid #060606;
	padding: 1px;
	font-size: 11pt;
}

.table>tbody>tr>td {
	padding: 1px;
	font-size: 10pt;
}


@media only screen and (max-width: 600px) {
	.invoice-box table tr.top table td {
		width: 100%;
		display: block;
		text-align: center;
	}
	.invoice-box table tr.information table td {
		width: 100%;
		display: block;
		text-align: center;
		padding-bottom: 10px;
		padding: 0px;
	}
	.invoice-box table tr.information table th {
		width: 100%;
		display: block;
		text-align: center;
		padding-bottom: 20px;
	}
}
</style>
</head>

<body>

	<div class="invoice-box">
		<div id="printDiv">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div align="center">
							<h1>DANISH GRIH NIRMAN SAHAKARI SANSTHA</h1>
							<h1>MYDT. BHOPAL</h1>
							<h6>BF1 BASEMENT FLOOR 216- A, ZONE-I, M.P NAGAR, BHOPAL-462011</h6>
							<h2>
								<b><u>BALANCE</u></b>
							</h2>
							<h4><b>Date &nbsp;:&nbsp;${requestScope.date}</b></h4>
						</div>
<br><br>
					</td>
				</tr>
				<tr>
					<td><div align="center">
							<table class="table" style="width: 90%;" cellpadding="0"
								cellspacing="0">
								<thead>
								<tr >
									<th>BANK NAME</th>
									<th>AMOUNT</th>
									
								</tr>
								</thead>
								<tr><td>&nbsp;</td></tr>
								<c:forEach items="${requestScope.accList}" var="ac">
									<tr >
										<td align="left">${ac.key}</td>
										<td style="text-align: right;"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
												value="${ac.value}" type="currency"  currencySymbol=" "/></td>
									</tr>
								</c:forEach>

							</table></div>
				</td>
				</tr>

			</table>
		</div>
	</div>
	<div align="center">
		<button onclick="window.print();">Print</button>
	</div>
</body>
</html>