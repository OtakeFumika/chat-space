$(function() {
  var chat = $('.messages__chat')

  function buildHTML(message){

    var time = $('<li class= "messages__chat__message__time">').append(message.created_at);
    var name = $('<li class= "messages__chat__message__name">').append(message.name);
    var image = message.image.url ? $('<li class="messages__chat__message__image">').append(' <img src= "'+ message.image.url + '">') : "";
    var text = message.text ? $('<li class="messages__chat__message__text">').append(message.text) : "";

     var chat = $('<ul class= "messages__chat__message">').append(name).append(time).append(text).append(image);
    chat.append(chat);
  }



  $('.js-form').on('submit', function(e){
    e.preventDefault();

    var url = './messages';
    var form = $('.js-form').get(0);
    var formData = new FormData(form);

    $.ajax({
      type: 'POST',
      url:  url,
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false
    })
    .done(function(data) {
      buildHTML(data);
      $("form")[0].reset();
      chat.animate({ scrollTop: chat[0].scrollHeight }, 'slow');
    })
    .fail(function(){
      alert('メッセージの送信に失敗しました');
    });
  });
});
