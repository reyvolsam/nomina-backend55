<?php

namespace App\Imports;

use App\WorkDemo;
use Maatwebsite\Excel\Concerns\ToModel;

class WorkImport implements ToModel
{
    /**
     * @param array $row
     *
     * @return User|null
     */
    public function model(array $row)
    {
        return new WorkDemo([
           'code'     => $row[0]
        ]);
    }
}