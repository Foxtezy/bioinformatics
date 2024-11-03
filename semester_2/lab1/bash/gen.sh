#!/bin/bash

rm -rf output
mkdir output

# Запускаем fastqc команду на fastq файле
fastqc ecoli.fastq --outdir output

# Перенесем  
mv ./output/ecoli_fastqc.html ./fastqc.html

# Проиндексируем референсную последовательность
bwa index -p ./output/ecoli.fna ecoli.fna

# Строим выравнивание в формате sam
bwa mem ./output/ecoli.fna ecoli.fastq > ./output/alignments.sam

# samtools view
samtools view -b ./output/alignments.sam -o ./output/alignments.bam

# Построим оценку
samtools flagstat ./output/alignments.bam > ./output/flagstat.txt

# Получаем проценты
percents=$(grep -o -P '\d+\.\d+%' ./output/flagstat.txt)
percents=$(echo $percents | sed 's/%//' |  cut -f1 -d' ')

echo "Качество выравнивания: $percents"

mv ./output/flagstat.txt ./flagstat.txt

if (( $(awk 'BEGIN {print ("'$percents'" > "90.0")}') ))
then
  samtools sort -o ./output/alignments.sorted.bam ./output/alignments.bam
  freebayes -f ecoli.fna ./output/alignments.sorted.bam > ./output/result.vcf
  echo "Finished"
else
  echo "BAD result"
fi
