<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;
use DateTime;
use DateTimeZone;
use Jaspel\Models\Permissions;

/**
 * Jaspel\Models\Menus
 * All the profile levels in the application. Used in conjenction with ACL lists
 */
class Menus extends Model
{

    /**
     * ID
     * @var integer
     */
    public $id;

    /**
     * Name
     * @var string
     */
    public $nama;

    /**
     * Name
     * @var string
     */
    public $deskripsi;

    /**
     * Name
     * @var string
     */
    public $controller;

    /**
     * Name
     * @var string
     */
    public $url;

    /**
     * Name
     * @var id
     */
    public $parent;

    /**
     * Name
     * @var id
     */
    public $sort;

    public function now()
    {
        $datetime = new Datetime(
            "now",
            new DateTimeZone(
                $this->getDI()->getConfig()->application->timezone
            )
        );
        return $datetime->format(
            $this->getDi()->getConfig()->database->datetime
        );
    }

    public function getChilds()
    {
        $result = false;

        if($this->id) {
            $childs = self::find([
                "parent = $this->id",
                "order" => "sort"
            ]);
            if(count($childs)) {
                $result = $childs;
            }
        }

        return $result;
    }

    public function isParents()
    {
        $result = false;

        if($this->id) {
            $parents = self::find("parent = $this->id");
            if(count($parents)) {
                $result = true;
            }
        }

        return $result;
    }

    public function isThis($id, $controller)
    {
        $urls = self::findByParent($id);
        foreach ($urls as $url) {
            if ($url->controller == $controller) {
                $result = $url->controller;
            }
        }
        return $result;
    }

    public function getCheckPermissions($profilesId)
    {
        $result = false;
        $permissions = Permissions::find([
          "profilesId = ?1",
          "bind" => [1 => $profilesId],
          "group" => "resource"
        ]);

        if($permissions) {
            if(count($permissions)) {
                $result = $permissions;
            }
        }

        return $result;
    }
}
