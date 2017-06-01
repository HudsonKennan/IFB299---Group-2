<?php
    require("common.php");
    if($_POST["submit"]) {
        $recipient="phyllis.yaw@hotmail.com";
        $subject = $_POST["topic"];
        $sender = $_POST["name"];
        $senderEmail = $_POST["email"];
        $message = $_POST["comment"];
        
        $mailBody="Name: $sender\nEmail:$senderEmail\n\n$message";
        
        mail($recipient, $subject, $mailBody, "From: $sender <$senderEmail>");
        
        $thankYou="<p>Thank you! Your message has been sent.</p>";
    }
?>

<!DOCTYPE html>

<html>
<head>
    <title>Red House Real Estate | Contact Us</title>
    <meta charset="UTF-8"/>
    <link href="normalize.css" type="text/css" rel="stylesheet"/>
    <link href="style.css" type="text/css" rel="stylesheet"/>
    <link href='https://fonts.googleapis.com/css?family=Nunito:700|Open+Sans:400,700' rel='stylesheet' type='text/css'>
</head>

<body>
    <?php include 'menu.inc' ?>
    
    <!create main content area>
    <div id="content">
        <div id="form">
            <form action="contact.php" method="post">
                    <h2>Contact Us</h2>
                    <table>
                        <tr>
                            <td><label>Full Name</label></td>
                            <td><input type="text" name="name" size="20" maxlength="50" required/></td>
                        </tr>
                        <tr>
                            <td><label>Email</label></td>
                            <td><input type="text" name="email" size="20" maxlength="50" required/></td>
                        </tr>
                        <tr>
                            <td><label>Topic</label></td>
                            <td><input type="text" name="topic" size="20" maxlength="50" required/></td>
                        </tr>
                        <tr>
                            <td><label>Comment</label></td>
                            <td><textarea name="comment" cols="20" rows="6" required>Comment</textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Send"/></td>
                        </tr>
                    </table>
                </form>
            
        </div>
    </div>
    
    
    
    <?php include 'footer.inc' ?>

</body>
</html>
