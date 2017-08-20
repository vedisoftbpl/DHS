<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<title>PrintReceipt</title>

<style>
.invoice-box {
	max-width: 900px;
	margin: auto;
	padding: 20px;
	border: 2px solid #eee;
	box-shadow: 0 0 10px rgba(0, 0, 0, .15);
	font-size: 14px;
	line-height: 14px;
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
		<table cellpadding="0" cellspacing="0">
			<tr class="top">

				<td class="title">
					<div align="center">
						<h1 >DANISH GRIH NIRMAN SAHAKARI SANSTHA </h1>
						<h1 >MYDT. BHOPAL</h1>
						<img src="../photos/danish.png" alt="" />
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
							<td>16051</td>
							<td></td>
						</tr>
						<tr>
							<td>Date :</td>
							<td>18/08/2017</td>
							<td></td>
						</tr>
						<tr>
							<td>Received From :</td>
							<td colspan="2"><span>Regd. Under Section 9 of Co-op. Societies act <br>regn.
									No. D.R.B 295 Dt. 06-08-82 <br>Colonizers Licence No.
									4/Reader/S4 Distt. Bhopal</span></td>

						</tr>
						<tr>
							<td>Payment Method</td>
							<td>CASH</td>
						</tr>
						<tr>
							<td>In Account Of</td>
							<td>DHS Hills View-3</td>
						</tr>
					</table>
				</td>
			</tr>
		<br><br>
			<tr class="information">
				<td><div align="center">
						<table style="width: 80%" border="1" cellpadding="0"
							cellspacing="0">
							<tr class="heading">
								<th>PARTICULARS</th>
								<th>AMOUNT</th>
							</tr>
							<tr class="item">
								<td>Water Charge</td>
								<td>5000</td>
							</tr>
							<tr class="item">
								<td>Diversion</td>
								<td>3000</td>
							</tr>
							<tr class="total">
								<th>TOTAL</th>
								<th>8000</th>
							</tr>
						</table>
					</div></td>
			</tr>

			<tr class="information">
				<td colspan="2">
					<table>
						<tr>
							<td><h6>
									AMOUNT IN WORDS : <span>Eight Thousand Rupees Only</span>
								</h6></td>
						</tr>
						<tr>
							<td>
								<p>Cheques/Demand Drafts/Pay Orders are subject to
									realisation</p>
							</td>

							<td>
								<label>For&nbsp;<b>DANISH GRIH NIRMAN SAHAKARI SANSTHA MARYADIT</b> </label>
								<br><br><br><br><br>
								<label><b>AUTHORISED SIGNATORY</b> </label>
							</td>
						</tr>
						<tr>
							<td><p>
									<b>Note :</b> Please intimate any change in address in writing
									otherwise,the Society will not be responsible for the
									consequences.
								</p></td>

						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div align="center"><button onclick="myFunction()">Print</button></div>
	</div>

</body>
</html>
<script>
	//$(function() {
	//$('#receiptHeading').circleType({fluid:true});
	//});
	function myFunction() {
    window.print();
}
</script>