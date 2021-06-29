<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class EmployeeExport implements FromCollection, WithHeadings
{
    use Exportable;

    protected $employees;

    public function __construct($employees = null) {
        $this->employees = $employees;
    }

    public function headings(): array
    {
        return [
            'Código', 'Fecha de alta', 'Fecha de baja', 'Fecha de reingreso', 
            'Tipo de contrato', 'Apellido paterno', 'Apellido materno', 'Nombre', 'Tipo de periodo',
            'Salario diario', 'Base de cotización', 'Estatus del empleado', 'Departamento', 'Metodo de pago',
            'Turno de trabajo', 'Afore', 'Num seguridad social', 'RFC', 'CURP', 'Sexo', 'Ciudad de nacimiento', 'Fecha de nacimiento', 'UMF',
            'Nombre del padre', 'Nombre de la madre', 'Dirección', 'Puesto', 'Población', 'Entidad federativa de domicilio', 'CP', 'Telefono',
            'Número FONACOT', 'Correo electrónico', 'Clabe interbancaria', 'Tipo de prestación'
        ];
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return $this->employees;   
    }
}
