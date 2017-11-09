#!/bin/bash

echo "---------------------------------------------------"
echo "1: get the name list text file"
wget https://projecteuler.net/project/resources/p022_names.txt
echo "   saved p0022_names.txt"
echo "---------------------------------------------------"
echo "2: set the alphabet to their numeric value"
l=1
for letter in {A..Z} ; do
  let $letter="$l"
  #echo $l;
  l=`expr $l + 1`;
done
echo "---------------------------------------------------"
echo "3: next parse and sort names"
#sort, and replace each comma with a line break and save to sortedNames.txt
cat p022_names.txt | tr -s ',' '\n' | sort  | tr -d '"' > sortedNames.txt
echo "   file saved as sortedNames.txt"
echo "---------------------------------------------------"
echo "4: now we will get the numeric value for each letter in each name and add them together."
#from sortedNames.txt
#replace each letter with its numeric value
#prepend " + " before numeric value - save to tmp
while IFS= read -r line; do
  for ((idx=0; idx < ${#line}; idx++)); do
    char=${line:$idx:1}
    val=${!char}
    printf '%s' " + " "$val" >> tmp
  done
   printf '\n' >> tmp
done < sortedNames.txt

#remove math.sh if left over from before, hide errors
rm -rf math.sh || true

#create math.sh and add bash header
echo "#!/bin/bash" > math.sh

# cleanup each line to do math
sed  's .\{3\}  ' tmp >> math.sh
sed -i -e 's/^/expr /' math.sh && rm tmp
sed -i 's/$/ >> nameVal.txt/' math.sh

#remove added strings from bash header
sed -i -e 's/expr #!/#!/g' math.sh
sed -i -e 's/h >> nameVal.txt/h/g' math.sh

#make math.sh exectutable, run and remove.
chmod +x math.sh && bash math.sh && rm math.sh
echo "   file saved as nameVal.txt"
echo "---------------------------------------------------"
echo "5: multiply each name value by its alphabetical position."

count=0
echo "#!/bin/sh" > math.sh
while ((i++)); read -r line
do
    echo  "expr " "$line" "\*" "$i" " >> nameScore.txt" >> math.sh
done < nameVal.txt
chmod +x math.sh && bash math.sh && rm math.sh
echo "  file saved as nameScore.txt"
echo "---------------------------------------------------"
echo "6: final step add all of the name scores in nameScore.txt"
echo " "
echo "What is the total of all the name scores in the file? "

#use paste to add all lines of a text file.
paste -sd+ nameScore.txt | bc 2>&1 | tee ANSWER.txt
#rm nameVal.txt && rm sortedNames.txt && rm nameScore.txt
