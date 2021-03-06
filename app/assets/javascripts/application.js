// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(document).on("click", "a.link_to_add_fields", function(e){
    e.preventDefault();
    var link = $(this);
    var association = $(this).data("association");
    var content = $(this).data("content");
    add_fields(link, association, content);
});

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
}

$(document).on("click", "a.remove_fields", function(e){
  e.preventDefault();
  $(this).prev("input[type=hidden]").val("1");
  $(this).closest(".field").hide();
})
