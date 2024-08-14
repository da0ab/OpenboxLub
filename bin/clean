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
    mkdir("papka");
    #my $ofile="> $InF\_\.htm";
    my $ofile="> papka/$InF";
    open(FFF, $ofile);
        $body=~s/&nbsp;/ /ig;
        $body=~s/(<img)/&nbsp;$1/ig;
        $body=~s/<!--.+?-->//igs;
        $body=~s/<![^>]+>//igs;
        $body=~s/ class[^>]+//ig;
$body=~s/ LANG[^>]+//ig;

        $body=~s/style=\'[^\']+?\'//ig;
        $body=~s/<\/?font[^>]*>//ig;
        $body=~s/<\/?span[^>]*>//ig;
        $body=~s/<\/?o:p>//ig;
        $body=~s/<\/?div[^>]*>//ig;
        $body=~s/<table[^>]+>/<table>/ig;
        $body=~s/(<[^>]+)valign=\w+/$1/ig;
        $body=~s/(<[^>]+)width=\d+/$1/ig;
        $body=~s/(<[^>]+)height=\d+/$1/ig;
        $body=~s/(<[^>]+)nowrap/$1/ig;
        $body=~s/<html[^>]+>/<html>/i;
        $body=~s/<body[^>]+>/<body>/i;
            $body =~ s/rowspan=(\d+)/rowspan="$1"/isg;
            $body =~ s/colspan=(\d+)/colspan="$1"/isg;
 	$body =~ s/м2/м<sup>2<\/sup>/isg;
$body =~ s/м²/м<sup>2<\/sup>/isg;
		$body =~ s/м3/м<sup>3<\/sup>/isg;
$body =~ s/м³/м<sup>3<\/sup>/isg;

        $body=~s/ (height|width|bgcolor|align|sdval|sdnum)\s*=\s*["'][^'"]+?["']//isg;
        $body=~s/ (height|width|bgcolor|align)\s*=\s*\w+//isg;
        $body=~s/style\s*=\s*["'][^'"]+?["']//isg;
#print $body;
        $body=~s/(<[^>]+)nowrap/$1/ig;
        $body=~s/ dir[^>]+//ig;

#LANG="en-US"
#<p><br /></p>
#<p></p>
$body=~s/<p><\/p>//ig;
$body=~s/<p><br \/><\/p>//igs;

       #tipografica
        $body=~s/&#150;/&mdash;/ig;
        $body=~s/\s-\s/ &mdash; /ig;
        $body=~s/\s-/ &mdash; /ig;
        $body=~s/\s-/ &mdash; /ig;
        $body=~s/—\s/ &mdash; /ig;
	$body=~s/–\s/ &mdash; /ig;
        $body=~s/`/ &laquo;/ig;
        $body=~s/\.\.\./&hellip;/ig;
        $body=~s/ '/ &laquo;/ig;
        $body=~s/' / &raquo;/ig;
        $body=~s/'/ &laquo;/ig;
        $body=~s/ &quot;/ &laquo;/ig;
        $body=~s/&quot; /&raquo; /ig;
        $body=~s/&quot;\./&raquo;\./ig;
        $body=~s/’/&rsquo;/ig;
        $body=~s/®/&reg;/ig;
        $body=~s/©/&copy;/ig;
        $body=~s/N°/№/ig;
        $body=~s/°/&deg;/ig;
        $body=~s/\s,/, /ig;
        $body=~s/\s\./\. /ig;
        $body=~s/\(\s/\(/ig;
            $body=~s/«/&laquo;/isg;
        $body=~s/»/&raquo;/isg;
$body=~s/…/&hellip;/ig;


#$body=~s/(<p>)\./\. /ig;
# $body=~s/\. htm/\.htm/ig;
#$body=~s/\. html/\.html/ig;
#$body=~s/\. jpg/\.jpg/ig;
#$body=~s/\. png/\.png/ig;
#$body=~s/\. gif/\.gif/ig;
#$body=~s/\. php/\.php/ig;
#$body=~s/\. \. \//..\//ig;



    $body=~s/<p[^>]+>/<p>/i;
    $body=~s/<(\w+)>\s*<\/\1>//isg;
    $body=~s/(<p>\s*)+/<p>/isg;
    $body=~s/(<br>\s*)+/<br \/>/isg;
    $body=~s/<(\w+)>\s*<\/\1>//isg;
    $body=~s/<\/i><i>/ /isg;
    $body=~s/<\/b><b>/ /isg;
    $body=~s/.+?(<body)/$1/is;

    $body=~s/<(\/?\w+)/'<'.lc($1)/isge;
    $body=~s/&nbsp;//isg;
    $body=~s/v:shapes=\".+?\">/alt=\"\" \/>/isg;
    $body=~s/<meta http-equiv=Content-Type content="text\/html; charset=windows-1251">
    <meta name=ProgId content=Word.Document>
    <meta name=Generator content="Microsoft Word 11">
    <meta name=Originator content="Microsoft Word 11">
    <link rel=File-List href="1_fvp.files\/filelist.xml">/<meta http-equiv=Content-Type content="text\/html; charset=windows-1251"\/>/isg;
    $body=~s/[\n\r]+/\n/isg;

    $body=~s/[ \t]+/ /sg;
    $body=~s/\s+>/>/sg;

    print (FFF "$body");
    close(FFF);
}
print "gotovo";
