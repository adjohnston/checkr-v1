// Hide checkbox save button if js
$('.js .edit_item .checkbox-save').parent().remove();

// submit the form when changed
$('.edit_item input[type="checkbox"]').bind('click', function() {
  $(this).parents('form').submit();
});

// show progress bar
$('.graph').each(function (i, v) {

  var unchecked = parseInt($(v).parent('article').find('.total-items-count').text(), 10),
      checked   = parseInt($(v).parent('article').find('.checked-items-count').text(), 10),
      pcent     = 100 / unchecked * checked + '%';

  $(v).show().find('.graph-progress').css('width', pcent);

});