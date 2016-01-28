#!/usr/bin/perl
use strict;
use warnings;
use HTTP::Cookies;
use LWP::UserAgent;
use File::Path;

my $index_fn = 'index.txt';

my $dest_path = $ARGV[0];

die "Usage: perl grabber.pl <dest_path>\n" if !$dest_path;

mkpath ("$dest_path/i");
grab_ids();

grab_items();

#my $body = clean_file ("item.html", 1);
#print $body;

sub grab_ids {
	my @homelinks = qw(136 209 211 212 213 132 273 214);
	my $id_hash_ref = {};
	foreach (@homelinks) {
		get_index_page ($id_hash_ref, $_);
	}
	print "Grabbed " . scalar(keys (%$id_hash_ref)) . " ids\n";

	open (OUTF, ">$dest_path/$index_fn") or die "$!: $dest_path/$index_fn";

	foreach (sort {$a <=> $b} (keys (%$id_hash_ref))) {
		print (OUTF "$_\n");
	}

	close (OUTF);
	print "$dest_path/$index_fn written\n";
}

sub get_index_page { # hash_ref, par2
	my ($id_hash_ref, $par2) = @_;

	my $cookie_jar = HTTP::Cookies->new();

	my $ua = LWP::UserAgent->new();
	push (@{ $ua->requests_redirectable }, 'POST');

	$ua->cookie_jar ($cookie_jar);

	print "Fething par[2]=$par2...\n";
	my $response = $ua->post ('http://www.tdksm.ru/getlist.php',
		['par[2]' => $par2, cat => 9, length => 1000, page => 1]);

	if ($response->is_success()) {
		my $html = $response->decoded_content;
		#die $html;
		while ($html =~ s/<a href=\\"one\.php\?id=(\d+)\\"//s) {
			$id_hash_ref->{$1} = 1;
		}
	}
	else {
		die $response->status_line;
	}
}

sub grab_items {
	open (INF, "<$dest_path/$index_fn") or die "$!: $dest_path/$index_fn";
	my $counter = 5;
	while (my $id = <INF>) {
		chomp($id);
		my $html = get_item_page($id);

		$html = clean_item($html, $id);

		open (OUTF, ">:utf8", "$dest_path/$id.html") or die "$!: $dest_path/$id.html";
		print (OUTF $html);
		close (OUTF);
		print "$dest_path/$id.html written\n";
	}
	close (INF);
}

sub get_item_page { # id
	my ($id) = @_;

	my $cookie_jar = HTTP::Cookies->new();

	my $ua = LWP::UserAgent->new();
	push (@{ $ua->requests_redirectable }, 'POST');

	$ua->cookie_jar ($cookie_jar);

	print "Fething id=$id...\n";
	my $response = $ua->get ("http://www.tdksm.ru/one.php?id=$id");

	if ($response->is_success()) {
		return $response->decoded_content;
	}
	else {
		die $response->status_line;
	}
}

sub clean_file { # filename, item_id
	my ($fn, $item_id) = @_;
	open (INF, "<$fn") or die "$!: $fn";
	my @data = <INF>;
	close (INF);
	my $body = join ('', @data);
	return clean_item($body, $item_id);
}

sub clean_item { # body, item_id
	my ($html, $item_id) = @_;
	$html =~ /<!--CENTER - MAIN AREA-->(.+?)<!--CENTER - MAIN AREA-->/s;
$html = $1;
	$html =~ s/<div class="cell rightColumn">.+//s;
	my $image_fn = "i/$item_id.jpg";
	if ($html =~ s|(<img class="firstView" src=)"(http://www.tdksm.ru/photo/medium/\w+\.jpg)"|$1"$image_fn"|) {
		my $image_url = $2;
		my $image_data = get_image($image_url);
		open (IMG, ">$dest_path/$image_fn") or die "$!: $dest_path/$image_fn";
		binmode (IMG);
		print (IMG $image_data);
		close (IMG);
	}
	else {
		warn ("No image in $item_id");
	}
	return $html;
}

sub get_image { # url
	my ($url) = @_;

	my $cookie_jar = HTTP::Cookies->new();

	my $ua = LWP::UserAgent->new();
	push (@{ $ua->requests_redirectable }, 'POST');

	$ua->cookie_jar ($cookie_jar);

	print "Fething $url...\n";
	my $response = $ua->get ($url);

	if ($response->is_success()) {
		return $response->decoded_content;
	}
	else {
		die $response->status_line;
	}
}
