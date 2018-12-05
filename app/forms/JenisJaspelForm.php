<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class JenisJaspelForm extends Form
{

    public function initialize($entity = null, $options = null)
    {
        if (isset($options['edit']) && $options['edit']) {
            $idJaspel = new Hidden('idJaspel');
        } else {
            $idJaspel = new Text('idJaspel',[
            'class' => 'form-control'
        ]);
        }

        $this->add($idJaspel);

        $namaJaspel = new Text('namaJaspel', [
            'placeholder' => 'Jenis Jasa Pelayanan',
            'class' => 'form-control'
        ]);

        $namaJaspel->addValidators([
            new PresenceOf([
                'message' => 'Jenis Jasa Pelayanan is required'
            ])
        ]);

        $this->add($namaJaspel);

        $konversiJaspel = new Text('konversiJaspel', [
            'placeholder' => 'Nilai Konversi',
            'class' => 'form-control'
        ]);

        $konversiJaspel->addValidators([
            new PresenceOf([
                'message' => 'Nilai konversi is required'
            ])
        ]);

        $this->add($konversiJaspel);

        $this->add(new Select('tipeJaspel', [
            'konversi' => 'Konversi',
            'non konversi' => 'Non Konversi'
        ],[
            'class' => 'form-control'
        ]));

        $this->add(new Select('status', [
            'aktif' => 'Aktif',
            'tidak aktif' => 'Tidak Aktif'
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
