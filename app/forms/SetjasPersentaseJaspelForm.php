<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class SetjasPersentaseJaspelForm extends Form
{

    public function initialize($entity = null, $options = null)
    {
        if (isset($options['edit']) && $options['edit']) {
            $id = new Hidden('id');
        } else {
            $id = new Text('id',[
            'class' => 'form-control'
        ]);
        }

        $this->add($id);

        $direksi = new Text('direksi', [
            'placeholder' => 'Direksi',
            'class' => 'form-control',
            'value' => '70'
        ]);

        $direksi->addValidators([
            new PresenceOf([
                'message' => 'The direksi is required'
            ])
        ]);

        $this->add($direksi);

        $jasa = new Text('jasa', [
            'placeholder' => 'Jasa',
            'class' => 'form-control',
            'value' => '30'
        ]);

        $jasa->addValidators([
            new PresenceOf([
                'message' => 'The jasa is required'
            ])
        ]);

        $this->add($jasa);

        $jpu = new Text('jpu', [
            'placeholder' => 'JPU',
            'class' => 'form-control',
            'value' => '20'
        ]);

        $jpu->addValidators([
            new PresenceOf([
                'message' => 'The jpu is required'
            ])
        ]);

        $this->add($jpu);

        $jpl = new Text('jpl', [
            'placeholder' => 'JPL',
            'class' => 'form-control'
        ]);

        $jpl->addValidators([
            new PresenceOf([
                'message' => 'The jpl is required'
            ])
        ]);

        $this->add($jpl);

        $admin = new Text('admin', [
            'placeholder' => 'Admin',
            'class' => 'form-control'
        ]);

        $admin->addValidators([
            new PresenceOf([
                'message' => 'The admin is required'
            ])
        ]);

        $this->add($admin);

        $jplFix = new Text('jplFix', [
            'placeholder' => 'JPL Fix',
            'class' => 'form-control'
        ]);

        $jplFix->addValidators([
            new PresenceOf([
                'message' => 'The jplFix is required'
            ])
        ]);

        $this->add($jplFix);
    }
}
