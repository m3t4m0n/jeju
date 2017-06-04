/* ---------------------------------------------
 Contact form
 --------------------------------------------- */
$(document).ready(function(){
    $("#submit_btn").click(function(){
        
        //get input field values
        var user_name = $('input[name=name]').val();
        var user_email = $('input[name=email]').val();
        var user_message = $('textarea[name=message]').val();
        
        //simple validation at client's end
        //we simply change border color to red if empty field using .css()
        var proceed = true;
        if (user_name == "") {
            $('input[name=name]').css('border-color', '#e41919');
            proceed = false;
        }
        if (user_email == "") {
            $('input[name=email]').css('border-color', '#e41919');
            proceed = false;
        }
        
        if (user_message == "") {
            $('textarea[name=message]').css('border-color', '#e41919');
            proceed = false;
        }
        
        //everything looks good! proceed...
        if (proceed) {
            //data to be sent to server
            post_data = {
                'userName': user_name,
                'userEmail': user_email,
                'userMessage': user_message
            };
            
            //Ajax post data to server
            $.post('contact_me.php', post_data, function(response){
            
                //load json data from server and output message     
                if (response.type == 'error') {
                    output = '<div class="error">' + response.text + '</div>';
                }
                else {
                
                    output = '<div class="success">' + response.text + '</div>';
                    
                    //reset values in all input fields
                    $('#contact_form input').val('');
                    $('#contact_form textarea').val('');
                }
                
                $("#result").hide().html(output).slideDown();
            }, 'json');
            
        }
        
        return false;
    });
    
    //reset previously set border colors and hide all message on .keyup()
    $("#contact_form input, #contact_form textarea").keyup(function(){
        $("#contact_form input, #contact_form textarea").css('border-color', '');
        $("#result").slideUp();
    });
    
    
    //soomin add
    
    $( ".heart" ).click(function() {
     //나중에 수정하기. 
      var like_p =  $("#like_p");
      var post_id = $("#post_like").val();
      
      $(this).toggleClass('heart_off');

      $.ajax({
      method: "POST",
      url: "/poster/like",
      data: { post_id: post_id },
      error : function(error) {alert("Error!"+error);},
      success : function(data, textStatus, xhr) {
          like_p.text(data.count)
      },
      complete : function() {}
      });
    });
    
    $( ".heart_off" ).click(function() {
        
      var post_id = $("#post_like").val();
      var like_p =  $("#like_p");
      $(this).class('heart');
      $.ajax({
      method: "get",
      url: "/poster/like",
      data: { post_id: post_id },
      error : function(error) {alert("Error!"+error.error.message);},
      success : function(data) {
          like_p.text(data.count)
      },
      complete : function() {}
      });
    });
    
     $( "#reply_create" ).click(function() {
        
      var content = $("#reply_content").val();
      var user_id = $(this).val();
      var post_id = $("#post_like").val();
      var user_email = $("#user_email")
      
      $.ajax({
      method: "post",
      url: "/poster/reply",
      data: { content: content,
              user_id: user_id,
              post_id: post_id },
      error : function(error) {alert("Error!"+error.error.message);},
      success : function(data,textStatus, xhr) {
     
     
         $("#reply_area").append('<li class="media comment-item">');
            $("#reply_area").append('<div class="media-body">');
                $("#reply_area").append('<div class="comment-item-data">');
                    $("#reply_area").append('<div class="comment-author">');
                        $("#reply_area").append('<a href="#">'+data.user_email+'</a>').trigger("create");
                    $("#reply_area").append('</div>');
                    $("#reply_area").append('now');   
                $("#reply_area").append('</div>');
                $("#reply_area").append('<p>'+content+'</p>').trigger("create");
            $("#reply_area").append('</div>');
         $("#reply_area").append('</li>');
         $("#reply_content").empty();
             
      },
      complete : function() {}
      });
    });
    
});