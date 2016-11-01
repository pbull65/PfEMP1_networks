# PfEMP1_networks
exploring networks of DBLalpha sequences

These are scripts for constructing networks of DBLalpha tag sequences used in the following publication:

Bull, P.C., Buckee, C.O., Kyes, S., Kortok, M.M., Thathy, V., Guyah, B., Stoute, J.A., Newbold, C.I., and Marsh, K. (2008). Plasmodium falciparum antigenic variation. Mapping mosaic var gene sequences onto a network of shared, highly polymorphic sequence blocks. Molecular Microbiology 68, 1519-1534

network_constructor.pl
1) Run this Perl script to draw networks usingFASTA files of PfEMP1 alpha tag sequences.
2) Save the output with the extension "*.net"
3) Load into Pajek to visualize a network

DSID_cys PoLV group_BS group classifier3 and var1_new_with sequencev2.pl:
This script classifies DBLalpha sequences in FASTA format into 

1) the cys-POLV groups described in:

Bull, P.C., Kyes, S., Buckee, C.O., Montgomery, J., Kortok, M.M., Newbold, C.I., and Marsh, K. (2007). An approach to classifying sequence tags sampled from Plasmodium falciparum var genes. Molecular and Biochemical Parasitology 154, 98-102.
Bull, P.C., Berriman, M., Kyes, S., Quail, M.A., Hall, N., Kortok, M.M., Marsh, K., and Newbold, C.I. (2005). Plasmodium falciparum variant surface antigen expression patterns during malaria. PLoS Pathogens 1, e26.

2) Block sharing (BS) groups described in:

Bull, P.C., Buckee, C.O., Kyes, S., Kortok, M.M., Thathy, V., Guyah, B., Stoute, J.A., Newbold, C.I., and Marsh, K. (2008). Plasmodium falciparum antigenic variation. Mapping mosaic var gene sequences onto a network of shared, highly polymorphic sequence blocks. Molecular Microbiology 68, 1519-1534.

3) var 1 sequences described in:
 
Warimwe, G.M., Keane, T.M., Fegan, G., Musyoki, J.N., Newton, C.R., Pain, A., Berriman, M., Marsh, K., and Bull, P.C. (2009). Plasmodium falciparum var gene expression is modified by host immunity. Proceedings of the National Academy of Sciences, USA 106, 21801-21806.
