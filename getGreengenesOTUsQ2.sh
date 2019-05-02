# First download Greengenes 13.8 from https://docs.qiime2.org/2019.1/data-resources/#marker-gene-reference-databases
# The 97_otus.fasta file is located in gg_13_8_otus/rep_set/97_otus.fasta

# Import Greengenes reference OTU sequences
qiime tools import \
  --input-path 97_otus.fasta \
  --output-path 97_otus.qza \
  --type 'FeatureData[Sequence]'

## Here table.qza and rep-seqs.qza are the processed ASV outputs from your Deblur or DADA2 analysis
qiime vsearch cluster-features-closed-reference \
  --i-table table.qza \
  --i-sequences rep-seqs.qza \
  --i-reference-sequences 97_otus.qza \
  --p-perc-identity 0.97 \
  --o-clustered-table table-cr-97.qza \
  --o-clustered-sequences rep-seqs-cr-97.qza \
  --o-unmatched-sequences unmatched-cr-97.qza

## Export qiime artifact  
qiime tools export \
  --input-path table-cr-97.qza \
  --output-path greengenes-cr-feature-table

## Convert biom table to a tab-delimited table  
biom convert -i greengenes-cr-feature-table/feature-table.biom -o otu_table.txt --to-tsv
