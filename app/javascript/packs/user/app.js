$(document).ready(function () {
    var maxField = 2;

    // Phone number Field   
    var addPhone = $('.add_phone');
    var phoneWrapper = $('.phone_wrapper');
    var fieldHTML = '<div class="phone_item"><input type="number" name="applicant[phone_no2]" value=""/><a href="javascript:void(0);" class="remove_phone"><i class="fas fa-minus"></i></a></div>'; //New input field html 
    var x = 1; 

    $(addPhone).click(function () {
        if (x < maxField) {
            x++;
            $(phoneWrapper).append(fieldHTML); 
        }
    });

    $(phoneWrapper).on('click', '.remove_phone', function (e) {
        e.preventDefault();
        $(this).parent('div').remove(); 
        x--;
    });

    //   Programming Language Field
    var count=1;
    var addPlang = $('.add_plang'); 
    var plangWrapper = $('.plang_wrapper'); 
     //New input field html 
    var p = 1;
    $(addPlang).click(function () {
        if (p < 5) {
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
    $(profilePhoto).change(function () {
        filename = this.files[0].name;
        $('.img_name').html(filename);
        // $('.profile_upload').attr("value",filename);
    });

    // checkbox checked
    var hasJobExp = $('.has_job_exp'); 
    if ($(hasJobExp).checked){
        console.log("checked")
    }else{
        console.log("not checked")
    }
    $(hasJobExp).click(function () {
        if (this.checked) {
            $(".jobexp").css("display", "block");
        } else {
            $(".jobexp").css("display", "none");
        }
    });

    // reset 
    $(".reset").click(function () {
        window.location.reload();
    });

});