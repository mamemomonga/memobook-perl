.PHONY: all run

all: cpanfile.snapshot

cpanfile.snapshot:
	carton install

clean:
	rm -rf local cpanfile.snapshot

run:
	carton exec ./script.pl

