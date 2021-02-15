<?php

namespace Helmestest\Models;

use Exception;
use Helmestest\Controllers\Common;

/**
 * Class User
 * @package Helmestest\Models
 */
class User
{
    public CONST TABLE = 'user';

    public string $name;
    public array $sectors;
    public bool $acceptTerms;
    public int $id;

    public function __construct()
    {
        $this->name = '';
        $this->sectors = [];
        $this->acceptTerms = false;
        $this->id = 0;
    }

    public function save(): bool
    {
        try {
            if ($this->id == 0) {
                $this->id = Common::$db->insert(User::TABLE, [
                    "name" => $this->name,
                    "accept_terms" => $this->acceptTerms,
                    "create_date" => Common::$db->now()
                ]);
            } else {
                Common::$db->where('id', $this->id);
                Common::$db->update(User::TABLE, [
                    "name" => $this->name,
                    "accept_terms" => $this->acceptTerms,
                    "update_date" => Common::$db->now()
                ]);
            }

            UserSector::update($this);

            return true;
        } catch (Exception $e) {
            Common::saveErrorMsg($e->getMessage());
            return false;
        }
    }

    public static function getUserByID(int $id): User
    {
        $user = new User();
        Common::$db->where('id', $id);
        try {
            $user_data = Common::$db->getOne(User::TABLE);
        } catch (Exception $e) {
            Common::saveErrorMsg($e->getMessage());
            return $user;
        }
        if (empty($user_data))
            return $user;
        $user->id = $id;
        $user->name = $user_data['name'];
        $user->acceptTerms = $user_data['accept_terms'];
        $user->sectors = UserSector::getUserSectors($user);
        return $user;
    }
}