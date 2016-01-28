
#!/usr/bin/perl
#mkdig | mv file > dir


ls -1 > list.txt
cat list.txt | perl -lane 'if (/(.+?)\.pdf/) { mkdir $1; rename ($_, "$1/$_");}'
