<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<c:if test="${search }">
<script type="text/javascript">
	$(window).on('load', function() {
		$("#showUsersModal").modal('show');
	});
</script>
</c:if>
<div class="modal fade" id="showUsersModal" tabindex="-1"
	aria-labelledby="showUsersModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="showUsersModalLabel">All Inside
					Scoop Members</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<c:forEach var="p" items="${users }">
					<c:if test="${p.active }">
						<a href="profile.do?id=${p.id }">${p.firstName} ${p.lastName }</a>
						<br />
					</c:if>
				</c:forEach>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>

			</div>
		</div>
	</div>
</div>
