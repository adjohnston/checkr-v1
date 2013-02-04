// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require raphael.min
//= require modernizr.min
//= require uniform
//= require_tree

$(function () {

  // hide notice after a few seconds
  $('#notice').delay(3000).slideUp();

  // add uniform to checkboxes
  $('#items input[type=checkbox]').uniform();
  $('.checker').find('span').addClass('icon');

  // if browser has no css-calc
  if (!$('html').hasClass('csscalc')) {

    var calcElements = (function () {
      $('.item-details').each(function (i, v) {
        var itemDetails = $(v);

        itemDetails.css('width', itemDetails.parents('article').width() - itemDetails.prev('fieldset').width());
      });

      $('.pull-tab').each(function (i, v) {
        var pullTag = $(v),
            pullTagIcon = pullTag.find('.icon');

        pullTagIcon.css('top', pullTag.height() / 2 - pullTagIcon.height() / 2);
      });
    } ());

    $(window).bind('resize', function() {
      calcElements();
    });

  };

  //rubberband.options({ mobile: 479 });

});