use strict;
my $InF = undef;
my $OutF = undef;
my @files=glob('*.htm*');
undef $/ ;
foreach my $ofile (@files) {
open(FFF, $ofile);
my @data = <FFF>;
close(FFF);
my $body = join ('', @data);
$body =~s/<div id="aaa">[^<>]+(<div id="bbb">)/$1/sg;
open(FFF, $ofile.'.new');
print FFF $body;
close FFF;
}

