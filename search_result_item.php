<!DOCTYPE html>

<html>
<head>
    <title>Red House Real Estate</title><!-- add property id here?-->
    <meta charset="UTF-8"/>
    <link href="normalize.css" type="text/css" rel="stylesheet"/>
    <link href="style.css" type="text/css" rel="stylesheet"/>
    <link href='https://fonts.googleapis.com/css?family=Nunito:700|Open+Sans:400,700' rel='stylesheet' type='text/css'>
</head>

<body>
    <?php
        require("common.php");
        include 'menu.inc'
    ?>
    
    
    
<div id="content">
    
    <?php

    
/*print $pagepid; verified to be working*/

    $conn = new mysqli('localhost', 'phyllisy_ifb299', 'Miggles_3', 'phyllisy_rhre');
    if ($conn->connect_error) die($conn->connect_error);

    $pagepid = $_GET["property_id"];

    $query = "SELECT * FROM phyllisy_rhre.properties WHERE property_id = '$pagepid'";
    
    $result = $conn->query($query);
    
    if(!result) die ("Database connection error. Please try again.".$conn->error);
    
    
    
    foreach ($result as $properties) {
        $suburb = $properties['suburb'];
        /*$ptype = $query['property_type'];
        $furnished = $query['furnished'];
        $paddress = $query['property_address'];
        $bedno = $query['bedroom_no'];*/
        echo "<h2> Property ID ".$pagepid."</h2>";
        /*echo "<p>".$suburb."</p>";*/
        echo ('<div name="image" id="image"><img src="img/' .$properties['property_image_1']. '"></div>');
        echo ('<div id="property" name="property" class="parent">');

        echo ('<div id="property-info" name="property-info" class="child"><h2>'.$properties['property_address'].'</h2><h4>'.$properties['suburb'].'</h4><p>'.$properties['property_description'].'</p></div>');

        echo ('<div id="property-sidebar" name="property-sidebar" class="child"><div id="property-stats" name="property-stats"><h3>Property Basics</h3><table><tr><td><b>Weekly Rent</b></td><td>'.$properties['property_rent'].'</td></tr><tr><td><b>Furnished</b></td><td>'.$properties['furnished'].'</td></tr><tr><td><b>Bedrooms</b></td><td>'.$properties['bedroom_no'].'</td></tr><tr><td><b>Bathrooms</b></td><td>'.$properties['bathroom_no'].'</td></tr><tr><td><b>Garage Spaces</b></td><td>'.$properties['garage_no'].'</td></tr></table></div>');

        echo "</div>";
    }

   


    /*<h2>Property ID
        echo $properties*/
    
    /*$rows = $result->num_rows;

    for ($prop = 0; $prop < $rows; ++$prop) {
        $result->data_seek($prop);
        $row = $result->fetch_array(MYSQLI_NUM);*/
        /*echo "<h2> Property ID ".$pagepid."</h2>";*/

        

       
    /*}*/








   ?>

</div>

<?php include 'footer.inc' ?>

</body>
</html>
