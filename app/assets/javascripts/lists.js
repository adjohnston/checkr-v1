// Hide checkbox save button if js
$('.edit_item .checkbox-save').parent().remove();

// submit the form when changed
$('.edit_item input[type="checkbox"]').bind('click', function() {
  $(this).parents('form').submit();
});