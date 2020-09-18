var idx = $("#question-list").children().length;

$(document).ready(function(){
	
    $("button[id='question-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
    function deleteFile(obj) {
        obj.parent().parent().remove();
    }
});

function addQuestion() {
	
    var str = " <div class='form-group row'>" +
    "<div class='col-md-3'></div>" +
    "<div class='col-md-7'>" +
    "	<input type='text' class='form-control' name='question_content' id = 'question_content'/>"+
    "</div>"+
    "<div class='col-md-2'>" + 
    "<button type='button' class='btn btn-primary' id = 'question-delete' >-</button>"+
    "</div>"+
    "</div>"+
    "</div>";
    
    $("#question-list").append(str);
    $("button[id='question-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
    function deleteFile(obj) {
        obj.parent().parent().remove();
    }
    idx++;
}




function formatDate(date) { 
	var d = new Date(date), 
		month = '' + (d.getMonth() + 1), 
		day = '' + d.getDate(), 
		year = d.getFullYear(); 
	if (month.length < 2) month = '0' + month; 
	if (day.length < 2) day = '0' + day; 
	return [year, month, day].join('-'); 
}


function responseTypeHtml(obj, survey_list_id, parentIdx) {
	
		return `<div class="form-group row">
					<div class="col-md-1"></div>
					<label class="col-md-2 col-form-label" style="padding-top: 25px;">답변유형 </label>
					<div class="col-md-8">
						<div class="example">
							<select data-plugin="selectpicker" name="survey[${parentIdx}]type">
								<option value="S">단일선택</option>
								<option value="P">복수선택</option>
							</select>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-1"></div>
					<label class="col-md-2 col-form-label">설문제목 </label>
					<div class="col-md-8">
						<input type="text" class="form-control" maxlength="100" name="survey[${parentIdx}]title">
						
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-md-1"></div>
					<label class="col-md-2 col-form-label">설문 항목 </label>
					<div class="col-md-8">
						<button type="button" class="btn btn-primary" id="${survey_list_id+'_add_card_btn'}">+ 항목 생성</button>
					</div>
				</div>
	            <div class="survey-card-empty" >
	            </div>`;
	
}

function addResponseListHtml(obj) {
	let parentIdx = globalIdx;
	let childIdx = 0;
	
	var survey_list_id = "survey" + parentIdx;
	var survey_card_id = "surveyCard_" + parentIdx;
	
	var div = document.createElement("div");
	div.classList.add("box", "surveyList");
	div.id = survey_list_id;
	
	var typeHtml = responseTypeHtml(obj, survey_list_id, parentIdx);
	
	var html = 
		   `<div class="box-aside" style="display:none;">
              <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                <i class="icon md-delete" aria-hidden="true"></i>
              </button>
            </div>
            <div class="panel box-main">
              ${typeHtml}
            </div>
            <hr/>`;
	
	div.innerHTML = html;
	// 챗봇응답 리스트 추가
	var response_div = document.getElementById("survey-list");
	response_div.appendChild(div);
	
	// 생성된 리스트
	var survey_list = document.getElementById(survey_list_id);

	// 리스트 mouseover,out 이벤트 추가
	var box_aside = survey_list.querySelector(".box-aside");


	// 리스트 제거 버튼 이벤트
	var box_aside_del_btn = box_aside.querySelector(".btn-box-delete");
	
	box_aside_del_btn.addEventListener("click", function() {
		survey_list.remove();
	});
	
	var add_card_btn = survey_list.querySelector("#" +survey_list_id + "_add_card_btn");
	// 리스트의 텍스트형,이미지형,카드형,리스트형 추가 버튼 이벤트
	add_card_btn.addEventListener("click", function() {
		addResponseCardHtml(childIdx, survey_card_id, survey_list, obj, parentIdx);
		childIdx++;
	
		
	});
	
	globalIdx++;
}


function addResponseCardHtml(childIdx, survey_card_id, survey_list, obj, parentIdx) {
	var div = document.createElement("div");
	div.classList.add("survey-card");
	div.id = survey_card_id + "_" + childIdx;
	
	var typeHtml = cardHtml(obj, parentIdx, childIdx);
	
	var html = 
		`${typeHtml}`;
	
	div.innerHTML = html;
	// 리스트에 추가
	var survey_card_after = survey_list.querySelector(".survey-card-empty");
	survey_card_after.before(div);
	

	
}

//Output HTML
function cardHtml(obj, parentIdx, childIdx) {

			return `<div class='form-group row'>
						<div class='col-md-3'></div>
						<div class='col-md-7'>
							<input type='text' class='form-control' name='survey[${parentIdx}]question_content[${childIdx}]' id = 'survey[${parentIdx}]question_content[${childIdx}]'/>
						</div>
						<div class='col-md-2'>
							<button type='button' class='btn btn-primary btn-box-delete' id = 'survey[${parentIdx}]question-delete[${childIdx}]' >-</button>
						</div>
						</div>
					</div>`;
		
}





