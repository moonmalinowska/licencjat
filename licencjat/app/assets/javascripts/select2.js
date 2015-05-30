/**
 * Created by monika on 30.05.15.
 */
//Select2
$.getScript('http://cdnjs.cloudflare.com/ajax/libs/select2/3.4.8/select2.min.js',function(){

    /* dropdown and filter select */
    var select = $('#select2').select2();

    /* Select2 plugin as tagpicker */
    $("#tagPicker").select2({
        closeOnSelect:false
    });

}); //script

