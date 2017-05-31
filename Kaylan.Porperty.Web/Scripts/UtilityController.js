$(document).ready(function () {

    $.ajax
   ({
       url: '/Utility/GetCountryList',
       type: 'GET',
       datatype: 'application/json',
       contentType: 'application/json',
       success: function (result) {
           $("#CountryId").html("");
           $.each(result, function (i, country) {
               $("#CountryId").append
               ($('<option></option>').val(country.Id).html(country.Name))
           })
       },
       error: function () {
           alert("Whooaaa! Something went wrong..")
       },
   });

});