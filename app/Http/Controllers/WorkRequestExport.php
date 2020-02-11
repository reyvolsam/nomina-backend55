<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class WorkRequestExport implements FromView
{
    public function view(): View
    {
        return view('workRequest', [
            'invoices' => "samuel"
        ]);
    }
}