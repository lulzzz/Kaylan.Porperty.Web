//$(document).ready(function () {
//    alert("Running");

//    debugger;
//    var stateId = $("#property_type").val();
//    $.ajax
//    ({
//        url: '@Url.Action("GetAllPropertyType", "Home")',
//        type: 'GET',
//        datatype: 'application/json',
//        contentType: 'application/json',
//        success: function (result) {
//            $("#property_type").html("");
//            $.each($.parseJSON(result), function (i, property) {
//                $("#property_type").append
//                ($('<option></option>').val(property.Id).html(property.Name))
//            })
//        },
//        error: function () {
//            alert("Whooaaa! Something went wrong..")
//        },
//    });

//});