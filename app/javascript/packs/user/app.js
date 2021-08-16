$(document).ready(function () {
    var maxField = 4; //Input fields increment limitation

    // Phone number Field   
    var addPhone = $('.add_phone'); //Add button selector
    var phoneWrapper = $('.phone_wrapper'); //Input field wrapper
    var fieldHTML = '<div class="phone_item"><input type="text" name="phone" value=""/><a href="javascript:void(0);" class="remove_phone"><i class="fas fa-minus"></i></a></div>'; //New input field html 
    var x = 1; //Initial field counter is 1

    //Once add button is clicked
    $(addPhone).click(function () {
        //Check maximum number of input fields
        if (x < maxField) {
            x++; //Increment field counter
            $(phoneWrapper).append(fieldHTML); //Add field html
        }
    });

    //Once remove button is clicked
    $(phoneWrapper).on('click', '.remove_phone', function (e) {
        e.preventDefault();
        $(this).parent('div').remove(); //Remove field html
        x--; //Decrement field counter
    });

    //   Programming Language Field
    var addPlang = $('.add_plang'); //Add button selector
    var plangWrapper = $('.plang_wrapper'); //Input field wrapper
    var pfieldHTML = '<div class="plang_item clearFix"><input type="text" name="plang" value="" placeholder="Ruby"/><input type="text" name="plevel" value="" placeholder="A"/><a href="javascript:void(0);" class="remove_plang"><i class="fas fa-minus"></i></a></div>'; //New input field html 
    var p = 1;
    //Once add button is clicked
    $(addPlang).click(function () {
        //Check maximum number of input fields
        if (p < maxField) {
            p++; //Increment field counter
            $(plangWrapper).append(pfieldHTML); //Add field html
        }
    });

    //Once remove button is clicked
    $(plangWrapper).on('click', '.remove_plang', function (e) {
        e.preventDefault();
        $(this).parent('div').remove(); //Remove field html
        p--; //Decrement field counter
    });


    // Profile Picture
    $("#profile_picture").change(function () {
        filename = this.files[0].name;
        $('.upload_profile_btn').html(filename);
    });

    // checkbox checked
    $("#hasjobexp").change(function() {
        if(this.checked) {
            $(".jobexp").css("display","block");
        }else {
            $(".jobexp").css("display","none");
        }
    });
    
    // reset 
    $(".reset").click(function() {
        window.location.reload();
    })

});