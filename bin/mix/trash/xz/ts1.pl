#!c:/perl/bin/perl
use strict;
my $fname;
my @filelist=glob('*.*');
open(FFF, ">111.txt" ) ;
foreach $fname(@filelist){
if($fname=~/[�-��-ߨ�]/is){
print (FFF "$fname\n");
}}close(FFF);
print "goTovo";













