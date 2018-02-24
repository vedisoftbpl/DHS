<input type="hidden" id="user" name="user" value="${sessionScope.userType}" />
<input type="hidden" id="rights1" name="rights1" value="${sessionScope.rights1}" />
<input type="hidden" id="rights2" name="rights2" value="${sessionScope.rights2}" />
<!-- jQuery 2.2.3 -->
<!--  <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
 
-->
<script src="../../bootstrap/js/jquery-1.11.2.js"></script>
<script src="../../bootstrap/js/jquery-ui.js"></script>


<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$(".userrights").hide();
	$(".userrights").show();
});
</script>
<!--
<script type="text/javascript">
	<c:choose>
	<c:when test="${sessionScope.userType} eq 'Administrator'">
	<c:forEach var="r" items="${sessionScope.rights1}">
	$(document).ready(function() {
		$("#${r.rightsId}").show();
	});
	</c:forEach>
	$(document).ready(function() {
		$("#rights").show();
	});
	</c:when>
	<c:otherwise>
	<c:forEach var="r" items="${sessionScope.rights2}">
	$(document).ready(function() {
		$("#${r}").show();
	});
	</c:forEach>
	</c:otherwise>
	</c:choose>
</script>
-->