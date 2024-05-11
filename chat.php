<div id="chat-box">
    <div id="chat-window" style="display:none; width:300px; border:1px solid #ccc; padding:10px; background:#f9f9f9; position:fixed; bottom:0; right:20px; max-height:400px; overflow:auto;">
        <div id="chat-messages"></div>
        <textarea id="chat-message" placeholder="Nhập tin nhắn của bạn..." style="width:100%;"></textarea>
        <button id="send-message">Gửi</button>
    </div>
    <button id="toggle-chat" style="position:fixed; bottom:100px; right:20px;">Chat</button>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
    $('#toggle-chat').click(function(){
        $('#chat-window').toggle();
    });

    $('#send-message').click(function(){
        var message = $('#chat-message').val();
        // Gửi tin nhắn đến server qua AJAX
        $.post('sendMessage.php', {message: message}, function(data){
            $('#chat-messages').append('<p>' + data + '</p>');
            $('#chat-message').val(''); // Xóa trường nhập sau khi gửi
        });
    });

    // Tải tin nhắn mới mỗi 5 giây
    setInterval(function(){
        $.get('getMessages.php', function(data){
            $('#chat-messages').html(data);
        });
    }, 5000);
});
</script>
