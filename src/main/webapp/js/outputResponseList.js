function responseTypeHtml(obj, response_list_id) {
	switch (obj.name) {
		case "text"  :
		case "image" :
		case "card"  :
		case "list"  :
			return `<div class="panel-heading">
		              <h3 class="panel-title">챗봇 응답 - ${obj[obj.name]}</h3>
		              <span class="action-title">전송타입 </span>
		              <div class="action-btns">
		                <div class="sending-type-btns btn-group btn-group-sm panel-action" aria-label="Small button group" role="group">
		                  <input type="hidden" name="trans_type" value="caro"/>
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
		            </div>`;
		case "skill"     :
		case "condition" :
			return `<div class="panel-heading">
				      <h3 class="panel-title">챗봇 응답 - ${obj[obj.name]}</h3>
				    </div>
				    <div class="panel-body response-rule-box">
				      <div class="response-card w-p100 mt-0" id="${response_list_id+'_select'}">
				        <div class="card skill-card response-card-body mb-5 w-p100" style="height: 100%">
				          <div class="card-block m-0">
				            <p class="card-title font-weight-400">
				              <i class="icon fa-code-fork font-size-18  mx-5 mb-5" aria-hidden="true"></i> ${obj[obj.name]} 함수
				            </p>
				            <select class="form-control select-response-rule"></select>
				          </div>
				        </div>
				      </div>
				    </div>`;
		case "quick" :
			return `<div class="panel-heading">
				      <h3 class="panel-title">챗봇 응답 - 바로연결</h3>
				    </div>
				    <div class="panel-body response-qbtn-box px-15 pt-15 pb-10">
				      <button type="button" class="btn btn-icon btn-round cbtn-action ignore-elements mb-2">
				        <i class="icon md-plus" aria-hidden="true"></i>
				      </button>
				    </div>`;
	}
}

function addResponseListHtml(obj) {
	let parentIdx = globalIdx;
	let childIdx = 0;
	
	var response_list_id = "response_" + parentIdx;
	var response_card_id = "responseCard_" + parentIdx;
	
	var div = document.createElement("div");
	div.classList.add("box", "response");
	div.id = response_list_id;
	
	var typeHtml = responseTypeHtml(obj, response_list_id);
	
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
              <input type="hidden" name="type" value="${obj.name}" />
              ${typeHtml}
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
		box_aside.style.display = "";
	});
	
	response_list.addEventListener("mouseout", function() {
		box_aside.style.display = "none";
	});
	
	// 리스트 제거 버튼 이벤트
	var box_aside_del_btn = box_aside.querySelector(".btn-box-delete");
	
	box_aside_del_btn.addEventListener("click", function() {
		response_list.remove();
	});
	
	// 텍스트, 이미지, 카드, 리스트일 경우에만 전송타입, card 추가 버튼 이벤트
	if (obj.name === "text" || obj.name === "image" || obj.name === "card" || obj.name === "list") {
		// 리스트 전송타입 이벤트 추가
		var sending_btn_caro = response_list.querySelector("#" + response_list_id + "_sending_btn_caro");
		var sending_btn_ran = response_list.querySelector("#" + response_list_id + "_sending_btn_ran");
		
		function sendingBtnEvent(e) {
			var exist = e.target.classList.contains("active");
			
			if (!exist) {
				e.target.classList.add("active");
				
				var id_arr = e.target.id.split("_");
				
				document.querySelector("input[name='trans_type']").value = id_arr[id_arr.length - 1];
			}
			
			if (e.target.id.indexOf("caro") > -1) 	sending_btn_ran.classList.remove("active");
			else									sending_btn_caro.classList.remove("active");
		}
		
		sending_btn_caro.addEventListener("click", sendingBtnEvent);
		sending_btn_ran.addEventListener("click", sendingBtnEvent);
		
		// 리스트의 텍스트형,이미지형,카드형,리스트형 추가 버튼 이벤트
		var add_textbox_btn = response_list.querySelector("#" +response_list_id + "_add_textbox_btn");
		
		add_textbox_btn.addEventListener("click", function() {
			addResponseCardHtml(childIdx, response_card_id, response_list, obj);
			
			childIdx++;
		});
	}
	
	if (obj.name === "quick") {
		// 리스트의 퀵버튼 추가 버튼 이벤트
		var add_quick_btn = response_list.querySelector(".ignore-elements");
		
		add_quick_btn.addEventListener("click", function() {
			var button = document.createElement("button");
			button.classList.add("btn", "btn-round", "quick-btn", "mr-2", "mb-2", "pr-20");
			button.id = response_list_id + "_" + childIdx;
			
			var html = 
				`<div class="btn-group" style="display:none">
					 <span class="btn btn-round btn-sm btn-icon quick-btn-action handle-qbtn bg-grey-50 mr-10">
			           <i class="icon md-code-setting" aria-hidden="true"></i>
			         </span>
			         <span class="btn btn-round btn-sm btn-icon quick-btn-action handle-qbtn bg-grey-50 ml-10">
			           <i class="icon md-delete" aria-hidden="true"></i>
			         </span>
		         </div>
		         Default`;
			
			button.innerHTML = html;
			
			add_quick_btn.before(button);
			
			button.addEventListener("mouseover", function() {
				response_list.querySelector(".btn-group").style.display = "";
			});
			
			button.addEventListener("mouseout", function() {
				response_list.querySelector(".btn-group").style.display = "none";
			});
			
			childIdx++;
		});
	}
	
	globalIdx++;
}

function addResponseCardHtml(childIdx, response_card_id, response_list, obj) {
	var div = document.createElement("div");
	div.classList.add("response-card");
	div.id = response_card_id + "_" + childIdx;
	
	var typeHtml = cardHtml(obj);
	
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

	addPopover(obj, div.id);
}

// Output HTML
function cardHtml(obj) {
	switch (obj.name) {
		case "text"  :
			return `<div class="card-block card-block-evt card-block-text">
	           	      <p class="card-text">내용을 입력하세요.</p>
	           	      <input type="hidden" name="content"/>
			        </div>
			        <div class="card-block">
			          <button type="button" class="btn btn-block card-btn-action">+ 버튼 추가</button>
			        </div>`;
		case "image" :
			return `<img class="card-img-top img-fluid card-block-evt card-block-img" src="../images/placeholder.png" alt="Card image cap" />`;
		case "card"  :
			return `<img class="card-img-top img-fluid card-block-evt card-block-img"
                         src="../images/placeholder.png" alt="Card image cap" />
                    <div class="card-block card-block-evt card-block-title-text">
                      <h5 class="card-title">타이틀을 입력하세요.</h5>
                      <p class="card-text">내용을 입력하세요.</p>
                    </div>
                    <div class="card-block card-block-btns">
                      <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                    </div>`;
		case "list"  :
			return `<div class="card-header card-header-transparent card-header-bordered card-block-list-title card-block-evt">
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
				    </div>`;
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

// 텍스트형 내용입력 popover
function addPopover(obj, response_card_id) {
	let btnIdx = 0;
	
	var response_card = document.getElementById(response_card_id);
	
	switch (obj.name) {
		case "text":
			// 텍스트형 내용 popover 이벤트
			var popover_target = $("#" + response_card_id + " .card-block-text");
			popover_target.webuiPopover($.extend({}, defaults, popEditTextSettings));
			
			
			popover_target.one("click", function() {
				var popover_id = $(this).data("target");
				
				var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
				var cancel_btn = document.getElementById(popover_id).querySelector("button.btn-cancel");
				var textarea = document.getElementById(popover_id).querySelector("textarea.form-control");

				save_btn.addEventListener("click", function() {
					response_card.querySelector("input[name='content']").value = textarea.value;
					response_card.querySelector("p.card-text").innerHTML = textarea.value;
					
					WebuiPopovers.hide(popover_target);
				});
				
				cancel_btn.addEventListener("click", function() {
					textarea.value = response_card.querySelector("input[name='content']").value;
					WebuiPopovers.hide(popover_target);
				});
			});
			
			// 버튼추가, popover 이벤트
			var add_btn = response_card.querySelector("button.btn.btn-block.card-btn-action");
			
			add_btn.addEventListener("click", function() {
				var button = document.createElement("button");
				button.classList.add("btn", "btn-block", "card-btn", "response-card-btn");
				button.id = response_card_id + "_btn_" + btnIdx++;
				
				var html = 
					`<i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>Default`;
				
				button.innerHTML = html;
				
				this.before(button);
				
				$(button).webuiPopover($.extend({
					onShow: function($element) {
						var popover_id = $element[0].id;
						var div_select_intent = $("#" + popover_id + " .div-select-intent");
						var div_input_url = $("#" + popover_id + " .div-input-url");
						var select_btn_type = $("#" + popover_id + " .select-btn-type");
						var select_intent = $("#" + popover_id + " .select-intent");
						
						div_select_intent.show();
						div_input_url.hide();
						
						if (!select_btn_type.data("select2")) {
							select_btn_type.select2({
								
								dropdownCssClass: "increasedzindexclass",
								data: [
									{id: "intent", text: "intent 링크"},
									{id: "url", text: "URL 링크"}
								]
							});
							
							select_btn_type.on("select2:select", function(e) {
								var data = e.params.data;
								
								if (data.id === "intent") {
									div_select_intent.show();
									div_input_url.hide();
								} else if (data.id === "url") {
									div_select_intent.hide();
									div_input_url.show();
								}
							});
						}
						
						if (!select_intent.data("select2")) {
							select_intent.select2({
								dropdownCssClass: "increasedzindexclass",
								data: [
									{id: "0", text: "의도 0"},
									{id: "1", text: "의도 1"}
								]
							});
						}
					}
				}, defaults, popEditBtnSettings));
				
				$(button).one("click", function() {
					var $this = $(this);
					var popover_id = $this.data("target");
					
					var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
					var cancel_btn = document.getElementById(popover_id).querySelector("button.btn-cancel");
					var input = document.getElementById(popover_id).querySelector("input.form-control");
					
					save_btn.addEventListener("click", function() {
						$this.text(input.value);
						
						WebuiPopovers.hide($(button));
					});
					
					cancel_btn.addEventListener("click", function() {
						input.value = $this.text();
						WebuiPopovers.hide($(button));
					});
				});
			});
			
			break;
		case "image":
			// 이미지형 popover 이벤트
			imgPopoverEvent(response_card_id);
			
			break;
	}
}

function imgPopoverEvent(response_card_id) {
	var popover_target = $("#" + response_card_id + " .card-block-img");
	popover_target.webuiPopover($.extend({}, defaults, popEditImgSettings));
	
	popover_target.one("click", function() {
		var popover_id = $(this).data("target");
		
		//var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
		var close_btn = document.getElementById(popover_id).querySelector("button.btn-close");
		var inputFile = document.getElementById(popover_id).querySelector(".form-control");
		
		var prevFile;
		
		/*
		save_btn.addEventListener("click", function() {
			var file = inputFile.files[0];
			
			if (file) {
				var reader = new FileReader();
				
				reader.onload = function(e) {
					popover_target.attr("src", e.target.result).width(popover_target.width()).height(popover_target.height());
				}
				
				reader.readAsDataURL(file);
				
				prevFile = file;
			}
			
			WebuiPopovers.hide(popover_target);
		});
		*/
		
		close_btn.addEventListener("click", function() {
			WebuiPopovers.hide(popover_target);
		});
		
		inputFile.addEventListener("change", function() {
			var file = inputFile.files[0];
			
			if (file) {
				var reader = new FileReader();
				
				reader.onload = function(e) {
					popover_target.attr("src", e.target.result).width(popover_target.width()).height(popover_target.height());
				}
				
				reader.readAsDataURL(file);
				
				prevFile = file;
			} else {
				popover_target.attr("src", "../images/placeholder.png").width(popover_target.width()).height(popover_target.height());
			}
			
			WebuiPopovers.hide(popover_target);
		});
	});	
}