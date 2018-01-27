<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Document</title>
</head>
<body>
Member No. : ${requestScope.memberDocument.membno}
<br>
Document : ${requestScope.memberDocument.memberDocumentTitle}
<br>
${requestScope.memberDocument.memberDocumentDetails}
<br>
<img src="../../pages/documents/${requestScope.memberDocument.memberDocumentFile}" />
</body>
</html>