<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Cash/Bank Book Report</title>
<style type="text/css" media="print">
@media print {
	.result {
		height: 100%;
		overflow: visible;
	}
}
</style>
<style type="text/css" media="print">
div.page {
	page-break-after: always;
	page-break-inside: avoid;
}
</style>
<style>
@media print {
	tr.page-break {
		display: block;
		page-break-after: always;
	}
}
</style>
<style>
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(../../../DanishHousing/pages/photos/Eclipse.gif) center
		no-repeat #fff;
}

body, html {
	width: 100%;
	height: 100%;
}

.invoice-box {
	max-width: 1100px;
	margin: auto;
	padding: 10px;
	border: 1px solid #eee;
	font-size: 16px;
	line-height: 16px;
	font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	color: #555;
}

.table>thead>tr>th {
	border: 1px solid #060606;
	padding: 1px;
	font-size: 9pt;
}

.table>tbody>tr>td {
	padding: 1px;
	font-size: 8pt;
}

.invoice-box table tr.item td {
	border-bottom: 1px solid #eee;
}

.invoice-box table tr.total td:nth-child(2) {
	border-top: 2px solid #eee;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="se-pre-con"></div>
	<div class="invoice-box " id="printBankCashReport">
		<div class="row">

			<div align="center">
				<h2>
					<b><u>DANISH GRIH NIRMAN SAHAKARI SANSTHA MARYADIT BHOPAL</u></b>
				</h2>
			</div>
			<div class="row" align="center">

				<div>
					<h4>CASH/BANK - BOOK FOR PERIOD ${requestScope.date1} TO
						${requestScope.date2}</h4>
				</div>
			</div>

			<div align="center">
				<div class="col-md-1"></div>
				<div class="col-md-11">

					<table class="table">
						<tr>
							<td>
								<table class="table">
									<thead
										style="border-top: 2px solid black; border-bottom: 2px solid black;">
										<tr>
											<th colspan="6"><div align="center">RECEIPT</div></th>
											<th colspan="6"><div align="center">PAYMENTS</div></th>
										</tr>
										<tr>
											<th>Doc No.</th>
											<th>Particulars</th>
											<th>Adjustments</th>
											<th colspan="2">Bank</th>
											<th>Cash</th>
											<th>Voucher No.</th>
											<th>Particulars</th>
											<th>Adjustments</th>
											<th colspan="2">Bank</th>
											<th>Cash</th>
										</tr>
									</thead>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table>
									<tbody>

										<c:forEach items="${requestScope.dailyTranList}" var="tran">
										<tr><td><div class="page">
										<table>
											<tr>
												<td colspan="2"><b><fmt:formatDate type="date"
															pattern="dd/MM/yyyy" value="${tran.currDate}" /></b></td>
											</tr>
											<tr>
												<td colspan="12">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="2"><b><c:out value="OPENING BALANCE" /></b></td>
												<td>&nbsp;</td>
												<td colspan="2"><table class="table">

														<tbody>
															<c:forEach items="${tran.openingBalance}" var="opBal">

																<tr>
																	<c:choose>
																		<c:when test="${opBal.acCode == '01'}">
																			<c:set var="cashBal1" value="${opBal.recAmount}" />
																		</c:when>
																		<c:otherwise>
																			<td><c:out value="${opBal.acName}" /></td>
																			<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																					value="${opBal.recAmount}" type="currency" /></td>
																		</c:otherwise>
																	</c:choose>
																</tr>

															</c:forEach>
														</tbody>
													</table></td>
												<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
														value="${cashBal1}" type="currency" /></td>
												<td colspan="6">&nbsp;</td>

											</tr>


											<c:forEach items="${tran.dailyTransaction}" var="dRec">
												<tr>
													<c:choose>
														<c:when test="${dRec.docType == 'D'}">
															<td><c:out value="${dRec.docNo}" /></td>
															<c:choose>
																<c:when test="${dRec.membNo ==0}">
																	<td><b><c:out value="${dRec.accName}" /></b><br>
																		<c:out value="${dRec.remarks}" /></td>
																</c:when>
																<c:otherwise>
																	<td><b><c:out value="${dRec.accName}" /></b><br>
																		<c:out value="${dRec.remarks}" />&emsp;MS No.&nbsp;<c:out
																			value="${dRec.membNo}" /></td>
																</c:otherwise>
															</c:choose>
															<td><div align="center">
																	<c:out value="${dRec.adjustment}" />
																</div></td>
															<c:forEach items="${requestScope.accounts}" var="bank">
																<c:choose>
																	<c:when test="${bank.key ==dRec.bkCode}">
																		<c:choose>
																			<c:when test="${dRec.adjustment == 0.0}">
																				<c:choose>
																					<c:when test="${bank.key =='01'}">
																						<td>&nbsp;</td>
																					</c:when>
																					<c:otherwise>
																						<td><div align="center">
																								<c:out value="${dRec.amount}-(${bank.value})" />
																							</div></td>
																					</c:otherwise>
																				</c:choose>
																			</c:when>
																			<c:otherwise>
																				<c:choose>
																					<c:when test="${bank.key =='01'}">
																						<td>&nbsp;</td>
																					</c:when>
																					<c:otherwise>
																						<td><div align="center">
																								<c:out value="${bank.value}" />
																							</div></td>
																					</c:otherwise>
																				</c:choose>
																			</c:otherwise>

																		</c:choose>
																	</c:when>
																</c:choose>
															</c:forEach>
															<c:choose>
																<c:when test="${dRec.adjustment == 0.0}">
																	<c:choose>
																		<c:when test="${dRec.bkCode =='01'}">
																			<td><div align="center">
																					<c:out value="${dRec.amount}-(Cash)" />
																				</div></td>
																		</c:when>
																		<c:otherwise>
																			<td>&nbsp;</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${dRec.bkCode =='01'}">
																			<td><c:out value="Cash" /></td>
																		</c:when>
																		<c:otherwise>
																			<td>&nbsp;</td>
																		</c:otherwise>
																	</c:choose>
																</c:otherwise>

															</c:choose>
														</c:when>
														<c:otherwise>
															<td colspan="6">&nbsp;</td>

														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${dRec.docType == 'W'}">
															<td><c:out value="${dRec.docNo}" /></td>
															<td><b><c:out value="${dRec.accName}" /></b><br>
																<c:out
																	value="${dRec.remarks} (Chq No/Tr No :${dRec.chqNo})" /></td>
															<td><div align="center">
																	<c:out value="${dRec.adjustment}" />
																</div></td>
															<c:forEach items="${requestScope.accounts}" var="bank">
																<c:choose>
																	<c:when test="${bank.key ==dRec.bkCode}">
																		<c:choose>
																			<c:when test="${dRec.adjustment == 0.0}">
																				<c:choose>
																					<c:when test="${bank.key =='01'}">
																						<td>&nbsp;</td>
																					</c:when>
																					<c:otherwise>
																						<td><div align="center">
																								<c:out value="${dRec.amount}-(${bank.value})" />
																							</div></td>
																					</c:otherwise>
																				</c:choose>
																			</c:when>
																			<c:otherwise>
																				<c:choose>
																					<c:when test="${bank.key =='01'}">
																						<td>&nbsp;</td>
																					</c:when>
																					<c:otherwise>
																						<td><div align="center">
																								<c:out value="${bank.value}" />
																							</div></td>
																					</c:otherwise>
																				</c:choose>
																			</c:otherwise>

																		</c:choose>
																	</c:when>

																</c:choose>
															</c:forEach>
															<c:choose>
																<c:when test="${dRec.adjustment == 0.0}">
																	<c:choose>
																		<c:when test="${dRec.bkCode =='01'}">
																			<td><div align="right">
																					<c:out value="${dRec.amount}-(Cash)" />
																				</div></td>
																		</c:when>
																		<c:otherwise>
																			<td>&nbsp;</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${dRec.bkCode =='01'}">
																			<td><div align="right">
																					<c:out value="Cash" />
																				</div></td>
																		</c:when>
																		<c:otherwise>
																			<td>&nbsp;</td>
																		</c:otherwise>
																	</c:choose>
																</c:otherwise>

															</c:choose>
														</c:when>
														<c:otherwise>
															<td colspan="6">&nbsp;</td>
														</c:otherwise>
													</c:choose>
												</tr>

											</c:forEach>
											<tr>
												<td colspan="6">&nbsp;</td>
												<td colspan="2"><b><c:out value="CLOSING BALANCE" /></b></td>
												<td>&nbsp;</td>
												<td colspan="2">
													<table class="table">
														<tbody>
															<c:forEach items="${tran.closingBalance}" var="clsBal">

																<tr>
																	<c:choose>
																		<c:when test="${clsBal.acCode == '01'}">
																			<c:set var="cashBal2" value="${clsBal.payAmount}" />
																		</c:when>
																		<c:otherwise>
																			<td><c:out value="${clsBal.acName}" /></td>
																			<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																					value="${clsBal.payAmount}" type="currency" /></td>
																		</c:otherwise>
																	</c:choose>
																</tr>

															</c:forEach>
														</tbody>
													</table>
												</td>
												<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
														value="${cashBal2}" type="currency" /></td>
											</tr>
											<tr
												style="border-top: 2px solid black; border-bottom: 2px solid black;">

												<td colspan="2">TOTAL&emsp;:&emsp;</td>
												<td colspan="2"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
														value="${tran.totalRec}" type="currency" /></td>

												<td colspan="4"></td>
												<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
														value="${tran.totalPay}" type="currency" /></td>
												<td colspan="3"></td>

											</tr>
											<tr>
												<td colspan="12"><p id="total"
														style="background-color: black;">&nbsp;</p></td>

											</tr>
											</table></div></td></tr>
										</c:forEach>

									</tbody>

								</table>
							</td>
						</tr>
					</table>

				</div>

			</div>


		</div>
	</div>
	<div class="row" align="center">

		<div>
			<button type=button class="btn btn-info " value="print"
				id="printButton" onclick="window.print();">&emsp;Print&emsp;</button>
		</div>
	</div>
	<!-- User Form -->

	<!-- /.box-body -->

	<!-- /.content-wrapper -->
	<div align="center">

		<%@ include file="../design/Footer.jsp"%>
	</div>
	<!-- ./wrapper -->
	<%@ include file="../design/Bottom.jsp"%>

	<!-- date-picker -->
	<script src="../../bootstrap/js/modernizr.js"></script>
	<script>
		$(window).load(function() {
			// Animate loader off screen
			$(".se-pre-con").fadeOut("slow");
			;
		});
	</script>
	<script>
		function printFunction() {
			window.print();
			/*var divToPrint = document.getElementById('printBankCashReport');
			var htmlToPrint = '<html><head>' + '<style type="text/css">'
					+ '.table>thead>tr>th {' + 'border-top: 2px solid black;'
					+ 'border-bottom: 2px solid black;'
					+ 'border-left: 2px solid black;'
					+ 'border-right: 2px solid black;' + 'padding;0 ;' + '}'
					+ '#total {' + 'background-color : black;' + '}'
					+ '</style></head><body>';
			htmlToPrint += divToPrint.outerHTML;
			newWin = window.open("");
			newWin.document.write(htmlToPrint);
			newWin.document.write('</body></html>');
			newWin.print();
			newWin.close();*/
		}
		//	function printFunction(printDiv) {
		//		var printContents = document.getElementById(printDiv).innerHTML;
		//		var originalContents = document.body.innerHTML;

		//		document.body.innerHTML = printContents;

		//		document.body.innerHTML = "<html><head><title></title></head><body>"
		//				+ printContents + "</body>";

		//		window.print();

		//		document.body.innerHTML = originalContents;
		//	}
	</script>