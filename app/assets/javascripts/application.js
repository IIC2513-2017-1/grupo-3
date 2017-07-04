// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require fotorama
//= require jquery_ujs
//= require turbolinks
//= require switchery
//= require raphael
//= require morris
//= require social-share-button
//= require underscore
//= require jquery.purr
//= require best_in_place
//= require gmaps/google
//= require_tree .

$(function(){
  $('#geoinput').geocomplete();
});

$(document).ready(function() {
  /* Activating Best In Place */
  $(".best_in_place").best_in_place();
});

/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("sidenav").style.width = "200px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("sidenav").style.width = "0";
}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#avatar-upload')
      .attr('src', e.target.result)
      .width(320)
      .height(320);
    };
    reader.readAsDataURL(input.files[0]);
  }
}

$( document ).ready($('.fotorama').fotorama({
    // options
})
);

function copyToClipboard(element) {
  var $temp = $("<input>");
  $("body").append($temp);
  $temp.val($(element).text()).select();
  document.execCommand("copy");
  $temp.remove();
}



// $(".dish_activate").bind('change', function(){
//   if (this.checked){
//     $.ajax({
//       url: '/dishes/'+this.value+'/toggle_activate',
//       type: 'POST',
//       data: {"active": this.checked}
//     });
//   }
//   else {
//      alert("no");
//   }
// });
