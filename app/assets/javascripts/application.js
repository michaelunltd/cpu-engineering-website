// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bxslider
//= require toastr
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require tinymce
//= require data-confirm-modal
//= require jquery.bootstrap-autohidingnavbar
//= require backtop


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img_prev').attr('src', e.target.result).width(200).height(200);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
toastr.options = {
    "closeButton": true,
    "debug": false,
    "positionClass": "toast-bottom-right",
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
};

$(document).ready(function () {
  $('[data-toggle="offcanvas"]').click(function () {
    $('.row-offcanvas').toggleClass('active');
  });
});

$(document).ready(function() {
    $(".navbar-fixed-top").autoHidingNavbar({
        'hideOffset': $('.header-img').height() - 50
    });
});

var loaded = function(){

  $('body').scrollspy({ target: '#sidebar' });

}
$(document).on("page:load ready", loaded);

$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});
