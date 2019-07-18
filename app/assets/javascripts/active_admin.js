//= require active_admin/base
$(function() {

  $('.flash').delay(5000).slideUp();

  $('#championship_category_id').change(function() {
    var category_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/categorias/'+ category_id +'/sub_categories',
      dataType: 'JSON',
      success: function (data) {
        var options = "<option value=''></option>";
        for (var i = 0; i < data.length; i++) {
          options += "<option value='" + data[i].id + "'>" + data[i].name + '</option>';
        }
        $('#championship_sub_category_id').html(options);
        $('#championship_sub_category_input').show();
      }
    });

    $.ajax({
      type: 'GET',
      url: '/categorias/'+ category_id +'/pilots',
      dataType: 'JSON',
      success: function (data) {
        var options = "<option value=''></option>";
        for (var i = 0; i < data.length; i++) {
          options += "<option value='" + data[i].id + "'>" + data[i].full_name + '</option>';
        }
        $("select#championship_one_id").html(options);
        $("select#championship_two_id").html(options);
        $("select#championship_three_id").html(options);
      }
    });
  });

  $(".close_race").click(function(e) {
    race_id =  $(".row-id td").text();
    e.preventDefault();
    $.ajax({
      type: 'PUT',
      url: '/race/'+ race_id +'/close',
      success: function (data) {
        location.reload();
      }
    });
  });

});