$(document).on 'click', '.edit_comment', ->
  $(this).parent('.edit-delete-container').find('.edit_form').slideToggle();
