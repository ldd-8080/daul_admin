function addResponseListHtml(title) {
	let parentIdx = globalIdx;
	let childIdx = 0;
	
	var response_list_id = "response_" + parentIdx;
	var response_card_id = "responseCard_" + parentIdx;
	
	var div = document.createElement("div");
	div.classList.add("box", "response");
	div.id = response_list_id;
	
	var html = 
		   `<div class="box-aside" style="display:none;">
              <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                <i class="icon md-chevron-up" aria-hidden="true"></i>
              </button>
              <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                <i class="icon md-chevron-down" aria-hidden="true"></i>
              </button>
              <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                <i class="icon md-delete" aria-hidden="true"></i>
              </button>
            </div>
            <div class="panel box-main">
              <div class="panel-heading">
                <h3 class="panel-title">챗봇 응답 - ${title}</h3>
                <span class="action-title">전송타입 </span>
                <div class="action-btns">
                  <div class="sending-type-btns btn-group btn-group-sm panel-action" aria-label="Small button group" role="group">
                    <button type="button" class="btn cbtn-action w-60 active" id="${response_list_id+'_sending_btn_caro'}">케로셀</button>
                    <button type="button" class="btn cbtn-action w-60" id="${response_list_id+'_sending_btn_ran'}">랜덤형</button>
                  </div>
                </div>
              </div>
              <div class="panel-body response-card-box">
                <div class="response-card-empty card ignore-elements bg-transparent" >
                  <span class="align-center" aria-hidden="true">
                    <button type="button" class="btn btn-round cbtn-action btn-addcard" id="${response_list_id+'_add_textbox_btn'}"
                            data-placement="right" data-toggle="tooltip" data-original-title="카드 추가">
                      <i class="icon md-plus font-size-26" aria-hidden="true"></i>
                    </button>
                  </span>
                </div>
              </div>
            </div>`;
	
	div.innerHTML = html;
	// 챗봇응답 리스트 추가
	var response_div = document.getElementById("response-list");
	response_div.appendChild(div);
	
	// 생성된 리스트
	var response_list = document.getElementById(response_list_id);

	// 리스트 mouseover,out 이벤트 추가
	var box_aside = response_list.querySelector(".box-aside");

	response_list.addEventListener("mouseover", function() {
		box_aside.style.display = (box_aside.style.display === "none") ? "" : "";
	});
	
	response_list.addEventListener("mouseout", function() {
		box_aside.style.display = (box_aside.style.display !== "none") ? "none" : "none";
	});
	
	// 리스트 제거 버튼 이벤트
	var box_aside_del_btn = box_aside.querySelector(".btn-box-delete");
	
	box_aside_del_btn.addEventListener("click", function() {
		response_list.remove();
	});
	
	// 리스트 전송타입 이벤트 추가
	var sending_btn_caro = response_list.querySelector("#" + response_list_id + "_sending_btn_caro");
	var sending_btn_ran = response_list.querySelector("#" + response_list_id + "_sending_btn_ran");
	
	function sendingBtnEvent(e) {
		var exist = e.target.classList.contains("active");
		
		if (!exist) e.target.classList.add("active");
		
		if (e.target.id.indexOf("caro") > -1) 	sending_btn_ran.classList.remove("active");
		else									sending_btn_caro.classList.remove("active");
	}
	
	sending_btn_caro.addEventListener("click", sendingBtnEvent);
	sending_btn_ran.addEventListener("click", sendingBtnEvent);
	
	// 리스트의 텍스트형,이미지형,카드형,리스트형,스킬,퀵버튼,조건 추가 버튼 이벤트
	var add_textbox_btn = response_list.querySelector("#" +response_list_id + "_add_textbox_btn");
	
	add_textbox_btn.addEventListener("click", function() {
		addOutputHtml(childIdx, response_card_id, response_list, title);
		
		childIdx++;
	});
	
	globalIdx++;
}

function addOutputHtml(childIdx, response_card_id, response_list, title) {
	var div = document.createElement("div");
	div.classList.add("response-card");
	div.id = response_card_id + "_" + childIdx;
	
	var typeHtml = outputHtml(title);
	
	var html = 
		`<div class="response-card-actions" style="display:none";>
            <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
              <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i>
            </button>
            <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right handle-del">
              <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i>
            </button>
          </div>
          <div class="card response-card-body mt-30">
            ${typeHtml}
          </div>`;
	
	div.innerHTML = html;
	// 리스트에 추가
	var response_card_after = response_list.querySelector(".panel-body .response-card-empty");
	response_card_after.before(div);
	
	cardMouseAndRemoveEvent(div.id);
}

// Output HTML
function outputHtml(title) {
	var htmlArr = [
		{
			name: "텍스트",
			html: `<div class="card-block card-block-evt card-block-text">
	           	     <p class="card-text">내용을 입력하세요.</p>
			       </div>
			       <div class="card-block">
			         <button type="button" class="btn btn-block card-btn-action">+ 버튼 추가</button>
			       </div>` 
		},
		{
			name: "이미지",
			html: `<img class="card-img-top img-fluid card-block-evt card-block-img"
						 src="../images/placeholder.png" alt="Card image cap" />`
		},
		{
			name: "카드",
			html: `<img class="card-img-top img-fluid card-block-evt card-block-img"
                         src="../images/placeholder.png" alt="Card image cap" />
                   <div class="card-block card-block-evt card-block-title-text">
                     <h5 class="card-title">타이틀을 입력하세요.</h5>
                     <p class="card-text">내용을 입력하세요.</p>
                   </div>
                   <div class="card-block card-block-btns">
                     <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                   </div>`
		},
		{
			name: "리스트",
			html: `<div class="card-header card-header-transparent card-header-bordered card-block-list-title card-block-evt">
			         <h5 class="card-title text-center">타이틀을 입력하세요.</h5>
			       </div>
			       <div class="card-block card-block-list">
			         <ul class="list-group list-group-full list-group-dividered">
			           <li class="list-group-item">
			             <button type="button" class="btn btn-block btn-pure w-p100 h-p100">+ 목록 추가</button>
			           </li>
			         </ul>
			       </div>
			       <div class="card-block card-block-btns">
			         <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
			       </div>`
		},
		{
			name: "퀵버튼",
			html: `<button type="button" class="btn btn-round quick-btn mr-2 mb-2 px-20">
	                 <span class="btn btn-round btn-sm btn-icon quick-btn-action handle-qbtn bg-grey-50 position-absolute" style="left:2px; top:2px">
	                   <i class="icon md-code-setting" aria-hidden="true"></i>
	                 </span>
	                 Default
	               </button>`
		}
	]
	// skill, quickBtn, condition
	
	for (var data of htmlArr) {
		if (data.name === title) {
			return data.html;
		}
	}
}

//response card의 mouseover,out 이벤트, 제거 버튼 이벤트 추가
function cardMouseAndRemoveEvent(id) {
	var response_card = document.getElementById(id);
	var response_card_header = response_card.querySelector(".response-card-actions");
	
	response_card.addEventListener("mouseover", function() {
		response_card_header.style.display = "";
	});
	
	response_card.addEventListener("mouseout", function() {
		response_card_header.style.display = "none";
	});
	
	var response_card_header_del_btn = response_card.querySelector(".response-card-actions .handle-del");
	
	response_card_header_del_btn.addEventListener("click", function() {
		response_card.remove();
	});
}
