var idx = $("#question-list").children().length;

function addQuestion() {
	
    var str = " <div class='form-group row'>" +
    "<div class='col-md-3'></div>" +
    "<div class='col-md-7'>" +
    "	<input type='text' class='form-control' name='question_content' />"+
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