<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

table {
	border-spacing: 0;
	border-collapse: collapse;
}

.table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td,
	.table>tfoot>tr>td {
	border-top: 1px solid #f4f4f4;
}

.table>tbody>tr>th {
	border: 1px solid #060606;
	padding: 1px;
	font-size: 7pt;
}

.table>tbody>tr>td {
	padding: 0px;
	font-size: 7pt;
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
	<div class="row" align="center">

		<div>
			<button type=button class="btn btn-info " value="print"
				id="printButton" onclick="window.print();">&emsp;Print&emsp;</button>
		</div>
	</div>
	<div class="invoice-box " id="printBankCashReport">
		<div class="row">

			<!--  	<div align="center">
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
-->
			<div>

				<div align="right" class="col-md-12">

					<c:set var="pageno" value="1"></c:set>

					<c:forEach items="${requestScope.dailyTranList}" var="tran">
						<c:set var="sumOpBal" value="0.0"></c:set>
						<c:set var="sumClsBal" value="0.0"></c:set>
						<c:set var="sumRecCash" value="0.0"></c:set>
						<c:set var="sumRecBank" value="0.0"></c:set>
						<c:set var="sumRecAdj" value="0.0"></c:set>
						<c:set var="sumPayCash" value="0.0"></c:set>
						<c:set var="sumPayBank" value="0.0"></c:set>
						<c:set var="sumPayAdj" value="0.0"></c:set>
						<%@ include file="CashBookHeader.jsp"%>
						<c:set var="counter" value="0"></c:set>
						<table class="table" width="90%">

							<tr>
								<td colspan="10">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="2" width="25%" align="center" valign="top"
									style="font-size: 10px;"><b><c:out
											value="OPENING BALANCE" /></b></td>

								<td width="15%" align="right" valign="top"><table
										class="table">

										<tbody>
											<c:set var="opBalListSize"
												value="${fn:length(tran.openingBalance)}"></c:set>
											<c:forEach items="${tran.openingBalance}" var="opBal">

												<tr>
													<c:choose>
														<c:when test="${opBal.acCode == '01'}">
															<c:set var="cashBal1" value="${opBal.recAmount}" />
														</c:when>
														<c:otherwise>
															<td align="left"><b><c:out
																		value="${opBal.acName} :" /></b></td>
															<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${opBal.recAmount}" type="currency"
																	currencySymbol=" " /></td>
															<c:set var="sumOpBal" value="${sumOpBal+opBal.recAmount}"></c:set>
														</c:otherwise>
													</c:choose>
												</tr>

											</c:forEach>
										</tbody>
									</table></td>

								<td width="10%" align="right"><fmt:setLocale value="en_IN" />
									<fmt:formatNumber value="${cashBal1}" type="currency"
										currencySymbol=" " /></td>

								<td colspan="5">&nbsp;</td>
								<c:set var="counter" value="${counter+3}"></c:set>
							</tr>
						</table>

						<c:forEach items="${tran.dailyTransaction}" var="dRec">
							<table class="table" width="90%" cellspacing="0" cellpadding="0"
								style="margin-bottom: -1px; margin-top: -1px;">
								<tr>
									<c:choose>
										<c:when test="${dRec.docType == 'D'}">
											<td width="6%" align="left" valign="top"><c:out
													value="${dRec.docNo}" /></td>
											<c:choose>
												<c:when test="${dRec.membNo ==0}">
													<td width="23%" align="left"><b><c:out
																value="${dRec.accName}" /></b><br> <c:out
															value="${dRec.remarks}" /></td>
												</c:when>
												<c:otherwise>
													<td width="23%" align="left"><b><c:out
																value="${dRec.accName}" /></b><br> <c:out
															value="${dRec.remarks}" /><br>MS No.&nbsp;<c:out
															value="${dRec.membNo}" />&emsp;<c:out
															value="${dRec.membName}" /></td>
												</c:otherwise>
											</c:choose>
											<td width="7%" align="right" valign="top"><fmt:setLocale
													value="en_IN" /> <fmt:formatNumber
													value="${dRec.adjustment}" type="currency"
													currencySymbol=" " /> <!--  					<c:set var="sumRecAdj" value="${sumRecAdj+dRec.adjustment}"></c:set>   -->
											</td>
											<c:forEach items="${requestScope.accounts}" var="bank">

												<c:if test="${dRec.adjustment == 0.0}">
													<c:choose>
														<c:when test="${bank.key ==dRec.bkCode}">
															<c:choose>
																<c:when test="${bank.key =='01'}">
																	<td width="7%" align="left" valign="top">&nbsp;</td>
																</c:when>
																<c:otherwise>
																	<td width="7%" align="right" valign="top"><fmt:setLocale
																			value="en_IN" /> <fmt:formatNumber
																			value="${dRec.amount}" type="currency"
																			currencySymbol=" " /><br> <c:out
																			value="(${bank.value})" /></td>
																	<c:set var="sumRecBank"
																		value="${sumRecBank+dRec.amount}"></c:set>
																</c:otherwise>
															</c:choose>
														</c:when>
													</c:choose>
												</c:if>
											</c:forEach>
											<c:if test="${dRec.adjustment != 0.0}">
												<td width="7%" align="left" valign="top">&nbsp;</td>
											</c:if>
											<c:choose>
												<c:when test="${dRec.adjustment == 0.0}">
													<c:choose>
														<c:when test="${dRec.bkCode =='01'}">
															<td width="7%" align="right" valign="top"><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${dRec.amount}" type="currency"
																	currencySymbol=" " /></td>
															<c:set var="sumRecCash" value="${sumRecCash+dRec.amount}"></c:set>
														</c:when>
														<c:otherwise>
															<td width="7%" align="left" valign="top">&nbsp;</td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${dRec.bkCode =='01'}">
															<td width="7%" align="left" valign="top"><c:out
																	value="Cash" /></td>
														</c:when>
														<c:otherwise>
															<td width="7%" align="left" valign="top">&nbsp;</td>
														</c:otherwise>
													</c:choose>
												</c:otherwise>

											</c:choose>
										</c:when>
										<c:otherwise>
											<td colspan="5"></td>

										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${dRec.docType == 'W'}">
											<td width="6%" align="left" valign="top"><c:out
													value="${dRec.docNo}" /></td>
											<td width="23%" align="left"><b><c:out
														value="${dRec.accName}" /></b><br> <c:out
													value="${dRec.remarks} (Chq No/Tr No :${dRec.chqNo})" /></td>
											<td width="7%" align="right" valign="top"><fmt:setLocale
													value="en_IN" /> <fmt:formatNumber
													value="${dRec.adjustment}" type="currency"
													currencySymbol=" " /> <c:set var="sumPayAdj"
													value="${sumPayAdj+dRec.adjustment}"></c:set></td>
											<c:forEach items="${requestScope.accounts}" var="bank">

												<c:if test="${dRec.adjustment == 0.0}">
													<c:choose>
														<c:when test="${bank.key ==dRec.bkCode}">
															<c:choose>
																<c:when test="${bank.key =='01'}">
																	<td width="7%" align="left" valign="top">&nbsp;</td>
																</c:when>
																<c:otherwise>
																	<td width="7%" align="right" valign="top"><fmt:setLocale
																			value="en_IN" /> <fmt:formatNumber
																			value="${dRec.amount}" type="currency"
																			currencySymbol=" " /><br> <c:out
																			value="(${bank.value})" /></td>
																	<c:set var="sumPayBank"
																		value="${sumPayBank+dRec.amount}"></c:set>
																</c:otherwise>
															</c:choose>
														</c:when>
													</c:choose>
												</c:if>
											</c:forEach>
											<c:if test="${dRec.adjustment != 0.0}">
												<td width="7%" align="left" valign="top">&nbsp;</td>
											</c:if>
											<c:choose>
												<c:when test="${dRec.adjustment == 0.0}">
													<c:choose>
														<c:when test="${dRec.bkCode =='01'}">
															<td width="7%" align="right" valign="top"><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${dRec.amount}" type="currency"
																	currencySymbol=" " /></td>
															<c:set var="sumPayCash" value="${sumPayCash+dRec.amount}"></c:set>
														</c:when>
														<c:otherwise>
															<td width="7%" align="left" valign="top">&nbsp;</td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${dRec.bkCode =='01'}">
															<td width="7%" align="left" valign="top"><c:out
																	value="Cash" /></td>
														</c:when>
														<c:otherwise>
															<td width="7%" align="left" valign="top">&nbsp;</td>
														</c:otherwise>
													</c:choose>
												</c:otherwise>

											</c:choose>
										</c:when>
										<c:otherwise>
											<td colspan="5"></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
							<c:set var="counter" value="${counter+1}"></c:set>

							<c:if test="${counter>11}">
								<table class="table">
									<tr>
										<td colspan="10"><p id="total"
												style="background-color: black;">&nbsp;</p></td>

									</tr>
								</table>
								<div style="page-break-after: always;"></div>
								<c:set var="counter" value="0"></c:set>
								<c:set var="pageno" value="${pageno+1}"></c:set>
								<%@ include file="CashBookHeader.jsp"%>
							</c:if>
						</c:forEach>
						<table width="90%">
							<tr>
								<td width="50%" colspan="6"></td>
								<td width="26%"  align="center"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><b>Total:</b></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="${sumPayAdj}"
										type="currency" currencySymbol=" " /></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="${sumPayBank}"
										type="currency" currencySymbol=" " /></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="${sumPayCash}"
										type="currency" currencySymbol=" " /></td>
							</tr>
						</table>
						<table class="table" width="90%">
							<tr>
								<td colspan="5" width="56%">&nbsp;</td>
								<td colspan="2" width="20%" align="left" valign="top"
									style="font-size: 10px;"><b><c:out
											value="CLOSING BALANCE" /></b></td>
								<td width="12%" align="center" valign="top"><table
										class="table">
										<tbody>
											<c:set var="clsBalList"
												value="${fn:length(tran.closingBalance)}"></c:set>
											<c:forEach items="${tran.closingBalance}" var="clsBal">

												<tr>
													<c:choose>
														<c:when test="${clsBal.acCode == '01'}">
															<c:set var="cashBal2" value="${clsBal.payAmount}" />
														</c:when>
														<c:otherwise>
															<td align="left"><b><c:out
																		value="${clsBal.acName} :" /></b></td>
															<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${clsBal.payAmount}" type="currency"
																	currencySymbol=" " /></td>
															<c:set var="sumClsBal"
																value="${sumClsBal+clsBal.payAmount}"></c:set>
														</c:otherwise>
													</c:choose>
												</tr>

											</c:forEach>
										</tbody>
									</table></td>
								<td width="12%" align="right"><fmt:setLocale value="en_IN" />
									<fmt:formatNumber value="${cashBal2}" type="currency"
										currencySymbol=" " /></td>
							</tr>
							<!--  			<tr
								style="border-top: 2px solid black; border-bottom: 2px solid black;">

								<td colspan="2">TOTAL&emsp;:&emsp;</td>
								<td colspan="2"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
										value="${tran.totalRec}" type="currency" /></td>

								<td colspan="4"></td>
								<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
										value="${tran.totalPay}" type="currency" /></td>
								<td colspan="3"></td>

							</tr>
							-->


						</table>
						<c:set var="totalRecCashBal" value="${sumRecCash+cashBal1}"></c:set>
						<c:set var="totalPayCashBal" value="${sumPayCash+cashBal2}"></c:set>
						<c:set var="totalRecBankBal" value="${sumRecBank+sumOpBal}"></c:set>
						<c:set var="totalPayBankBal" value="${sumPayBank+sumClsBal}"></c:set>
						<table width="90%">
							<tr>
								<td width="26%" colspan="2" align="center"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><b>Total:</b></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="0.0"
										type="currency" currencySymbol=" " /></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="${totalRecBankBal}"
										type="currency" currencySymbol=" " /></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black;border-right: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="${totalRecCashBal}"
										type="currency" currencySymbol=" " /></td>
								<td width="26%" colspan="2" align="center"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><b>Total:</b></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="0.0"
										type="currency" currencySymbol=" " /></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="${totalPayBankBal}"
										type="currency" currencySymbol=" " /></td>
								<td width="8%" align="right"
									style="border-top: 2px solid black; border-bottom: 2px solid black; font-size: 11px;"><fmt:setLocale
										value="en_IN" /> <fmt:formatNumber value="${totalPayCashBal}"
										type="currency" currencySymbol=" " /></td>
							</tr>
							<tr>
								<td colspan="10"><p id="total"
										style="background-color: black;">&nbsp;</p></td>

							</tr>
						</table>
						<div style="page-break-after: always;"></div>
						<c:set var="pageno" value="${pageno+1}"></c:set>
					</c:forEach>




				</div>

			</div>


		</div>
	</div>
	<!-- User Form -->

	<!-- /.box-body -->

	<!-- /.content-wrapper -->
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