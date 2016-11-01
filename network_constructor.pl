#!/usr/bin/perl -w
                                                                                                                                                               
# Open the file containing the DBL alpha sequences
print "what window length would you like to use?";
$length= <STDIN>;
print "what distance from the anchor points would you like to use. Default is 0?";
$position= <STDIN>;
print "File containing sequences:";
$varseq = <STDIN>;
chomp $varseq;
open(SEQS,$varseq) || die ("Cannot open file \"$varseq\"\n");
@sequenceList = <SEQS>;
close SEQS;

# Choose a filename for the output
print "File name for output? ";
$output = <STDIN>;
open(OUT,">$output");

print OUT "*my network\n\n";

#extract the names and the sequences
my $sequence = join('',@sequenceList);
@name_list=($sequence =~/\>(.+)[^\>]+/g);
@seq_list =($sequence =~/\>.+([^\>]+)/g);
my $nseq2=$#name_list+1;
my $a;
# Go through each sequence in turn finding PoLV sequences and counting cysteines
for ( $a=0; $a< $nseq2; $a++)

                            {
my $PSPB1;
my $PSPB2;
my $PSPB3;
my $PSPB4;
my $miniseq;
my $seq = $seq_list[$a];
my $name = $name_list[$a];
my $message=0;
$seq =~ s/[\s\d]//g;
#Define positional motifs
my $b = 'WW';
my $c = 'VW';
#Find PSPB2 and 3 based on the positional motifs
if ($seq =~ /$b/){
$where = rindex($seq,$b);
$PSPB2 = substr($seq,$where-4-$position-$length,$length);push (@PSPB2,$PSPB2);
$PSPB3 = substr($seq,$where+14+$position,$length);push (@PSPB3,$PSPB3);
$message = 0;
} else {
if($seq =~ /$c/){
$where = rindex($seq,$c);
$PSPB2 = substr($seq,$where-12-$length-$position,$length);push (@PSPB2,$PSPB2);
$PSPB3 = substr($seq,$where+6+$position,$length);push (@PSPB3,$PSPB3);
$message = 0;
} else {
$message = 1;
}}
#Find PSPB4
if ($message == 0) {
$PSPB4 = substr($seq,length($seq)-12-$length-$position,$length);
push (@PSPB4,$PSPB4);
#Find PSPB1
$PSPB1 = substr($seq,14+$position,$length);
push (@PSPB1,$PSPB1);
push (@selected,$name);
} }

my $nseq=$#PSPB2+1;
print OUT "*vertices $nseq\n";
$a=0;
my $count=0;
for ( $a=0; $a< $nseq; $a++)   {
my $nameA=$selected[$a];
$count++;
print OUT "$count \"$nameA\"\n"}
$a=0;
for ( $a=0; $a< $nseq-1; $a++)   {

my $PSPB1A = $PSPB1[$a];
my $PSPB2A = $PSPB2[$a];
my $PSPB3A = $PSPB3[$a];
my $PSPB4A = $PSPB4[$a];

#my $seqA=$seq_list[$a];
#print OUT "$PSPB1A $PSPB2A $PSPB3A $PSPB4A $seqA\n";

my $d;
for ($d=$a+1; $d< $nseq; $d++) {
my $PSPB1B = $PSPB1[$d];
my $PSPB2B = $PSPB2[$d];
my $PSPB3B = $PSPB3[$d];
my $PSPB4B = $PSPB4[$d];

if (($PSPB1A eq $PSPB1B)  or ($PSPB2A eq $PSPB2B)  or ($PSPB3A eq $PSPB3B)  or ($PSPB4A eq $PSPB4B)) {push (@ax,$a+1); push (@dx,$d+1);}}}

my $nnet=$#ax+1;

print OUT "*edgeslist\n";

$a=0;
for ( $a=0; $a<$nnet; $a++)   {
my $axA=$ax[$a];
my $dxA=$dx[$a];
my $output=$axA." ".$dxA;
print OUT "$output\n";     }

close OUT;



