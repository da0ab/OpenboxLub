#!c:/perl/bin/perl
use strict;

use strict;
my $fname;
my @filelist=glob('*.*');

foreach $fname(@filelist){
$fname=~tr/�-�/�-�/;

$fname=~s/�/zh/isg;
$fname=~s/�/ch/isg;
$fname=~s/�/sh/isg;
$fname=~s/�/sh/isg;
$fname=~s/�/yu/isg;
$fname=~s/�/ya/isg;

$fname=~s/�/a/isg;
$fname=~s/�/b/isg;
$fname=~s/�/v/isg;
$fname=~s/�/g/isg;
$fname=~s/�/d/isg;
$fname=~s/�/e/isg;
$fname=~s/�/e/isg;

$fname=~s/�/z/isg;
$fname=~s/�/i/isg;
$fname=~s/�/y/isg;
$fname=~s/�/k/isg;
$fname=~s/�/l/isg;
$fname=~s/�/m/isg;
$fname=~s/�/n/isg;
$fname=~s/�/o/isg;
$fname=~s/�/p/isg;
$fname=~s/�/r/isg;
$fname=~s/�/s/isg;
$fname=~s/�/t/isg;
$fname=~s/�/u/isg;
$fname=~s/�/f/isg;
$fname=~s/�/h/isg;
$fname=~s/�/c/isg;
$fname=~s/�/i/isg;
$fname=~s/�/iu/isg;
$fname=~s/�/i/isg;
$fname=~s/�/ie/isg;


#�-�

$fname=~s/ /_/ig;
$fname=~tr/`~@#$%^&*()+=|\;:'"<>?-/_/;

open(FFF, ">111.txt" ) ;
print (FFF join("\n", @filelist));
close(FFF);
}

print "gotovo";