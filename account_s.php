<!DOCTYPE html>

        <?php
            $con = mysql_connect('localhost' ,'root' ,'');
            $db = mysql_select_db('redhouse');
        
        if(isset($_POST['update'])){
        $Updatequery = "UPDATE users SET fname='$_POST[namef]', lname='$_POST[namel]', email='$_POST[email]', dob='$_POST[dob]', gender='$_POST[gender]', address='$_POST[address]', phno='$_POST[phno]'  WHERE userID='$_POST[hidden]'";
        mysql_query($Updatequery, $con);
        };
          
        ?>

<html>
<head>
    <title>Red House Real Estate</title>
    <meta charset="UTF-8"/>
    <link href="normalize.css" type="text/css" rel="stylesheet"/>
    <link href="style.css" type="text/css" rel="stylesheet"/>
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
            <form method="post" id="registration">
                <fieldset>
                    <legend>Account Settings</legend>
                    <p>All fields are required unless stated otherwise</p>
                    <table>     
                             <?php
            $query = mysql_query("SELECT * FROM users WHERE userID='1'");
        
        while($row = mysql_fetch_array($query)){
            
            $id = $row['user_id'];
            $fname = $row['f_name'];
            $lname = $row['l_name'];
            $email = $row['email'];
            $dob = $row['dob'];
            $gender = $row['gender'];
            $address = $row['address'];
            
            /* the following need to be added to the update button and below to the tables*/
            $password = $row['password'];
            $rent_status = $row['rent_status'];
            $mobile_number = $row['mobile_number'];
            $phone_number = $row['phone_number'];
            $permission = $row['permission'];
            $tc = $row['tc'];
            $sub = $row['sub'];
            
            echo "<form action=delete_add.php method=post>";
            echo "<tr>";
            echo "<tr><td><label>First Name:</label></td>";
            echo "<td>" . "<input type=text name=namef value=" . $fname . " </td>";
            echo "<tr>";
            echo "<tr><td><label>Last Name:</label></td>";
            echo "<td>" . "<input type=text name=namel value=" . $lname . " </td>";
            echo "<tr>";
            echo "<tr><td><label>Email:</label></td>";
            echo "<td>" . "<input type=text name=email value=" . $email . " </td>";
            echo "<tr>";
            echo "<tr><td><label>Date of Birth:</label></td>";
            echo "<td>" . "<input type=text name=dob value=" . $dob . " </td>";
            echo "<tr>";
            echo "<tr><td><label>Gender:</label></td>";
            echo "<td>" . "<select name=gender id=gender>" . 
                 "<option value=male> </option>" . 
                 "<option value=male>Male</option>" . 
                 "<option value=female>Female</option>" . 
                 "<option value=N/A>Rather Not say</option>";
            echo "<tr>";
            echo "<tr><td><label>Address:</label></td>";
            echo "<td>" . "<input type=text name=address value=" . $address . " </td>";
            echo "<tr>";
            echo "<tr><td><label>Home:</label></td>";
            echo "<td>" . "<input type=text name=phno value=" . $phone_number . " </td>";
            echo "<tr><td><label>Mobile:</label></td>";
            echo "<td>" . "<input type=text name=phno value=" . $mobile_number . " </td>";
            echo "<tr>";
            echo "<td>" . "<input type=hidden name=hidden value=" .  $id . " </td>";
            echo "<tr>";
            echo "</form>";
            
        }   
                        ?>
                        <?php
                        echo "<td>" . "<input type=submit name=update value=update" . " </td>";
                       ?>
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
