<!DOCTYPE html>

<html>
<head>
    <title>Red House Real Estate | Search Results</title>
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
    <div id="results">
        <h2>Your Search Results</h2>
        <!--insert information inputed into search form-->
        <p>Suburb: 
        <?php
        if($_POST["suburb"] == '*') {
            echo "No Suburb Specified";
        } else {
            echo $_POST["suburb"];
        } 
        ?>
        </p>
        
        <!--Table of results-->
        <!--<table><tr>
        <td><h3>Property ID</h3></td>
        <td><h3>Suburb</h3></td>
        <td><h3>Property Type</h3></td>
        <td><h3>Furnished</h3></td>
        <td><h3>Weekly Rent ($)</h3></td></tr>-->

        <?php 
        $conn = new mysqli('localhost', 'phyllisy_ifb299', 'Miggles_3', 'phyllisy_rhre');
        if ($conn->connect_error) die($conn->connect_error);
        
        $strpid = $_POST["property_id"];
        $strsuburb = $_POST["suburb"];
        $strptype = $_POST["property_op"];
        $strfurnish = $_POST["furnish"];
        $strprent = $_POST["rent_op"];
        
        $query = "SELECT property_id, suburb, property_type, furnished, property_rent FROM phyllisy_rhre.properties WHERE property_id = '$strpid' AND suburb = '$strsuburb' AND property_type = '$strptype' AND furnished = '$strfurnish' AND property_rent_category = '$strprent' AND property_available = 'Yes' ORDER BY property_id";
            
        $result = $conn->query($query);
            
        if(!$result) die ("No results available for your selection. Please try again.".$conn->error);
            
        /*$rows = $result->num_rows;
            
        echo "<table><tr> <th>Property ID</th> <th>Suburb</th> <th>Property Type</th> <th>Furnished</th> <th>Weekly Rent</th> <th>Link</th> </tr>";
            
        for ($prop = 0 ; $prop < $rows; ++$prop) {
            $result->data_seek($prop);
            $row = $result->fetch_array(MYSQLI_NUM);
            echo "<tr>";
            for ($i = 0; $i < 200; ++$i) echo "<td>$row[$i]</td>";
            echo ('<td><a href="search_result_item.php?property='.$properties['property_id'].'" onclick="document.forms[\'search\'].submit();">'.$properties['property_id'].'</a></td>');
            echo "</tr>";
        }
        
        echo "</table>";*/
        
        echo "<table><tr> <th>Property ID</th> <th>Suburb</th> <th>Property Type</th> <th>Furnished</th> <th>Weekly Rent</th> </tr>";
        
         foreach ($result as $properties) {
            echo ('<tr><td><a href="search_result_item.php?property_id='.$properties['property_id'].'" onclick="document.forms[\'search\'].submit();">'.$properties['property_id'].'</a></td><td>'.$properties['suburb'].'</td><td>'.$properties['property_type'].'</td><td>'.$properties['furnished'].'</td><td>'.$properties['property_rent'].'</td></tr>');
        }
            
        echo "</table>";
            
        ?>
      
<!--
        </table>-->
    </div>
</div>

<?php include 'footer.inc' ?>

</body>
</html>
