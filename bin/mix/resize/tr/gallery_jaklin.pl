#!/usr/bin/perl
use strict;
use Encode;
use POSIX;
my $start=time();
my $date_format='%d.%m.%Y';
my $THDIR="_t";

die "Usage:\n\tcatalog.pl <source path> <gotovoe path>\n" if scalar(@ARGV)!=2;

my $root=$ARGV[0]; #'D:\Willow\prj\goglus\catalog';
my $dest=$ARGV[1]; #'D:\Willow\prj\goglus\output';

my $thnum=0;
mkdir "$dest";
mkdir "$dest/$THDIR";

my $output='';
dir_crowler($root, 0);
Encode::from_to($output, "cp1251", "utf-8");
open(OUT, ">$dest/index.html");
print(OUT header());
print(OUT $output);
print(OUT "</div>\n</div>\n</body>\n</html>\n");
close(OUT);

print "\nFinished. Time elapsed: ".(time()-$start)." sec\n";
my $res;
$res=<STDIN>;

sub dir_crowler{ # path, level
	my($path, $level)=@_;
	$path=~s/\\/\//isg;
	$output.="\n<h1>$path</h1>\n";
	my @dirs=sort(glob("$path/*"));
	my @moredirs;
	my($prev_yes, $prev_no);
	foreach my $entry(@dirs){
		next if $entry=~/$THDIR/is;
		if(-d $entry){
			push(@moredirs, $entry);
		}
		else{
			process_image($entry, $level, \$prev_yes, \$prev_no);
		}
	}
	$output.="$prev_yes$prev_no";
	$level++;
	foreach (@moredirs){
		dir_crowler($_, $level);
	}
}

sub process_image{ # filename, dir level
	my($imgfile, $level, $py, $pn)=@_;
	$imgfile=~/.*[\\\/](.+)$/is;
	my $realname=$1;

	my $date = POSIX::strftime($date_format, localtime(((stat($imgfile))[9])));
	my $thumb=sprintf("$THDIR/$realname", $thnum);
	my $th_full="$dest/$thumb";
	unlink($th_full);
if($imgfile!~/\.(doc|txt|ini|htm|html|pdf|rar|zip|indd|xls|qxd|ai)$/is){
my $cmd="convert \"$imgfile\" -layers flatten -colorspace RGB -strip -resize \"79x99>\" -gravity center -background black -extent \"79x99>\" \"$th_full\"";
		print "$cmd\n";
		system($cmd);
	}
	if(-f $th_full){
	#	$$py.="<h2><a href=\"$realname\"><img src=\"$thumb\" alt=\"$realname\" /></a></h2>\n";
		$$py.="<img src=\"$thumb\" id=\"a$realname\"  onclick=\"enlarge(this);\" longdesc=\"$realname\" alt=\"\" title=\"\" />\n";
		$thnum++;
	}
}

sub header(){
	return <<EOF;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="js/enlargeit.js"></script>
<style>
/* <![CDATA[ */
  
  body {
	margin: 0px;
	padding: 0px;
	font-size: small;
	background: rgb(255,255,255);

}
 h1 {
	font-family: Verdana, Arial, Helvetica, sans-serif; 	font-size:18px; background-color:#D2D2D2;
}

.tema{
	margin-left: 82px;
	margin-right: 82px;
	padding-top: 10px;
}

.site img {
	padding: 11px 0px 11px 0px;
}
.site h1 {
	clear: both;
}
.site h2 {
	float: left;
	margin: 0px 44px 22px 0px;
	padding: 11px;
	/*background-color:#777;*/ border: 1px solid #D2D2D2;
	font-size:15px;
	text-align:center;
	font-weight:normal;
}
.site  p{font-size:15px;}
  /* ]]> */
</style>

</head>
<body>

<div class="tema">
<div class="site">

EOF
}
