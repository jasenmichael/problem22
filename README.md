Options to complete Standard 2:
     Solve one standard logic puzzle, and submit your solution and an explanation of how you approached the problem. You can find an explanation of how to solve this type of logic puzzle here and sample problems here.
     Solve one Problem from Project Euler and submit your solution and an explanation of how you approached the problem.
     Create a youtube video, an essay, or something else where you demonstrate your problem solving skills.


I chose to solve problem 22 from Project Euler.
https://projecteuler.net/problem=22

Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

scope of plan:
download and inspect file, the file is a plain text. The file is one line, the names are in double quotes, the names are in CAPS, and names are delimited by commas.

todo
    1: get name list
    2: set alphabet to their corresponding numeric values.
    3: parse and sort name list.
    4: get numeric value for each letter in each name and add them to get their name value.
    5: for each name; get their alphabetical position and multiply it by name value to get name score.
    6: add all name scores for answer to - What is the total of all the name scores in the file?

notes:

so to sort the names in a text file and do math.. hmm, this could be done in so many ways, but quickly I can figure out how to do this via the terminal and bash scripting.

first I will create a directory for the project

    cd Documents

    mkdir galvanize-portfolio-3


next  I go into my project directory and download the text file of names.

    cd galvanize-portfolio-3

    wget https://projecteuler.net/project/resources/p022_names.txt

with a little research I used this command to sort, and replace each comma with a line break and save to "sortedNames.txt"

    cat p022_names.txt | tr -s ',' '\n' | sort  | tr -d '"' > sortedNames.txt

I am going to create a bash script now where to start putting things into

   touch solve.sh

   atom solve.sh

comments located in "solve.sh" bash script to solve the steps I broke down above.