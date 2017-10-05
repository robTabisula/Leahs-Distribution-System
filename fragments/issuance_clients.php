  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <link href="src/css/datatables.css" rel="stylesheet">

<script>
 function sendID(IDs){
          $("#AdjustedPriceDiv").html('Loading').show();
          var url="../fragments/clientsdata.php";
          $.post(url,{clientID:IDs},function(data){
          $("#AdjustedPriceDiv").html(data).show();
    ;});
    }
</script>

                                <h4>Clients</h4>
                                    <?php
                                        include('config.php');
                                        if (isset($_POST['location'])){
                                        $locationC=$_POST['location'];
                                        if($locationC=="Baguio"){
                                            $retrieveCat = ("SELECT *  FROM clients where c_location='Baguio'");
                                        }else{
                                            $retrieveCat = ("SELECT *  FROM clients where c_location='Pangasinan'");
                                        }
                                        }
                                        $clientRetrieve = mysqli_query($db, $retrieveCat);
                                    ?>                      
                                    <select name="clientlist" onchange="javascript:sendID(this.value);" required>
                                    <option value = "" selected="true" disabled="disabled">Select Client..</option>
                                        <?php
                                            foreach ($clientRetrieve as $data):
                                                $toData = $data["c_id"];
                                               
                                        ?>

                                        <option value = "<?php echo $data["c_id"];?>"> <?php echo $data["c_name"]; ?></option>
                                       <?php
                                            endforeach;
                                        ?>
                                    </select>