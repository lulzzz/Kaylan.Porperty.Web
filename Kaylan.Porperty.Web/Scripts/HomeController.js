$(document).ready(function () {
    $.ajax
    ({
        url: '/Home/GetAllPropertyType',
        type: 'GET',
        datatype: 'application/json',
        contentType: 'application/json',
        success: function (result) {
            $("#property_type").html("");
            $("#property_type").append
           ($('<option selected></option>').val(-1).html('Property Type'));
            $.each(result, function (i, property) {
                $("#property_type").append
                ($('<option></option>').val(property.Id).html(property.Name))
            })
        },
        error: function () {
            alert("Whooaaa! Something went wrong..")
        },
    });

    $.ajax
    ({
        url: '/Home/GetAllCountry',
        type: 'GET',
        datatype: 'application/json',
        contentType: 'application/json',
        success: function (result) {
            $("#country").html("");
            $("#country").append
            ($('<option selected></option>').val(-1).html('Country'));
            $.each(result, function (i, country) {
                $("#country").append
                ($('<option></option>').val(country.Id).html(country.Name))
            })
        },
        error: function () {
            alert("Whooaaa! Something went wrong..")
        },
    });

    $('#country').on('change', function () {
        var selectedCountry = $(this).find(":selected").val();
        if (selectedCountry != null && selectedCountry != -1) {
            $.ajax({
                type: "GET",
                data: { CountryId: selectedCountry },
                url: "/Home/GetStateByCountry",
                success: function (result) {
                    $("#states").html("");
                    $("#states").append
                    ($('<option selected></option>').val(-1).html('State'));
                    $.each(result, function (i, states) {
                        $("#states").append
                        ($('<option></option>').val(states.Id).html(states.Name))
                    })
                },
                error: function () {
                    alert("Whooaaa! Something went wrong..")
                },
            });
        }
    });

    $('#states').on('change', function () {
        var selectedCountry = $(this).find(":selected").val();
        if (selectedCountry != null && selectedCountry != -1) {
            $.ajax({
                type: "GET",
                data: { StateId: selectedCountry },
                url: "/Home/GetCityByState",
                success: function (result) {
                    $("#city").html("");
                    $("#city").append
                    ($('<option selected></option>').val(-1).html('City'));
                    $.each(result, function (i, states) {
                        $("#city").append
                        ($('<option></option>').val(states.Id).html(states.Name))
                    })
                },
                error: function () {
                    alert("Whooaaa! Something went wrong..")
                },
            });
        }
    });

    $('#submitContact').click(function () {

    });



    $(function () {
        $("#contactform").on('submit', function (e) {
            e.preventDefault() // prevent the form's normal submission

            var dataToPost = $(this).serialize()

            $.post("/Home/Contact", dataToPost)
                .done(function (response, status, jqxhr) {
                    $('#name').val('');
                    $('#email').val('');
                    $('#phone').val('');
                    $('#comments').val('');
                })
                .fail(function (jqxhr, status, error) {
                    // this is the ""error"" callback
                })
        })
    })
});