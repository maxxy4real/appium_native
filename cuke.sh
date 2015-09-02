cucumber -t @search BROWSER=android442 -f html -o ANDROID_442_rep & 
cucumber -t @search BROWSER=android43 -f html -o ANDROID_43_rep & 
cucumber -t @search BROWSER=safari -f html -o SAFARI_rep &
cucumber -t @search BROWSER=mobile -f html -o CHROME_rep &
