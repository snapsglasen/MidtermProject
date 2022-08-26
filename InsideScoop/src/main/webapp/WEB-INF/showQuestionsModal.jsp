<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<c:if test="${search }">
<script type="text/javascript">
	$(window).on('load', function() {
		$("#showQuestionsModal").modal('show');
	});
</script>
</c:if>
<div class="modal fade" id="showQuestionsModal" tabindex="-1"
	aria-labelledby="showQuestionsModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="showQuestionsModalLabel">All Inside
					Questions</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<c:forEach var="p" items="${questions }">
					<c:if test="${p.active }">
						<a href="question.do?questionId=${p.id }">${p.questionText}</a>
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
