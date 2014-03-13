<?PHP include("inc/config.php");?>
<?PHP include("inc/mysql_connectinfo.php"); ?>
<?PHP $sitestate = 'Home'; 

  ini_set('display_errors',1); 
  error_reporting(E_ALL);

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <?PHP echo'<title>'.$longsitename.' &middot; '.$sitestate.'</title>'; ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="The Official DE Leader-board for DayZ Battle Royale">
    <meta name="author" content="Blu3scReeN">
        <meta name="version" content="0.1">
 
    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="shortcut icon" href="ico/favicon.png">
  </head>
 
  <body>
 
 
    <div class="row">
       
        <div class="span8">
          <?PHP
          if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $name = $_POST['username'];
            $count = 0;
            $searchPlayer = mysql_query("SELECT playerUID FROM player_data WHERE playerName = '$name'");
            while($row = mysql_fetch_assoc($searchPlayer)){
              $id = $row['playerUID'];
              $count++;
            }
            if($count >= 1){
              $pUID = $id;
               mysql_real_escape_string($pUID);
               $getName = mysql_query("SELECT playerName from player_data WHERE playerUID = '$pUID' LIMIT 1");
               while($row = mysql_fetch_assoc($getName)) {
                  $playerName = $row['playerName'];
               }
              // Initialiasing of the count
              $KillsH = 0;
              $KillsB = 0;
              $Wins = 0;
              $pInfo = mysql_query("SELECT * FROM character_data WHERE playerUID = '$pUID'");
              while($row = mysql_fetch_assoc($pInfo)) {
                $KillsH = $KillsH + $row['KillsH'];
                $Wins = $Wins + $row['KillsB'];
              }
              echo '<h3><i>'.$playerName.'</i></h3>';
              echo ''.$Wins.' Wins.<br>';
              echo ''.$KillsH.' Kills.<br>';
            } else {
              echo 'Cannot find the user <i>'.mysql_real_escape_string($name).'</i>! Please try again...<br> <a href="index.php">back</a>';
            }
          }else{
            echo '
            <center><h1>DE Leaderboard</h1>
            <br><br></center>
            <h3>Global Statistics</h3>';
            $countplayers = 0;
            $globalkills = 0;
            $benutzername = mysql_query("SELECT * FROM character_data") or die(mysql_error());
            while($row = mysql_fetch_assoc($benutzername)) {
              $globalkills = $globalkills + $row['KillsH'];
              $globalkills = $globalkills + $row['KillsB'];
            }
           
            $playernumbers = mysql_query("SELECT * FROM player_data") or die(mysql_error());
            while($row = mysql_fetch_assoc($playernumbers)) {
              $countplayers++;
            }
            echo '<h3>'.$countplayers.' Total Players</h3>';
            echo '<h3>'.$globalkills.' Kills</h3><br /><br />';
        
            echo '<h3>Top 50 Players</h3>';
            $counttop5 = 0;
            
            $top5 = mysql_query("SELECT `PlayerUID`, SUM(KillsB), `Generation` FROM `character_data` GROUP BY `PlayerUID` ORDER BY SUM(KillsB) DESC");
            //$top5 = mysql_query("SELECT * FROM character_data ORDER BY KillsB  DESC");
            
            echo'<table class="table table-striped table-bordered table-hover">  
                 <tbody>
                  <tr class="success">  
                        <td>Playername</td>  
                        <td>Wins</td>  
                 </tr>';
            
            while($row = mysql_fetch_assoc($top5)) {
              
              if($counttop5 <= 49){
                
                $pUID = $row['PlayerUID'];
                
                $wins = $row['SUM(KillsB)'];
                
                if ($wins >= 5) {  $title = "champion";} elseif ($wins >= 20) { $title = "master";} else { $title = "winner1";}
                
                $top5name = mysql_query("SELECT * FROM player_data WHERE playerUID = '$pUID'");
                
                while($row = mysql_fetch_assoc($top5name)) {

                  if($row['Generation'] <= 1){
                    echo '<tr class="winner"><td>'.mysql_real_escape_string($row["playerName"]).
                         '<div class="'.$title.'">'.$title.'</div></td><td>'.mysql_real_escape_string($wins).'</td></tr>';
                  }
                }

                $counttop5++;
              }
            }
            echo '</tbody></table>';
          }
        ?>
          <br><br>
 
         
        </div>
    </div> <!-- /container -->
        <div class="footer">
                <center>
                &copy; 2013 - 2014 by <a href="http://dayzbattleroyale.com">DayZ Battle Royale</a>
                </center>
        </div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap-transition.js"></script>
    <script src="js/bootstrap-alert.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/bootstrap-dropdown.js"></script>
    <script src="js/bootstrap-scrollspy.js"></script>
    <script src="js/bootstrap-tab.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-button.js"></script>
    <script src="js/bootstrap-collapse.js"></script>
    <script src="js/bootstrap-carousel.js"></script>
    <script src="js/bootstrap-typeahead.js"></script>
 
  </body>
</html>