#!/usr/bin/perl
use strict;
use Encode;
use POSIX;
my $start=time();
my $date_format='%d.%m.%Y';

die "Usage:\n\tcatalog.pl <source path> <gotovoe path>\n" if scalar(@ARGV)!=2;

my $root=$ARGV[0]; #'D:\Willow\prj\goglus\catalog';
my $dest=$ARGV[1]; #'D:\Willow\prj\goglus\output';

my $thnum=0;
mkdir "$dest";

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
		next if $entry=~/thumb_/;
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
	while($imgfile=~s/^\.\/+//) {}
	$imgfile=~/(.*[\\\/])(.+)$/is;
	my $path = $1;
	my $realname=$2;
	my $thumb_name = "$1thumb_$2";

	my $date = POSIX::strftime($date_format, localtime(((stat($imgfile))[9])));
	unlink($thumb_name);
if($imgfile!~/\.(doc|txt|ini|htm|html|pdf|rar|zip|indd|xls|qxd|ai)$/is){
my $cmd="convert \"$imgfile\" -layers flatten -colorspace RGB -strip -resize \"200x200>\" -gravity center -background white -extent \"200x200>\" \"$thumb_name\"";
		print "$cmd\n";
		system($cmd);
	}
	if(-f $thumb_name){
	#	$$py.="<h2><a href=\"$realname\"><img src=\"$thumb\" alt=\"$realname\" /></a></h2>\n";


		#bronner
                $$py.="<div class=\"box\"><a href=\"$imgfile\" rel=\"gb_imageset[pic]\"><img src=\"$thumb_name\" alt=\"\" title=\"\" /></a><p> </p></div>\n";

#alla
# $$py.="<p><a href=\"$imgfile\" rel=\"gb_imageset[nice_pics11]\" title=\"\"><img src=\"$thumb_name\" alt=\"\"  /></a><br /> <br /> <br /> <i> </i></p> \n";

#gostimport
	#	$$py.="<img src=\"$thumb_name\" id=\"$realname\"  onclick=\"enlarge(this);\" longdesc=\"$imgfile\" alt=\"\" title=\"\" />\n";
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
