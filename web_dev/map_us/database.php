<?php
    // Connect to the Database
    $db = new PDO('mysql:host=db.fe.up.pt;dbname=ei10076', 'ei10076', 'PC14GSA25');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
?>