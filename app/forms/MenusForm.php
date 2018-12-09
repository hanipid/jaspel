<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Jaspel\Models\Menus;

class MenusForm extends Form
{

    public function initialize($entity = null, $options = null)
    {
        if (isset($options['edit']) && $options['edit']) {
            $id = new Hidden('id');

            $this->add(new Select(
                'parent', 
                Menus::find([
                    "id != ?1 AND parent = 0",
                    "bind" => [1 => $entity->id],
                    "order" => "sort asc"
                ]), 
                [
                    'using' => ['id', 'nama'],
                    'class' => 'form-control',
                    'useEmpty' => true,
                    'emptyText' => 'None',
                    'emptyValue' => '0'
                ]
            ));
        } else {
            $id = new Text('id',[
                'class' => 'form-control'
            ]);

            $this->add(new Select(
                'parent', 
                Menus::find([
                    "parent = 0",
                    // "bind" => [1 => $entity->id],
                    "order" => "sort asc"
                ]), 
                [
                    'using' => ['id', 'nama'],
                    'class' => 'form-control',
                    'useEmpty' => true,
                    'emptyText' => 'None',
                    'emptyValue' => '0'
                ]
            ));
        }

        $this->add($id);

        $nama = new Text('nama', [
            'placeholder' => 'Nama',
            'class' => 'form-control'
        ]);

        $nama->addValidators([
            new PresenceOf([
                'message' => 'Kolom Nama harus diisi'
            ])
        ]);

        $this->add($nama);

        $deskripsi = new Text('deskripsi', [
            'placeholder' => 'Deskripsi',
            'class' => 'form-control'
        ]);

        $this->add($deskripsi);

        $controller = new Text('controller', [
            'placeholder' => 'Controller',
            'class' => 'form-control',
            'value' => '#'
        ]);

        $controller->addValidators([
            new PresenceOf([
                'message' => 'Kolom Controller harus diisi'
            ])
        ]);

        $this->add($controller);

        $url = new Text('url', [
            'placeholder' => 'Url',
            'class' => 'form-control',
            'value' => '#'
        ]);

        $url->addValidators([
            new PresenceOf([
                'message' => 'Kolom Url harus diisi'
            ])
        ]);

        $this->add($url);

        $this->add(new hidden('sort'));
    }
}
