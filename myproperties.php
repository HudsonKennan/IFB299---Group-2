<!DOCTYPE html>
        
<?php
        $con = mysql_connect('localhost' ,'root' ,'');
        $db = mysql_select_db('redhouse');
        
        if(isset($_POST['update'])){
        $Updatequery = "UPDATE property SET suburb='$_POST[suburb]', property_type='$_POST[pType]', furnished='$_POST[furnis]', property_address='$_POST[address]', bedroom_no='$_POST[bedrooms]', garage_no='$_POST[garage]', property_rent='$_POST[rent]', property_description='$_POST[descr]', property_available='$_POST[available]', property_image_1='$_POST[image]', property_rent_category='$_POST[catagory]', bathroom_no='$_POST[bathrooms]'  WHERE propertyID='$_POST[hidden]'";
        mysql_query($Updatequery, $con);
        };
        
        
        
        if(isset($_POST['delete'])){
        $Deletequery = "DELETE FROM property WHERE property_id='$_POST[hidden]'";
        mysql_query($Deletequery, $con);
        };
        
        
        
        if(isset($_POST['add'])){
        $Addquery = "INSERT INTO property (suburb, property_type, furnished, property_address, bedroom_no, bathroom_no, garage_no, property_rent, property_description, property_available, property_image_1, property_rent_category) VALUES ('$_POST[usuburb]','$_POST[upType]','$_POST[ufurnis]','$_POST[uaddress]', '$_POST[ubedrooms]','$_POST[ugarage]','$_POST[urent]','$_POST[udescr]','$_POST[uavailable]', '$_POST[uimage]', '$_POST[ubathrooms]', '$_POST[ucatagory]')";
        mysql_query($Addquery, $con);
            /* Somemore need to be added above and if needed some more tables might */
        };
               
?>


<html>
<head>
    <title>Red House Real Estate</title>
    <meta charset="UTF-8"/>
    <link href="style.css" type="text/css" rel="stylesheet"/>
    <link href="normalize.css" type="text/css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700|Squada+One" rel="stylesheet">
</head>

<body>
    <div id="header">
        <img src="img/RHRE%20Logo.svg" alt="Red House Rentals Logo"/>
        <div id="login">
            <a href="login.php">login</a>|<a href="register.php">register</a>|<a href="account_s.php">Settings</a>|<a href="myproperties.php">MyProperties</a>
        </div>
    </div>
    
    <div id="nav_menu">
        <ul>
            <li class="active"><a href="index.php">Home</a></li>
            <li><a href="search.php">Search</a></li>
            <li><a href="about.php">About Us</a></li>
            <li><a href="contact.php">Contact Us</a></li>
        </ul>
    </div>
    
    <!--create main content area-->
    <div id="content">
        <div id="form">
            <form method="post" name=propertyedit id="registration">
                <fieldset>
                    <legend>Property Listings</legend>
                    <table>
                        <tr>
                                    <?php
            $query = mysql_query("SELECT * FROM property");
        
        while($row = mysql_fetch_array($query)){
            $id = $row['property_id'];
            $suburb = $row['suburb'];
            $pType = $row['property_type'];
            $furnis = $row['furnished'];
            $address = $row['property_address'];
            $bedrooms = $row['bedroom_no'];
            $bathrooms = $row['bathroom_no'];
            $garage = $row['garage_no'];
            $rent = $row['property_rent'];
            $descr = $row['property_description'];
            $available = $row['property_available'];
            $image = $row['property_image_1'];
            $catagory = $row['property_rent_category'];
            
            echo "<form action=myproperties.php method=post>";
            echo "<tr>";
            echo "<td>" . "<input type=text name=suburb value=" . $suburb . " </td>";
            echo "<td>" . "<input type=text name=pType value=" . $pType . " </td>";
            echo "<td>" . "<input type=text name=furnis value=" . $furnis . " </td>";
            echo "<td>" . "<input type=text name=address value=" . $address . " </td>";
            echo "<td>" . "<input type=text name=bedrooms value=" . $bedrooms . " </td>";
            echo "<td>" . "<input type=text name=bathrooms value=" . $bathrooms . " </td>";
            echo "<td>" . "<input type=text name=garage value=" . $garage . " </td>";
            echo "<td>" . "<input type=text name=rent value=" . $rent . " </td>";
            echo "<td>" . "<input type=text name=descr value=" . $descr . " </td>";
            echo "<td>" . "<input type=text name=available value=" . $available . " </td>";
            echo "<td>" . "<input type=text name=image value=" . $image . " </td>";
            echo "<td>" . "<input type=text name=catagory value=" . $catagory . " </td>";
            echo "<td>" . "<input type=hidden name=hidden value=" .  $id . " </td>";
            echo "<td>" . "<input type=submit name=update value=update" . " </td>";
            echo "<td>" . "<input type=submit name=delete value=delete" . " </td>";
            echo "<tr>";
            echo "</form>";
        }
            echo "<form action=myproperties.php method=post>";
            echo "<tr>";
            echo "<td><input type=text placeholder=Suburb name=usuburb></td>";
            echo "<td><input type=text placeholder=Property Type name=upType></td>";
            echo "<td><input type=text placeholder=Furnished name=ufurnis></td>";
            echo "<td><input type=text placeholder=Address name=uaddress></td>";
            echo "<td><input type=text placeholder=Bedrooms name=ubedrooms></td>";
            echo "<td><input type=text placeholder=Garage name=ugarage></td>";
            echo "<td><input type=text placeholder=Rent name=urent></td>";
            echo "<td><input type=text placeholder=Description name=udescr></td>";
            echo "<td><input type=text placeholder=Availbility name=uavailable></td>";
            echo "<td><input type=text placeholder=image name=uimage></td>";                
            echo "<td><input type=text placeholder=bathrooms name=ubathrooms</td>";
            echo "<td><input type=text placeholder=catagory name=ucatagory></td>";
                            
            echo "<td>" . "<input type=submit name=add value=add" . " </td>";
            echo "</form>";
            echo "</table>";
            mysql_close($con);
        

        ?>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
<br>
        
                
            </div>
        
        
    
    <div id="footer">
        <p><a href="index.php">Home</a>|<a href="about.php">About</a></p>
        <p>This website was created by Connor Nicholls, Hudson Kennan, Jessica Cockett and Phyllis Yaw for IFB299<br>
        Tutor: Prakash Bhandari, 12-2pm Wednesday</p>
    </div>

</body>
</html>
