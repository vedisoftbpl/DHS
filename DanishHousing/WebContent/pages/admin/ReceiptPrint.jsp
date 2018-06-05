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
	max-width: 900px;
	margin: auto;
	padding: 30px;
	border: 1px solid #eee;
	box-shadow: 0 0 2px rgba(0, 0, 0, .15);
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

<body onload="convertNumberToWords(${requestScope.totalAmt});">

	<div class="invoice-box">
		<div id="printDiv">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table>
							<tr>
								<td><img height="90" width="140"
									src="../../pages/photos/danish.png" alt="" /></td>
								<td><div align="left" style="font-size: 15px;">
										<h2>DANISH GRIH NIRMAN SAHAKARI SANSTHA MYDT.</h2>

										<h5>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;BF1 BASEMENT FLOOR 216- A, ZONE-I, M.P
											NAGAR, BHOPAL-462011</h5>
									</div> <br></td>
							</tr>

						</table>
					</td>
				</tr>

				<tr>
					<td><div align="center">
							<h2>RECEIPT</h2>
						</div> <br></td>
				</tr>

				<tr class="information">
					<td>
						<table>
							<tr>
								<td>
									<p>
										Regd. Under Section 9 of Co-op. Societies act <br>vide regn.
										No. D.R.B 295 Dt. 06-08-82 <br>Colonizers' Licence No.
										4/Reader/S4 Dt. 25-02-84 Distt. Bhopal
									</p>
								</td>
							</tr>
							<tr>
								<td><b>Receipt No. :</b></td>
								<td><div align="left">${requestScope.receiptNo}</div></td>
								<td></td>
							</tr>
							<tr>
								<td><b>Date :</b></td>
								<td><div align="left">
										<fmt:formatDate type="date" pattern="dd/MM/yyyy"
											value="${requestScope.receiptDt}" />
									</div></td>
								<td></td>
							</tr>
							<tr>
								<td><b>Received From :</b></td>
								<td colspan="2"><div align="left">${requestScope.rdetails[0]}&nbsp;${requestScope.rdetails[1]}&nbsp;${requestScope.rdetails[2]}<br>
										${requestScope.rdetails[3]} ${requestScope.rdetails[4]}<br>
										${requestScope.rdetails[5]}
									</div></td>
							</tr>
							<tr>
								<td><b>Payment Method</b></td>
								<td><div align="left">${requestScope.rdetails[6]}</div></td>
							</tr>
							<tr>
								<td><b>On Account Of</b></td>
								<td><div align="left">${requestScope.projectName}</div></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="information">
					<td><br>
						<div align="center">
							<table style="width: 80%" border="1" cellpadding="4px"
								cellspacing="0">
								<tr class="heading">
									<th>PARTICULARS</th>
									<th align="right">AMOUNT</th>
								</tr>
								<c:forEach items="${requestScope.receiptList}" var="receipt">
									<tr class="item">
										<td>&emsp;<c:out value="${receipt.remarks}"/></td>
										<c:choose>
											<c:when test="${receipt.dC == 'Transfer'||receipt.balChq!=0}">
												<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${receipt.balChq}" type="currency"
																	currencySymbol=" " /></td>
											</c:when>
											<c:when
												test="${receipt.dC != 'Transfer' ||receipt.balChq==0}">
												<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${receipt.amount}" type="currency"
																	currencySymbol=" " /></td>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
								<tr class="total">
									<th>TOTAL</th>
									<th><div id="totalAmount" align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${requestScope.totalAmt}" type="currency"
																	currencySymbol=" " /></div></th>
								</tr>
							</table>
						</div> <br></td>
				</tr>

				<tr class="information">
					<td>
						<table>
							<tr>
								<td colspan="2"><h5>
										<b> AMOUNT IN WORDS&emsp;&emsp;:&emsp;&emsp;<span
											id="container">&nbsp;Only</span></b>
									</h5></td>
							</tr>
							<tr>
								<td>
									<p>Cheque's/Demand Drafts/Pay Orders are subject to
										realization</p>
								</td>

								<td><label>For&nbsp;<b>DANISH GRIH NIRMAN
											SAHAKARI SANSTHA MARYADIT</b>
								</label> <br> <br> <br> <br> <br> <br> <br>
									<label><b>AUTHORISED SIGNATORY</b> </label></td>
							</tr>
							<tr>
								<td colspan="2"><p>
										<b>Note :</b> Please intimate any change in address in writing
										otherwise,the Society will not be responsible for the
										consequences.
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
<script type="text/javascript">

</script>
<script>
	function convertNumberToWords(amount) {
		var words = new Array();
		words[0] = '';
		words[1] = 'One';
		words[2] = 'Two';
		words[3] = 'Three';
		words[4] = 'Four';
		words[5] = 'Five';
		words[6] = 'Six';
		words[7] = 'Seven';
		words[8] = 'Eight';
		words[9] = 'Nine';
		words[10] = 'Ten';
		words[11] = 'Eleven';
		words[12] = 'Twelve';
		words[13] = 'Thirteen';
		words[14] = 'Fourteen';
		words[15] = 'Fifteen';
		words[16] = 'Sixteen';
		words[17] = 'Seventeen';
		words[18] = 'Eighteen';
		words[19] = 'Nineteen';
		words[20] = 'Twenty';
		words[30] = 'Thirty';
		words[40] = 'Forty';
		words[50] = 'Fifty';
		words[60] = 'Sixty';
		words[70] = 'Seventy';
		words[80] = 'Eighty';
		words[90] = 'Ninety';
		amount = amount.toString();
		var atemp = amount.split(".");
		var number = atemp[0].split(",").join("");
		var n_length = number.length;
		var words_string = "";
		if (n_length <= 9) {
			var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
			var received_n_array = new Array();
			for (var i = 0; i < n_length; i++) {
				received_n_array[i] = number.substr(i, 1);
			}
			for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
				n_array[i] = received_n_array[j];
			}
			for (var i = 0, j = 1; i < 9; i++, j++) {
				if (i == 0 || i == 2 || i == 4 || i == 7) {
					if (n_array[i] == 1) {
						n_array[j] = 10 + parseInt(n_array[j]);
						n_array[i] = 0;
					}
				}
			}
			value = "";
			for (var i = 0; i < 9; i++) {
				if (i == 0 || i == 2 || i == 4 || i == 7) {
					value = n_array[i] * 10;
				} else {
					value = n_array[i];
				}
				if (value != 0) {
					words_string += words[value] + " ";
				}
				if ((i == 1 && value != 0)
						|| (i == 0 && value != 0 && n_array[i + 1] == 0)) {
					words_string += "Crores ";
				}
				if ((i == 3 && value != 0)
						|| (i == 2 && value != 0 && n_array[i + 1] == 0)) {
					words_string += "Lakhs ";
				}
				if ((i == 5 && value != 0)
						|| (i == 4 && value != 0 && n_array[i + 1] == 0)) {
					words_string += "Thousand ";
				}
				if (i == 6 && value != 0
						&& (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
					words_string += "Hundred and ";
				} else if (i == 6 && value != 0) {
					words_string += "Hundred ";
				}
			}
			words_string = words_string.split("  ").join(" ");
		}
		document.getElementById('container').innerHTML = words_string+ 'Only';
	}
</script>
</html>