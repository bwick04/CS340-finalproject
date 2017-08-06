<?php
//Turn on error reporting
ini_set('display_errors', 'On');
//Connects to the database
$mysqli = new mysqli("oniddb.cws.oregonstate.edu","wickbe-db","0CbPy3LQH3Mw0w7z","wickbe-db");
if($mysqli->connect_errno){
	echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
	}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <body>

    <div>
      <table>
        <tr>
          <td>Players</td>
        </tr>
        <tr>
          <td>Name</td>
        </tr>
		
		<?php
		if(!($stmt = $mysqli->prepare("SELECT fname, lname FROM nfl_players"))){
			echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
		}

		if(!$stmt->execute()){
			echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		if(!$stmt->bind_result($fname,$lname)){
			echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		while($stmt->fetch($fname,$lame)){
		 echo "<tr>\n<td>\n" . $fname . "\n</td>\n</tr>";
		}
		$stmt->close();
		?>
      </table>
    </div>

    <div>
      <form method="post" action="addplayer.php"> <!-- Change this-->

        <fieldset>
          <legend>Name</legend>
          <p>First Name: <input type="text" name="FirstName" /></p>
          <p>Last Name: <input type="text" name="LastName" /></p>
        </fieldset>

        <p><input type="submit" /></p>
      </form>
    </div>

  </body>
</html>
