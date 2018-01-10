<?php
session_start(); 
    $clientid=$_POST['clientID'];
    $_SESSION['CCC'] = $clientid;
    include('config.php');
//view client data
        $selectquery="SELECT * from clients where c_id='$clientid'";
        $selectactivate=mysqli_query($db, $selectquery);
        $selectedclient=mysqli_fetch_array($selectactivate);
        $name=$selectedclient['c_name'];
        $address=$selectedclient['c_address'];
        $location=$selectedclient['c_location'];
//print out client data
    echo "<b style='color:gray;'>Client Name</b>";
    echo "<h4>".$name."</h4>";
    echo "<hr>";
    echo "<h5 style='color:gray; display:inline; '>Address: </h5>";
    echo $address;
    echo "<hr>";
    echo "<h5 style='color:gray; display:inline;'>Location: </h5>";
    echo $location;
?>
