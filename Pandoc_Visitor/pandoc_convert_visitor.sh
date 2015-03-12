#!/usr/bin/env bash 

PDF_LOC='/Users/wade/Desktop/visitor.pdf'
HTML_LOC='/Users/wade/Desktop/index.html'
FINAL_LOC='/Users/wade/church_jekyll/_includes/visitor.html'
DIRECTORY='/Users/wade/Dropbox/Pandoc/Pandoc_Visitor'


cd $DIRECTORY &&
/Users/wade/Scripts/gdatacopier-2.1.2/gcp.py wadesallen@gmail.com:/docs/Publications/Visitor* -p etcitrwggozcxogd $DIRECTORY -f txt && 
pandoc $DIRECTORY/Visitor.txt -o $PDF_LOC --template $DIRECTORY/template_files/visitor_template.tex &&
pandoc $DIRECTORY/Visitor.txt -o $HTML_LOC --template=$DIRECTORY/html/html_visitor_template.html &&
sed /'<h1'/d $HTML_LOC | sed s/'<h2 '/'<h2 class="title"'/g | sed s:'</h2>':'<span class="line"></span></h2>':g | sed s:'<ul>':'<ul class="square-list">':g | sed s:'<p></p>':' ':g > $FINAL_LOC &&
rm $HTML_LOC &&
rm $DIRECTORY/Visitor.txt
