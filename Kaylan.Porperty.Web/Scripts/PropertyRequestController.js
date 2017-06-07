$(document).ready(function () {
    //$.ajax
    //({
    //    url: '/PropertyRequest/GetAllPropertyRequestType',
    //    type: 'GET',
    //    datatype: 'application/json',
    //    contentType: 'application/json',
    //    success: function (result) {
    //        $("#ContractType").html("");
    //        $("#ContractType").append
    //       ($('<option selected></option>').val(-1).html('Select ContractType'));
    //        $.each(result, function (i, property) {
    //            $("#ContractType").append
    //            ($('<option></option>').val(property.Id).html(property.Name))
    //        })
    //    },
    //    error: function () {
    //        alert("Whooaaa! Something went wrong..")
    //    },
    //});

    $.get("/Home/GetAllPropertyRequestContractType", function (result) {
        $("#PropertyRequestContractTypeId").html("");

        $("#PropertyRequestContractTypeId").append($('<option selected></option>').val(-1).html('Select Contract Type'));
        $.each(result, function (i, property) {
            $("#PropertyRequestContractTypeId").append($('<option></option>').val(property.Id).html(property.Name))
        })
    });

    $.get("/Home/GetAllPropertyRequestType", function (result) {
        $("#PropertyRequestTypeId").html("");

        $.each(result, function (i, property) {
            $("#PropertyRequestTypeId").append($('<option></option>').val(property.Id).html(property.Name))
        })
    });

    $.get("/Home/GetAllPropertyRequestArea", function (result) {
        $("#PropertyRequestAreaId").html("");
       
        $.each(result, function (i, area) {
            $("#PropertyRequestAreaId").append($('<option></option>').val(area.Id).html(area.Name))
        })
    });

    $.get("/Home/GetAllPropertyRequestPrice", function (result) {
        $("#maxPrice").html("");
        $("#minPrice").html("");

        $("#maxPrice").append($('<option selected></option>').val(-1).html('Select Price'));
        $("#minPrice").append($('<option selected></option>').val(-1).html('Select Price'));
        $.each(result, function (i, price) {
            $("#maxPrice").append($('<option></option>').val(price.Id).html(price.Price));
            $("#minPrice").append($('<option></option>').val(price.Id).html(price.Price));
        })
    });
});