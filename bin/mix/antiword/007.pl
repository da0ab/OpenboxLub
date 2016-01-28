#!/usr/bin/perl

use strict;
my $InF = undef;
my $OutF = undef;
my @files=glob('*.htm*');
undef $/ ;
foreach $InF (@files){
    next if $InF=~/_\.html?_/is;
    open(InF, "<$InF" ) or die "No file";
    my $body = <InF> ;
    close(InF) ;
    print "$InF\n";
    $InF=~/(.+\\)/is;
    mkdir("clean");
    my $ofile="> clean/$InF";
    open(FFF, $ofile);


   # /i - без учета регистра
   # /s - не прерывать матч на абзацах
   # /g - повтор
   #
   # перевод строки: линух \n, макось \r
   # [0-9] все цифры
   # [A-Z] все буквы
   # \d - любая цифра
   # [^>]+ неограниченное кол-во символов, кроме >
   # <p>.+?<\/p> все символы
   # (.+?) - запомнить матчь
   # $1 вставить 1 матчь
   # \s* - не прерываться на абзацах
   #



#$body=~s/<p>(.+?)<\/p>/<p><b>$1<\/b><\/p> /ig;
$body=~s/<p>([A-ZА-Я]+)<\/p>/<p><b>$1<\/b><\/p> /ig;


$body=~s/<td>\s*<p>/<td>/isg;







    print (FFF "$body");
    close(FFF);
}
print "gotovo";
