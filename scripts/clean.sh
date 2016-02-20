find . -name Makefile -exec rm {} \;
find . -name "Makefile.in" -exec rm {} \;
find . -name "*.in" -exec rm {} \;
find . -name "*.in~" -exec rm {} \;
find . -name "*.log" -exec rm {} \;
rm -f configure
