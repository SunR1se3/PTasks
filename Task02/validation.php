<?php
    $fio = $_POST["fio"];
    $phone = $_POST["phone"];
    $email = $_POST["email"];

    $errors = array (
        'fio' => true,
        'phone' => true,
        'email' => true,
    );
    
    if (strcmp($fio, '') != 0) $errors['fio'] = false;
    if (strcmp($phone, '') != 0) $errors['phone'] = false;
    if (strcmp(strstr($email, '@'), '@gmail.com') != 0) $errors['email'] = false;

    if (in_array(true, $errors)) {
        foreach($errors as $key => $value) {
            if ($value) echo "Поле ".$key." заполнено неверно!";
        }    
    } else echo "Форма отправлена";

    move_uploaded_file($_FILES['file']['tmp_name'], __DIR__.'/files/'.$_FILES['file']['name']);



?>