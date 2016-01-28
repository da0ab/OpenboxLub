#!c:/perl/bin/perl

use strict;
my $fname='¬ас€_тџч®т_н…@п–ав.gif';

$fname=~tr/ј-я®/а-€е/;


$fname=~s/ж/zh/isg;
$fname=~s/ч/ch/isg;
$fname=~s/ш/sh/isg;
$fname=~s/щ/sh/isg;
$fname=~s/ю/yu/isg;
$fname=~s/€/ya/isg;
$fname=~s/а/a/isg;
$fname=~s/б/b/isg;
$fname=~s/в/v/isg;
$fname=~s/г/g/isg;
$fname=~s/д/d/isg;
$fname=~s/е/e/isg;
$fname=~s/Є/e/isg;
$fname=~s/з/z/isg;
$fname=~s/и/i/isg;
$fname=~s/й/y/isg;
$fname=~s/к/k/isg;
$fname=~s/л/l/isg;
$fname=~s/м/m/isg;
$fname=~s/н/n/isg;
$fname=~s/о/o/isg;
$fname=~s/п/p/isg;
$fname=~s/р/r/isg;
$fname=~s/с/s/isg;
$fname=~s/т/t/isg;
$fname=~s/у/u/isg;
$fname=~s/ф/f/isg;
$fname=~s/х/h/isg;
$fname=~s/ц/c/isg;
$fname=~s/ъ/i/isg;
$fname=~s/ы/iu/isg;
$fname=~s/ь/i/isg;
$fname=~s/э/ie/isg;

$fname=~s/ /_/ig;
$fname=~tr/`~@#$%^&*()+=|\;:'"<>?-/_/;

print $fname;
