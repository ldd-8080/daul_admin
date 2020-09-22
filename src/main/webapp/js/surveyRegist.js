function surveyHtml(parentIdx) {
	var html = 
		'<div class="form-group row">' +
			'<div class="col-md-1"></div>' +
			'<label class="col-md-2 col-form-label">답변유형 </label>' +
			'<div class="col-md-6 col-xl-4">' +
				'<select data-plugin="selectpicker" name="questionList[' + parentIdx + '].type">' +
					'<option value="S">단일선택</option>' +
					'<option value="P">복수선택</option>' +
				'</select>' +
			'</div>' +
		'</div>' +
		'<div class="form-group row">' +
			'<div class="col-md-1"></div>' +
			'<label class="col-md-2 col-form-label">설문제목 </label>' +
			'<div class="col-md-8">' +
				'<input type="text" class="form-control" maxlength="100" name="questionList[' + parentIdx + '].title">' +
			'</div>' +
		'</div>' +
		'<div class="form-group row">' +
			'<div class="col-md-1"></div>' +
			'<label class="col-md-2 col-form-label">설문항목 </label>' +
			'<div class="col-md-6 col-xl-4">' +
				'<button type="button" class="btn btn-primary" id="survey_' + parentIdx + '_add_q_content_btn">+ 항목 생성</button>' +
			'</div>' +
		'</div>' +
		'<div class="form-group" id="survey_' + parentIdx + '_q_list">' +
		'</div>' +
		'<hr>';
	
	return html;
}

var parent_list = document.getElementById("survey-list");

function addSurveyListHtml() {
	let parentIdx = globalIdx;
	
	var survey_list_id = "survey_" + parentIdx;
	
	var div = document.createElement("div");
	div.classList.add("box");
	div.id = survey_list_id;
	
	var html = surveyHtml(parentIdx);
	
	div.innerHTML = html;
	
	parent_list.appendChild(div);
	
	// 설문 항목 생성 버튼 event
	var add_q_content_btn = div.querySelector("button[id*='add_q_content_btn']");
	
	var childIdx = 0;
	
	add_q_content_btn.addEventListener("click", function() {
		addSurveyQuestionContentHtml(parentIdx, childIdx);
		childIdx++;
	});
	
	globalIdx++;
}

function addSurveyQuestionContentHtml(parentIdx, childIdx) {
	var div = document.createElement("div");
	div.classList.add("form-group", "row");
	
	var html = 
		'<div class="col-md-1"></div>' +
		'<label class="col-md-2 col-form-label"></label>' +
		'<div class="col-md-8">' +
			'<input type="text" class="form-control" name="questionList[' + parentIdx + '].question_content[' + childIdx +']"/>' +
		'</div>' +
		'<div class="col-md-1">' +
			'<button type="button" class="btn btn-primary btn-box-delete" name="q_content_del_btn_' + childIdx + '" >-</button>' +
		'</div>';
	
	div.innerHTML = html;
	
	var survey_q_list = document.getElementById("survey_" + parentIdx + "_q_list");
	
	survey_q_list.appendChild(div);
	
	// 설문 항목 삭제 버튼 event
	var q_content_del_btn = div.querySelector("button[name*='q_content_del_btn']");
	
	q_content_del_btn.addEventListener("click", function() {
		q_content_del_btn.parentElement.parentElement.remove();
	});
}