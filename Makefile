# Rule 1: download all data for the job and then run the job as described below

all: download_data featurecounts

download_data: genome.gtf test.paired_end.sorted.bam cov_genome.gtf cov_test.paired_end.sorted.bam

genome.gtf:
	wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/genome/genome.gtf

test.paired_end.sorted.bam:
	wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/illumina/bam/test.paired_end.sorted.bam

cov_genome.gtf:
	wget -O cov_genome.gtf https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/genome/genome.gtf

cov_test.paired_end.sorted.bam:
	wget -O cov_test.paired_end.sorted.bam https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/illumina/bam/test.paired_end.sorted.bam

# Rule 2: run code sbatch for "test" data and "sarscov2" data

featureCounts: test.counts.txt cov.counts.txt

# Rule 2-1: run sbatch for "test" data
test.counts.txt:
	sbatch submit_job.sh

# Rule 2-2: run sbatch for "sarscov2" data
cov.counts.txt:
	sbatch submit_cov.sh

conda_env:	
	conda env create --name=more-map-and-call --file=env.yaml

clean:
	genome.gtf test.paired_end.sorted.bam cov_genome.gtf cov_test.paired_end.sorted.bam


# last week 6-10
download_data: genome.gtf test.paired_end.sorted.bam

genome.gtf:
	wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/genome/genome.gtf

test.paired_end.sorted.bam:
	wget https://github.com/nf-core/test-datasets/raw/modules/data/genomics/homo_sapiens/illumina/bam/test.paired_end.sorted.bam

conda_env:	
	conda env create --name=more-map-and-call --file=env.yaml

clean:
	rm genome.gtf test.paired_end.sorted.bam



# homework 3, just for confirmation, will delete later
download_data: cov_genome.gtf cov_test.paired_end.sorted.bam

cov_genome.gtf:
	wget -O cov_genome.gtf https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/genome/genome.gtf

cov_test.paired_end.sorted.bam:
	wget -O cov_test.paired_end.sorted.bam https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/illumina/bam/test.paired_end.sorted.bam

conda_env:	
	conda env create --name=more-map-and-call --file=env.yam

clean:
	rm cov_genome.gtf cov_test.paired_end.sorted.bam