#!/usr/bin/perl
use strict;
use Encode;
use POSIX;
my $start=time();

die "Usage:\n\tcatalog.pl <source path>\n" if scalar(@ARGV)!=1;

my $root=$ARGV[0]; #'D:\Willow\prj\goglus\catalog';
my $fcount=0; my $dcount=0;

dir_crowler($root, 0);
print "Scanned $dcount folders, $fcount files.\n";

sub dir_crowler{ # path, level
	my($path, $level)=@_;
	$dcount++;
	$path=~s/\\/\//isg;
	my @dirs=sort(glob("$path/*"));
	my @moredirs;
	my($prev_yes, $prev_no);
	foreach my $entry(@dirs){
		if(-d $entry){
			push(@moredirs, $entry);
		}
		else{
			if(is_rus($entry)){
				print "$entry\n";
			}
			$fcount++;
		}
	}
	$level++;
	foreach my $entry(@moredirs){
		if(is_rus($entry)){
#			print "$entry/\n";
		}
		dir_crowler("$path/$entry", $level);
	}
}

sub is_rus{
	$_[0]=~s/.+[\\\/]//is;
	return $_[0]=~/[à-ÿÀ-ß]/s;
}
