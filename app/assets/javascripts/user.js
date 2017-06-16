$(function() {

  $('#user-search-field').on('keyup', function(e){
    e.preventDefault()

    var $input = $('#user-search-field').val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: ("name=" + $input),
      dataType: 'json',
      contentType: false,
      processData: false
    })
    .done(function(data){
    })
  });
});
