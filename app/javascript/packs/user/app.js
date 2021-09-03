$(document).ready(function () {
    // Phone number Field   
    var addPhone = $('.add_phone');
    var phoneWrapper = $('.phone_wrapper');
    var no2 = $('.no2');
    no2.css("display", "none");
    $(function() {
        var data = localStorage.getItem("phone");
        if (data !== null) {
            no2.css("display", "block");
        }
    });
    $(addPhone).click(function () {
        localStorage.setItem("phone", $(this).val());
        no2.css("display", "block");
    });
    $(phoneWrapper).on('click', '.remove_phone', function (e) {
        e.preventDefault();
        localStorage.removeItem("phone");
        $(".sec_ph").val("");
        no2.css("display", "none");
        
    });

    //   Programming Language Field
    var count=1;
    var addPlang = $('.add_plang'); 
    var plangWrapper = $('.plang_wrapper'); 
     //New input field html 
    var p = 1;
    $(addPlang).click(function () {
        if (p < 4) {
            var pfieldHTML = '<div class="plang_item clearFix"><input type="text" name="applicant[programming[][language]]" value="" placeholder="Java"/><input type="text" name="applicant[programming[][level]]" value="" placeholder="A"/><a href="javascript:void(0);" class="remove_plang"><i class="fas fa-minus"></i></a></div>';
            p++; 
            count++;
            $(plangWrapper).append(pfieldHTML);
        }
    });
    $(plangWrapper).on('click', '.remove_plang', function (e) {
        e.preventDefault();
        $(this).parent('div').remove(); 
        // $(".plang_wrapper div:nth-last-of-type(1)").remove();
        p--;
        count--;
    });

    // Profile Picture
    var profilePhoto = $('.profile_upload');
    $('.img_name').html("No File chosen");
    $(profilePhoto).change(function () {
        filename = this.files[0].name;
        $('.img_name').html(filename);
        // $('.profile_upload').attr("value",filename);
    });

    // checkbox checked
    var hasJobExp = $('.has_job_exp');
    $(function() {
        var data = localStorage.getItem("favorite");
        if (data !== null) {
            $(hasJobExp).attr("checked", "checked");
            $(".jobexp").css("display", "block");
        }else {
            $(".jobexp").css("display", "none");
        }
    });
    $(hasJobExp).click(function() {
        if ($(this).is(":checked")) {
            localStorage.setItem("favorite", $(this).val());
            $(".jobexp").css("display", "block");
    } else {                    
            localStorage.removeItem("favorite");
            $(".jobexp").css("display", "none");
            $(".testing").val("");
        }
    });

    // reset 
    $(".reset").click(function () {
        window.location.reload();
    });

});

