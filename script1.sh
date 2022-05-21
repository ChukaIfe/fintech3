#!/usr/bin/bash

#Question 19
#Write a shell script to accept a file name from user and check whether it's an ordinary file or a directoy.
#In case of file show the contents of the file and if it's a directory, show the number of files in that directory.

<<ab
echo "This is the solution for Question 19"
echo "Please enter your file name, for file remember to include the file extension:"
read filename
echo "Do you want to create a file or a directory?"
read answer

if [ $answer == file ]
then 
touch $filename
echo "You have created a file named $filename"
echo "Introduction to Linux and shells
Linux is an operating system, like macOS or Windows.
It is also the most popular Open Source and free, as in freedom, operating
system.
It powers the vast majority of the servers that compose the Internet. It's the
base upon which everything is built upon. But not just that. Android is based
on (a modified version of) Linux.
The Linux "core" (called kernel) was born in 1991 in Finland, and it went a
really long way from its humble beginnings. It went on to be the kernel of the
GNU Operating System, creating the duo GNU/Linux.
There's one thing about Linux that corporations like Microsoft and Apple, or
Google, will never be able to offer: the freedom to do whatever you want with
your computer.
They're actually going in the opposite direction, building walled gardens,
especially on the mobile side.
Linux is the ultimate freedom." > $filename

echo "The contents of your file $filename are displayed below:"
cat $filename
echo " This is the end of your file content"
else
mkdir $filename
echo "You have created a directory named $filename"

cd $filename
touch music{1..3}.mp3
touch pictures{1..4}.png
mkdir ben
echo "The number of files contained in your directory are:" 
ls | wc -l
echo "The contents of your directory are listed below"
tree
echo "Your present working directory is:" 
pwd
echo "Today's date is:"
date
echo "This script is completed"
fi
ab
