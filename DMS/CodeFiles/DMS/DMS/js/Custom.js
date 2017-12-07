
    function ShowAlert(type, msg) {
        $('#errorDiv').show();
    };

    var arr = [];
    var isValidInputs = function (inputArr) {
        
        var result = true;
        $.each(inputArr, function (index, item) {
            var val = $('#' + item).val();
            if (!$.trim(val)) {
                $('#' + item).addClass('input-error');
                arr.push($('#' + item + "hd").val());
                result = false;
            } else {
                $('#' + item).removeClass('input-error');
            }
        });
        return result;
    };

      var Validation1 = function (inputArr) {
        $('#errorDiv').empty();
        var isValid = isValidInputs(inputArr);
        if (!isValid) {
            $('#errorDiv').show();
            var msg = errorList(arr);
            $('#errorDiv').html(msg);
            arr = [];
            ShowAlert('danger', 'Please enter data in mandatory fields.');
            $("html, body").animate({ scrollTop: 0 }, "slow");
            return false;
        }
        else { $('#errorDiv').hide();}

        return true;
    };

    var errorList = function (arrmsg) {
        var msg = '<ui>';
        $.each(arrmsg, function (index, item) {
            msg += '<li>' + item + '</li>';
        });
        msg += '</ui>';
        return msg;
    }

