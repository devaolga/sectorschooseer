<?php


namespace Helmestest\Models;


use Exception;
use Helmestest\Controllers\Common;

/**
 * Class UserSector
 * @package Helmestest\Models
 */
class UserSector
{
    public CONST TABLE = 'user_sector';

    public int $userId;
    public int $sectorId;

    public function save(): bool
    {
        try {
            Common::$db->insert(UserSector::TABLE, [
                "sector_id" => $this->sectorId,
                "user_id" => $this->userId,
            ]);
            return true;
        } catch (Exception $e) {
            Common::saveErrorMsg($e->getMessage());
            return false;
        }
    }

    public static function getUserSectors($user): array
    {
        Common::$db->where("user_id", $user->id);
        try {
            $sectors = Common::$db->getValue(UserSector::TABLE, 'sector_id', null);
        } catch (Exception $e) {
            Common::saveErrorMsg($e->getMessage());
            return [];
        }
        if (empty($sectors)) {
            return [];
        }
        return array_values($sectors);
    }

    public static function update(User $user): bool
    {
        $existing_sectors = UserSector::getUserSectors($user);
        if (!empty($existing_sectors)) {
            $outdated_sectors = array_diff($existing_sectors, $user->sectors);
            if (!empty($outdated_sectors)) {
                try {
                    Common::$db->rawQuery("delete from " . UserSector::TABLE .
                        " where user_id=$user->id and sector_id in (" . implode(",", $outdated_sectors) . ")");
                } catch (Exception $e) {
                    Common::saveErrorMsg($e->getMessage());
                    return false;
                }
            }
        }

        foreach ($user->sectors as $sector) {
            if (!in_array($sector, $existing_sectors)) {
                $user_sector = new UserSector();
                $user_sector->userId = $user->id;
                $user_sector->sectorId = $sector;
                $user_sector->save();
            }
        }

        return true;
    }

}