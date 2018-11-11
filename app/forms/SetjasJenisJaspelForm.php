<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class SetjasJenisJaspelForm extends Form
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

        $jenis = new Text('jenis', [
            'placeholder' => 'Jenis',
            'class' => 'form-control'
        ]);

        $jenis->addValidators([
            new PresenceOf([
                'message' => 'The jenis is required'
            ])
        ]);

        $this->add($jenis);

        $nilaiKonversi = new Text('nilaiKonversi', [
            'placeholder' => 'Nilai Konversi',
            'class' => 'form-control'
        ]);

        $nilaiKonversi->addValidators([
            new PresenceOf([
                'message' => 'The nilaiKonversi is required'
            ])
        ]);

        $this->add($nilaiKonversi);

        $this->add(new Select('tipe', [
            '1' => 'Konversi',
            '0' => 'Non Konversi'
        ],[
            'class' => 'form-control'
        ]));

        $this->add(new Select('status', [
            '1' => 'Aktif',
            '0' => 'Tidak Aktif'
        ],[
            'class' => 'form-control'
        ]));

        $namaTambahan = new Text('namaTambahan', [
            'placeholder' => 'Pendapatan tambahan',
            'class' => 'form-control'
        ]);

        $namaTambahan->addValidators([
            new PresenceOf([
                'message' => 'The namaTambahan is required'
            ])
        ]);

        $this->add($namaTambahan);

        $nominalTambahan = new Text('nominalTambahan', [
            'placeholder' => 'Nominal',
            'class' => 'form-control'
        ]);
    }
}
