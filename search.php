<!DOCTYPE html>

<html>
<head>
    <title>Red House Real Estate | Search</title>
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
    
    <!--create main content area-->
    <div id="content">
        <div id="image">
            <img src="img/pexels-photo-186077.jpeg" alt="Image of House" height=400px/> <!--use as bg instead? -->
        </div>
        
        <div id="form">
            <form action="search_result.php" method="post" >
                <fieldset>
                    <legend>Search</legend> <!--see realestate.com.au for example search layout-->
                    <table>
                        <tr>
                            <td><label>Property ID:</label></td>
                            <td><input type="text" name="property_id" size="15" maxlength="50"/></td>
                        </tr> <!--combine property ID and suburb? But only limited to some suburbs in South Brisbane, not all-->
                        <tr>
                            <td><label>Suburb:</label></td>
                            <td><select name="suburb" id="suburb">
                            <option value="*"> </option>
                            <?php
                            $pdo = new PDO('mysql:host=localhost;dbname=phyllisy_rhre', 'phyllisy_ifb299', 'Miggles_3');
                            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                            try {
                                $result = $pdo->query('SELECT DISTINCT suburb FROM phyllisy_rhre.properties ORDER BY suburb');
                            }
                            catch (PDOException $e) {
                                echo $e->getMessage();
                            }
                            foreach ($result as $properties) {
                                echo '<option value="'.$properties['suburb'].'">'.$properties['suburb'].'</option>';
                            }
                            ?>

                            </select></td>
                        </tr>
                        <tr>
                            <td><label>Weekly Rent:</label></td> <!--dropdown?-->
                            <td>
                            <select name="rent_op" id="rent_op">
                                <option value="300" multiple="multiple">Up to $300</option>
                                <option value="400" multiple="multiple">$300 to $400</option>
                                <option value="500" multiple="multiple">$400 to $500</option>
                                <option value="600" multiple="multiple">$500 to $600</option>
                                <option value="5000" multiple="multiple">$600+</option>
                            </select>
                            </td>
                        
                            <td><label>Property Type:</label></td>
                            <td>
                            <select name="property_op" id="property_op">
                                <option value="house" multiple="multiple">House</option>
                                <option value="townhouse" multiple="multiple">Townhouse</option>
                                <option value="apartment" multiple="multiple">Apartment/Unit</option>
                                <option value="villa" multiple="multiple">Villa</option>
                                <option value="retirement" multiple="multiple">Retirement Living</option>
                            </select>
                            
                            <td><label>Furnishings:</label></td>
                            <td>
                            <input type="radio" name="furnish" value="Yes"/> Yes
                            <input type="radio" name="furnish" value="No"/>No</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Search"/></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
    
    <?php include 'footer.inc' ?>

</body>
</html>
