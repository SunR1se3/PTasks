<?php
    $chars = str_split($_POST["str"]);

    if (array_count_values($chars)["("] == array_count_values($chars)[")"])
    echo "Right!"; 
    else echo "Wrong!";
?>