// Hide checkbox save button if js
$('.edit_item .checkbox-save').parent().remove();

// submit the form when changed
$('.edit_item input[type="checkbox"]').bind('click', function() {
  $(this).parents('form').submit();
});

// donut graph
$('.graph').each(function (i, e) {

  var graph = this,
      paper = Raphael(graph, 80, 80, 0, 0),
      circle = paper.circle(40, 40, 40),
      angle = Raphael.path(40, 40, 51, 0);

});

// if browser has no css-calc
if (!$('html').hasClass('csscalc')) {

  $('.item-details').each(function (i, e) {
    $(e).css('width', $(e).width() - $(e).prev('form').width());
  });

};