function apiCall(method, path, cb) {
  $.ajax({
    url: path,
    method: method,
    cache: true,
    success: function(data) {
      cb(data);
    },
    error: function(xhr, status, data) {
      cb(jQuery.parseJSON(xhr.responseText));
    },
  });
}

function getGlossaryTerm(term_id, cb) {
    apiCall("get", "/glossary/" + term_id, cb);
}

function showGlossaryTerm() {
    var term_id = $("a.active").attr("id");
    // console.log(term_id);
    getGlossaryTerm(term_id, function(dict) {
        $("#currentterm").html(
            "<h4>" + dict.term + "</h4> <p>" + dict.def + "</p>"
        );
    });
}

$(document).ready(function(){
    if ( $('.list-group-item').length ) {
        showGlossaryTerm();
    }

    $(".list-group-item").click(function() {
        $("a.active").removeClass("active");
        $(this).addClass("active");
        showGlossaryTerm();
    });
});
