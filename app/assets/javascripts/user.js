$(function() {
  var preWord;
  function buildHTML(user){
    var div = $('<div>', {"class": "chat-group-user clearfix", "id": "chat-group-add"});
    var users = $('<p>', {"class": "chat-group-user__name"}).append(user.name);
    var btn = $('<a>', {'class': 'user-search-add chat-group-user__btn chat-group-user__btn--add', 'data-user-id': user.id, 'data-user-name': user.name}).append("追加");

    var result = div.append(users).append(btn);
    $('#user-search-result').append(result);
  }

  function buildClass(user){
    var div = $('<div>', {"class": "chat-group-user clearfix js-chat-member", "id": "chat-group-user-8"});
    var input = $('<input>').attr({name: "group[user_ids][]", type: "hidden", value: $(user).data('user-id')});
    var name = $('<p>', {"class": "chat-group-user__name"}).text($(user).data('user-name'));
    var btn = $('<a>', {"class": "user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn"}).append("削除");

    var result = div.append(input).append(name).append(btn);
    $('#chat-group-users').append(result);
  }

  $('#user-search-field').on('keyup', function(e){
    e.preventDefault()

    var $input = $('#user-search-field').val();
    var $search = $input.split(" ").filter(function(e) {return e;});

    $.ajax({
      type: 'GET',
      url: '/users',
      data: ("name=" + $search),
      dataType: 'json',
      contentType: false,
      processData: false
    })
    .done(function(data){
      if(data != preWord){
        $('#chat-group-add').remove();
        if($search.length !== 0){
          $.each(data, function(i, user){
          buildHTML(user);
          });
        }
      }
      preWord = data;
    })
    .fail(function(data) {
      alert("検索に失敗しました");
    });
  });
  $('#user-search-result').on('click', 'a', function(){
    $(this).parent().remove();
    buildClass(this);
  });
  $('#chat-group-users').on('click', 'a', function(){
    $(this).parent().remove();
  });
});

