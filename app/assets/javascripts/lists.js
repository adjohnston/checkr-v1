// Hide checkbox save button if js
$('.edit_item .checkbox-save').parent().remove();

// submit the form when changed
$('.edit_item input[type="checkbox"]').bind('click', function() {
  $(this).parents('form').submit();
});

// if browser has no css-calc
if (!$('html').hasClass('csscalc')) {

  $('.item-details').each(function (i, e) {
    $(e).css('width', $(e).width() - $(e).prev('form').width());
  });

};

// show progress bar
$('.graph').each(function (i, e) {

  var unchecked = parseInt($(e).parent('article').find('.total-items-count').text(), 10),
      checked   = parseInt($(e).parent('article').find('.checked-items-count').text(), 10),
      pcent     = 100 / unchecked * checked + '%';

  $(e).show().find('.graph-progress').css('width', pcent);

});