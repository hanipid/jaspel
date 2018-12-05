<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class PersentaseJaspelForm extends Form
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

        $jasaFix = new Text('jasaFix', [
            'placeholder' => 'JPL Fix',
            'class' => 'form-control'
        ]);

        $jasaFix->addValidators([
            new PresenceOf([
                'message' => 'The jasaFix is required'
            ])
        ]);

        $this->add($jasaFix);
    }
}
