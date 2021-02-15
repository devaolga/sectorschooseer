<?php

namespace Helmestest\Controllers;

use Exception;
use Helmestest\Models\User;
use MysqliDb;

/**
 * Class Common
 * @package Helmestest\Controllers
 */
class Common
{
    public static MysqliDb $db;

    public const RESPONSE_TYPE_ERROR = "err";
    public const RESPONSE_TYPE_MESSAGE = "msg";

    //TODO This should be in .env file
    private const HOST = "0.0.0.0";
    private const USER = "newuser";
    private const PASS = "password";
    private const DATABASE = "helmes";
    private const PORT = 3306;

    public static function init()
    {
        session_start();
        self::mysqlConnect();
        self::$db = MysqliDb::getInstance();

        if (empty($_SESSION['user'])) {
            $_SESSION['user'] = new User();
        } else {
            $_SESSION['user'] = User::getUserByID($_SESSION['user']->id); //refresh in case was updated from outside
        }
        if (empty($_SESSION['response'])) {
            $_SESSION['user_id'] = 0;
        }
    }

    public static function clearResponseMsg()
    {
        $_SESSION['response'] = null;
    }

    public static function saveErrorMsg(string $text)
    {
        self::saveResponseMsg($text, self::RESPONSE_TYPE_ERROR);
    }

    public static function saveOKMsg(string $text)
    {
        self::saveResponseMsg($text, self::RESPONSE_TYPE_MESSAGE);
    }

    private static function saveResponseMsg(string $text, string $type)
    {
        $_SESSION['response'] = ['type' => $type, 'message' => $text];
    }

    private static function mysqlConnect()
    {
        try {
            new MysqliDb (self::HOST, self::USER, self::PASS,
                self::DATABASE);
        } catch (Exception $e) {
            self::saveErrorMsg($e->getMessage());
        }
    }
}