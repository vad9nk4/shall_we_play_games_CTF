<!DOCTYPE html>
<?php
$cookie_name = "cookie";
$cookie_value = "You_dont_like_games";
setcookie($cookie_name, $cookie_value, time() + (86400 * 30), ".");
?>
<html>
<head lang="en">
    <title>Whole Game</title>
    <link rel="stylesheet" href="./css/qwerty.css">
    <meta charset="utf-8"/>

</head>

<body>
    <div id="games_pics">
        <img src="./images/justfive.jpg" alt="justfive" title="justfive"/>
        <img src="./images/wasd.jpg" alt="wasd" title="wasd"/>
    </div>
    <p>
        If you wanna play with johny</br>
        You must to let them some games<br/>
        You need to find a way to let Johny play games        
        <!--Johny likes games-->
    </p>
    <form action="./zoeken.php" method="post">
        <label for="text_input">What do you do ? </label>
        <input type="text" id="text_input" name="text_input"><br>
    </form>
<?php
if(isset($_COOKIE['cookie']) && $_COOKIE['cookie'] != "You_dont_like_games"){
 ?>
<p>You successfully help a Johny to find a games! Lets play:<br/>
        You end up reaching a strange games: sense_of_life.html</p>
<?php
}
?>
<?php
if (isset($_POST['text_input'])) {
    echo "I did not expect that.";
}
?>
</body>
</html>