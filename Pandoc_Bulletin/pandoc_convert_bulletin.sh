#!/usr/bin/env bash 

PDF_LOC='/Users/wade/Desktop/bulletin.pdf'
HTML_LOC='/Users/wade/Desktop/index.html'
FINAL_LOC='/Users/wade/church_jekyll/_includes/announcements.html'
MERGE='/Users/wade/Dropbox/Pandoc/Pandoc_Bulletin/merge.markdown'
PRINT_LOC='/Users/wade/Desktop/announcements.pdf'
DIRECTORY='/Users/wade/Dropbox/Pandoc/Pandoc_Bulletin'


cd $DIRECTORY &&
/Users/wade/Scripts/gdatacopier-2.1.2/gcp.py wadesallen@gmail.com:/docs/Publications/Bulletin* -p etcitrwggozcxogd $DIRECTORY -f txt && 
#/Users/wade/Scripts/gdatacopier-2.1.2/gcp.py wadesallen@gmail.com:/docs/Pastoral_Care/Pastoral_Prayer_List* -p etcitrwggozcxogd $DIRECTORY -f txt && 
pandoc $DIRECTORY/Bulletin.txt -o $PDF_LOC --template $DIRECTORY/template_files/bulletin_template.tex &&
pandoc $DIRECTORY/Bulletin.txt -o $HTML_LOC --template=$DIRECTORY/html/html_bulletin_template.html &&
sed /'<h1'/d $HTML_LOC | sed s/'<h2 '/'<h2 class="title"'/g | sed s:'</h2>':'<span class="line"></span></h2>':g | sed s:'<p></p>':' ':g > $FINAL_LOC &&
rm $HTML_LOC &&
# pandoc $FINAL_LOC -o $MERGE &&
# pandoc $DIRECTORY/Pastoral_Prayer_List.txt -o prayer_list.markdown &&
# cat $DIRECTORY/prayer_list.markdown $MERGE  > $DIRECTORY/announcements.markdown &&
# pandoc $DIRECTORY/announcements.markdown -o $PRINT_LOC --template=$DIRECTORY/template_files/announcements_template.tex &&
rm $DIRECTORY/Bulletin.txt
# rm $DIRECTORY/Pastoral_Prayer_List.txt &&
# rm $DIRECTORY/announcements.markdown &&
# rm $DIRECTORY/prayer_list.markdown &&
# rm $MERGE