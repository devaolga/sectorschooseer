<?php

namespace Helmestest\Models;

use Exception;
use Helmestest\Controllers\Common;

/**
 * Class Sector
 * @package Helmestest\Models
 */
class Sector
{
    public CONST TABLE = "sector";

    public int $id;
    public string $name;
    public int $parentId;
    public array $children;

    public function __construct()
    {
        $this->id = 0;
        $this->children = [];
    }

    public function save(): bool
    {
        try {
            Common::$db->rawQuery("insert into " . Sector::TABLE
                . " (id, name, parent_id) values (
                $this->id,'" .
                addslashes($this->name) . "',
                $this->parentId
                )"
            );
            return true;
        } catch (Exception $e) {
            //TODO - Exceptions should not be displayed to user in normal life, but saved to log
            Common::saveErrorMsg($e->getMessage());
            return false;
        }
    }

    public static function getAll(): array
    {
        try {
            return Common::$db->get(Sector::TABLE);
        } catch (Exception $e) {
            Common::saveErrorMsg($e->getMessage());
            return [];
        }
    }

    public static function getSectorsTree(): array
    {
        return self::getRecursiveSectors(self::getAll(), 0);
    }

    private static function getRecursiveSectors(array $sectors, int $parent_id = 0): array
    {
        $sectors_tree = [];
        foreach ($sectors as $sector) {
            if ($sector['parent_id'] == $parent_id) {
                $sector_obj = new Sector();
                $sector_obj->name = $sector['name'];
                $sector_obj->id = $sector['id'];
                $children = self::getRecursiveSectors($sectors, $sector['id']);
                if (empty($children)) {
                    $_SESSION['sectors'][] = $sector['id'];
                } else {
                    $sector_obj->children = $children;
                }
                $sectors_tree[] = $sector_obj;
            }
        }
        return $sectors_tree;
    }
}