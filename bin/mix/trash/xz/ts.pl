#!c:/perl/bin/perl
use strict;

use strict;
my $fname;
my @filelist=glob('*.*');

foreach $fname(@filelist){
$fname=~tr/À-ß/à-ÿ/;

$fname=~s/æ/zh/isg;
$fname=~s/÷/ch/isg;
$fname=~s/ø/sh/isg;
$fname=~s/ù/sh/isg;
$fname=~s/þ/yu/isg;
$fname=~s/ÿ/ya/isg;

$fname=~s/à/a/isg;
$fname=~s/á/b/isg;
$fname=~s/â/v/isg;
$fname=~s/ã/g/isg;
$fname=~s/ä/d/isg;
$fname=~s/å/e/isg;
$fname=~s/¸/e/isg;

$fname=~s/ç/z/isg;
$fname=~s/è/i/isg;
$fname=~s/é/y/isg;
$fname=~s/ê/k/isg;
$fname=~s/ë/l/isg;
$fname=~s/ì/m/isg;
$fname=~s/í/n/isg;
$fname=~s/î/o/isg;
$fname=~s/ï/p/isg;
$fname=~s/ð/r/isg;
$fname=~s/ñ/s/isg;
$fname=~s/ò/t/isg;
$fname=~s/ó/u/isg;
$fname=~s/ô/f/isg;
$fname=~s/õ/h/isg;
$fname=~s/ö/c/isg;
$fname=~s/ú/i/isg;
$fname=~s/û/iu/isg;
$fname=~s/ü/i/isg;
$fname=~s/ý/ie/isg;


#à-¸

$fname=~s/ /_/ig;
$fname=~tr/`~@#$%^&*()+=|\;:'"<>?-/_/;

open(FFF, ">111.txt" ) ;
print (FFF join("\n", @filelist));
close(FFF);
}

print "gotovo";