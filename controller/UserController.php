<?php

namespace Helmestest\Controllers;

use Helmestest\Models\User;

/**
 * Class UserController
 * @package Helmestest\Controllers
 */
class UserController
{

    public function submit(): array
    {
        Common::clearResponseMsg();
        if (self::validate()) {
            $user = new User();
            $user->acceptTerms = (bool)$_POST['accept_terms'];
            $user->name = htmlentities($_POST['name']);
            $user->sectors = $_POST['sectors'];
            $user->id = $_SESSION['user']->id;
            Common::saveErrorMsg($_SESSION['user']->id);
            if ($user->save()) {
                $_SESSION['user'] = $user;
                Common::saveOKMsg("Info updated");
            }
        }
        return $_SESSION['response'];
    }

    private function validate()
    {
        if (empty($_POST['name'])) {
            Common::saveErrorMsg("Name is missing");
            return false;
        }
        if (empty($_POST['accept_terms'])) {
            Common::saveErrorMsg("Terms not accepted");
            return false;
        }
        if (empty($_POST['sectors'])) {
            Common::saveErrorMsg("Sectors not selected");
            return false;
        }
        foreach($_POST['sectors'] as $sector) {
            if (!in_array($sector, $_SESSION['sectors'])) {
                Common::saveErrorMsg("Selected incorrect sector");
                return false;
            }
        }
        return true;
    }
}