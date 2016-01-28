#!c:/perl/bin/perl
use strict;
my $fname;
my @filelist=glob('*.*');
open(FFF, ">111.txt" ) ;
foreach $fname(@filelist){
if($fname=~/[à-ÿÀ-ß¨¸]/is){
print (FFF "$fname\n");
}}close(FFF);
print "goTovo";













