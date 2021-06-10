download_data: genome.gtf test.paired_end.sorted.bam

genome.gtf:
    wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/genome/genome.gtf

test.paired_end.sorted.bam:
    wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/illumina/bam/test.paired_end.sorted.bam
conda_env:	
	conda env create --name=more-map-and-call --file=env.yaml
# A phony target. Any target that isn't a file.
# It will never be up to date so make will always try to run it.
clean:
	rm file*.txt