#!/bin/bash

lesson_name="$1"
exercise_num="$2"

# Create empty markdown file and shell script
if [ -d "./syllabus/$lesson_name" ]; then
    touch "./syllabus/$lesson_name/exercises/$exercise_num.md"
    touch "./syllabus/$lesson_name/exercises/scripts/$exercise_num.sh"

    echo "Exercise $exercise_num created for $lesson_name !"
else
    # TODO: Fix this endless recursion loop
    echo "$lesson_name does not exist!\nCreating a new lesson "
    ./tools/create-lesson.sh "$lesson_name"
    # ./tools/create-exercise.sh "$lesson_name" "$exercise_num"
fi

# Convert empty exercise files into basic templates
md_template="./tools/templates/exercise.md.txt"
sh_template="./tools/templates/exercise.sh.txt"

md_target=""
sh_target=""

cat "$sh_template" > "