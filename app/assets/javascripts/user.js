$(function() {

  $('#user-search-field.chat-group-form__input').on('keyup', function(e){
    e.preventDefault()

    var $input = $('#user-search-field.chat-group-form__input').val();
    console.log($input);

    $.ajax({
      type: 'GET',
      url: '/users',
      data: ("name=" + $input),
      dataType: 'json',
      contentType: false,
      processData: false
    })
    .done(function(data){
      console.log(data);
    })
  });
});
