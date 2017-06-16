$(function() {
  var $chatSpace = $('.messages__chat');
  var $jsForm = $('.js-form');

  function buildHTML(message){


    var time = $('<li class= "messages__chat__message__time">').append(message.created_at);
    var name = $('<li class= "messages__chat__message__name">').append(message.name);
    if(message.image.url) var image = $('<li class="messages__chat__message__image">').append(' <img src= "'+ message.image.url + '">');
    if(message.text) var text = $('<li class="messages__chat__message__text">').append(message.text);

     var chat = $('<ul class= "messages__chat__message">').append(name).append(time).append(text).append(image);
     $chatSpace.append(chat);
  }


    $jsForm.on('submit', function(e){
    e.preventDefault();

    var $url = './messages';
    var $form = $jsForm.get(0);
    var $formData = new FormData($form);
    $.ajax({
      type: 'POST',
      url:  $url,
      data: $formData,
      dataType: 'json',
      contentType: false,
      processData: false
    })
    .done(function(data) {
      buildHTML(data);
      $jsForm[0].reset();
      $chatSpace.animate({ scrollTop: $chatSpace [0].scrollHeight }, 'slow');
    })
    .fail(function(data){
      alert('メッセージの送信に失敗しました');
    });
  });
});
