<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Jaspel\Models\Profiles;
use Jaspel\Models\Pegawai;
use Jaspel\Models\Ruangan;

class UsersForm extends Form
{

    public function initialize($entity = null, $options = null)
    {

        // In edition the id is hidden
        if (isset($options['edit']) && $options['edit']) {
            $id = new Hidden('id');
        } else {
            $id = new Text('id', [
                'class' => 'form-control'
            ]);
        }

        $this->add($id);

        $idPegawai = new Select('idPegawai', Pegawai::find(), [
            'using' => ['idPegawai', 'namaPegawai'],
            'useEmpty'   => true,
            'emptyText'  => '-- Bukan Pegawai --',
            'emptyValue' => '',
            'placeholder' => 'Name Pegawai',
            'class' => 'form-control'
        ]);

        $this->add($idPegawai);

        $idRuangan = new Select('idRuangan', Ruangan::find(), [
            'using' => ['id', 'namaRuang'],
            'useEmpty'   => true,
            'emptyText'  => '...',
            'emptyValue' => '',
            'placeholder' => 'Name Pegawai',
            'class' => 'form-control'
        ]);

        $this->add($idRuangan);

        $name = new Text('name', [
            'placeholder' => 'Name',
            'class' => 'form-control'
        ]);

        $name->addValidators([
            new PresenceOf([
                'message' => 'The name is required'
            ])
        ]);

        $this->add($name);

        $email = new Text('email', [
            'placeholder' => 'Email',
            'class' => 'form-control'
        ]);

        $email->addValidators([
            new PresenceOf([
                'message' => 'The e-mail is required'
            ]),
            new Email([
                'message' => 'The e-mail is not valid'
            ])
        ]);

        $this->add($email);

        $profiles = Profiles::find([
            'active = :active:',
            'bind' => [
                'active' => 'Y'
            ]
        ]);

        $this->add(new Select('profilesId', $profiles, [
            'using' => [
                'id',
                'name'
            ],
            'useEmpty' => true,
            'emptyText' => '...',
            'emptyValue' => '',
            'class' => 'form-control'
        ]));

        $this->add(new Select('banned', [
            'Y' => 'Yes',
            'N' => 'No'
        ],[
            'class' => 'form-control'
        ]));

        $this->add(new Select('suspended', [
            'Y' => 'Yes',
            'N' => 'No'
        ],[
            'class' => 'form-control'
        ]));

        $this->add(new Select('active', [
            'Y' => 'Yes',
            'N' => 'No'
        ],[
            'class' => 'form-control'
        ]));
    }
}
