<?php

require 'vendor/autoload.php';

use Helmestest\Controllers\Common;
use Helmestest\Controllers\UserController;
use Helmestest\Models\Sector;

Common::init();
?>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Form</title>
</head>
<body>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $uc = new UserController();
    $response = $uc->submit();

    echo '<p';
    if ($response['type'] == Common::RESPONSE_TYPE_ERROR) {
        echo ' style="color: red;"';
    } else {
        echo ' style="color: green;"';
    }
    echo '>' . $response['message'] . '</p>';
}
?>
<br>
<br>
Please enter your name and pick the Sectors you are currently involved in.
<br>
<br>
<form method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
    <label for="name">Name:</label>
    <input type="text" name="name" value="<?php echo $_SESSION['user']->name ?>">
    <br>
    <br>
    <label for="sectors[]">Sectors:</label>
    <select multiple size="5" name="sectors[]">
    <?php
        $sector_tree = Sector::getSectorsTree();
        printSelect($sector_tree);
    ?>
    </select>
    <br>
    <br>
    <input type="checkbox" name="accept_terms" value="1" <?php echo $_SESSION['user']->acceptTerms ? " checked" : "" ?>> Agree to terms
    <br>
    <br>
    <input type="submit" value="Save">
</form>
</body>
</html>

<?php

function printSelect(array $sectorsTree, string $space = "")
{
    foreach ($sectorsTree as $sector) {
        echo sprintf('<option value="%s"', $sector->id);
        if (in_array($sector->id, $_SESSION['user']->sectors)) {
            echo ' selected';
        }
        if (empty($sector->children)) {
            echo sprintf('>%s%s</option>', $space, $sector->name);
        } else {
            echo sprintf(' disabled>%s%s</option>', $space, $sector->name);
            printSelect($sector->children, str_repeat($space . '&nbsp;', 2));
        }

    }
}