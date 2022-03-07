function ValidateInputs() {
    var form = document.getElementsByName("form")[0];
    var fio = document.getElementsByName("fio")[0];
    var phone = document.getElementsByName("phone")[0];

    var errors = {"fio": true, "phone" : true};

    fio.onblur = function () {
        if (fio.value != '') errors.fio = false;
    }

    phone.onblur = function() {
        if (phone.value != '') errors.phone = false;
    }

    form.addEventListener('submit', function (event) {
        if (!IsValid(errors, fio, phone)) event.preventDefault();
    });
}

function IsValid(errors, fio, phone) {
    if (!errors.fio && !errors.phone) return true;
    else {
        fio.style.backgroundColor='red';
        phone.style.backgroundColor='red';
        return false;
    }
}