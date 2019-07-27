#!/usr/bin/env sh

# build main file
cd ./src
for i in 1 2 3
do
	pdflatex                      \
		--file-line-error         \
		--output-directory ../bin \
		--halt-on-error           \
		main.latex
    if [ $? -ne 0 ]; then
        exit
    fi
done

# unite pdf files
cd ../bin
pdfunite               \
	title-page.pdf     \
	title-page-rev.pdf \
	main.pdf           \
	colophon.pdf       \
	verlibr.pdf

rm main*