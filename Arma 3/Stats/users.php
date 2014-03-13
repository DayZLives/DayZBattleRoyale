<?PHP include("inc/config.php");        ?>
<?PHP include("inc/mysql_connectinfo.php"); ?>
<?PHP $sitestate = 'Home'; ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <?PHP echo'<title>'.$longsitename.' &middot; '.$sitestate.'</title>'; ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="The official leaderboard for DayZBR">
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
      <center><h1>Player Record</h1>
          <br><br></center>
          <?PHP
          $pID = $_GET['id'];
          mysql_real_escape_string($pUID);
          $getName = mysql_query("SELECT playerName, playerUID from player_data WHERE playerID = '$pID' LIMIT 1");
          while($row = mysql_fetch_assoc($getName)) {
                $playerName = $row['playerName'];
                $pUID = $row['playerUID'];
                
          }
          // Initialiasing of the count
          $KillsH = 0;
          $KillsB = 0;
          $Wins = 0;
          $pInfo = mysql_query("SELECT * FROM character_data WHERE playerUID = '$pUID'");
          while($row = mysql_fetch_assoc($pInfo)) {
                        if($row['Generation'] <= 1){
                                $KillsH = $KillsH + $row['KillsH'];
                                $Wins = $Wins + $row['KillsB'];
                        }
          }
                echo '<h2>'.$playerName.'</h2>';
                echo '<h3>'.$Wins.' Wins</h3>';
                echo '<h3>'.$KillsH.' Kills</h3>';
          ?>
          <br><br>
          <a href="http://dayzbattleroyale.com/leaderboard">back</a>
        </div>
    </div> <!-- /container -->
 
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