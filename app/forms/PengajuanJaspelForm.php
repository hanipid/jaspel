<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Date;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Jaspel\Models\JenisJaspel;

class PengajuanJaspelForm extends Form
{

    public function initialize($entity = null, $options = null)
    {
        if ($options == 1) {
            $idJaspel = new Select('idJaspel', JenisJaspel::findByStatus('aktif'),[
                'using' => [ 'idJaspel', 'namaJaspel' ],
                'class' => 'form-control',
                'disabled' => 'disabled'
            ]); 
        } else {
            $idJaspel = new Select('idJaspel', JenisJaspel::findByStatus('aktif'),[
                'using' => [ 'idJaspel', 'namaJaspel' ],
                'class' => 'form-control'
            ]); 
        }
            
        $this->add($idJaspel);

        $startPeriode = new Date('startPeriode', [
            'placeholder' => '',
            'class' => 'form-control'
        ]);
        $this->add($startPeriode);

        $endPeriode = new Date('endPeriode', [
            'placeholder' => '',
            'class' => 'form-control'
        ]);
        $this->add($endPeriode);
    }
}
