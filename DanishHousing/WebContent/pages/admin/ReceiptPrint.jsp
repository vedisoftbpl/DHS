<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>PrintReceipt</title>

<style>
.invoice-box {
	max-width: 800px;
	margin: auto;
	padding: 20px; 
	border: 2px solid #eee;
	box-shadow: 0 0 10px rgba(0, 0, 0, .15);
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

.invoice-box table tr td:nth-child(2) {
	text-align: right;
}

.invoice-box table tr.top table td {
	padding-bottom: 1px;
}

.invoice-box table tr.top table td.title {
	font-size: 45px;
	line-height: 45px;
	color: #333;
}

.invoice-box table tr.information table td {
	padding-bottom: 1px;
}

.invoice-box table tr.heading td {
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-weight: bold;
}

.invoice-box table tr.details td {
	padding-bottom: 20px;
}

.invoice-box table tr.item td {
	border-bottom: 1px solid #eee;
}

.invoice-box table tr.item.last td {
	border-bottom: none;
}

.invoice-box table tr.total td:nth-child(2) {
	border-top: 2px solid #eee;
	font-weight: bold;
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
		<table cellpadding="0" cellspacing="0" >
			<tr >
				<td>
					<div align="center">
						<h1>DANISH GRIH NIRMAN SAHAKARI SANSTHA</h1>
						<h1>MYDT. BHOPAL</h1>	
						<img src="../../pages/photos/danish.png" alt="" />
						<h6>216- A, ZONE-I, M.P NAGAR, BHOPAL-462011</h6>
						<h1>
							<b>RECEIPT</b>
						</h1>
					</div>
			
				</td>
			</tr>

			<tr class="information">
				<td>
					<table>
						<tr>
							<td>
								<p>
									Regd. Under Section 9 of Co-op. Societies act <br>regn.
									No. D.R.B 295 Dt. 06-08-82 <br>Colonizers Licence No.
									4/Reader/S4 Dt. 25-02-84 Distt. Bhopal
								</p>
							</td>
						</tr>
						<tr>
							<td>Receipt No. :</td>
							<td><div align="left">${requestScope.receiptNo}</div></td>
							<td></td>
						</tr>
						<tr>
							<td>Date :</td>
							<td><div align="left"><fmt:formatDate type="date" pattern="dd/MM/yyyy"
									value="${requestScope.receiptDt}" /></div></td>
							<td></td>
						</tr>
						<tr>
							<td>Received From :</td>
							<td colspan="2"><div align="left">${requestScope.rdetails[0]}&nbsp;${requestScope.rdetails[1]}&nbsp;${requestScope.rdetails[2]}<br>
								${requestScope.rdetails[3]} ${requestScope.rdetails[4]}<br>
								${requestScope.rdetails[5]}
							</div></td>	
						</tr>
						<tr>
							<td>Payment Method</td>
							<td><div align="left">${requestScope.rdetails[6]}</div></td>
						</tr>
						<tr>
							<td>In Account Of</td>
							<td><div align="left">${requestScope.projectName}</div></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class="information">
				<td><div align="center">
						<table style="width: 80%" border="1" cellpadding="0"
							cellspacing="0">
							<tr class="heading">
								<th>PARTICULARS</th>
								<th>AMOUNT</th>
							</tr>
							<c:forEach items="${requestScope.receiptList}" var="receipt">
								<tr class="item">
									<td>${receipt.remarks}</td>
									<c:choose>
									<c:when test="${receipt.dC == 'Transfer'}">
									<td>${receipt.balChq}</td>
									</c:when>
									<c:when test="${receipt.dC != 'Transfer'}">
									<td>${receipt.amount}</td>
									</c:when>
									</c:choose>
								</tr>
							</c:forEach>
							<tr class="total">
								<th>TOTAL</th>
								<th>${requestScope.totalAmt}</th>
							</tr>
						</table>
					</div></td>
			</tr>

			<tr class="information">
				<td colspan="2">
					<table>
						<tr>
							<td><h6>
									AMOUNT IN WORDS : <span></span>
								</h6></td>
						</tr>
						<tr>
							<td>
								<p>Cheque's/Demand Drafts/Pay Orders are subject to
									realization</p>
							</td>

							<td><label>For&nbsp;<b>DANISH GRIH NIRMAN
										SAHAKARI SANSTHA MARYADIT</b>
							</label> <br>
							<br>
							
							<br>&nbsp;<img src="../../pages/photos/chris signature.jpg" style="width:125px;height:90px;" alt="Sign" />
							<br> <label><b>AUTHORISED SIGNATORY</b> </label></td>
						</tr>
						<tr>
							<td colspan="2"><p>
									<b>Note :</b> Please intimate any change in address in writing
									otherwise,the Society will not be responsible for the consequences.
								</p></td>

						</tr>
					</table>
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
