#! bin/bash


#This script is written for the installation and setup of Maven on an instance

#You can install maven on windows and Linux
#It is advisable to carryout Maven installation in Centos 7 & 8 and RHEL 7 & 8
#t2 medium 4GM RAM
#I however found it to work on t2 micro 1GB RAM, it may become slower as more builts are made! 
#-------------------------------------------------------------------------------------------------------------------------
#1. JAVA -  Pre Requisite Software  and Git for code download
#-----------------------------
# Become root and cd /opt  (sudo su && cd /opt)
sudo hostname maven
echo "host name renamed to maven"
user=ec2-user
echo "Switch user to $user"
sudo su ec2-user

touch maven_bash2.sh

cho "
echo "user switched to $user"
echo "change directory to /opt"
sudo cd /opt
echo "directory changed to /opt"
echo "now install wget, nano, tree, unzip and git, use sudo previlages"
sudo yum install wget nano tree unzip git-all -y
echo "installation of wget, nano, tree, unzip and git completed"
echo "install required java JDK, this should come with the JRE"
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
echo "installation of java JDK completed"
#Confirm installation by running command
echo "This is java version installed :" 
sudo java -version
echo "This is git version installed :" 
sudo git --version

#if displays git and java versions, applications are working ok!

#2. Install Maven.sh
echo "Install Maven in step two"

#------------------
#Step1) Download the Maven Software
echo "start download of Maven, use sudo previlages"
sudo wget https://downloads.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip
echo "download complete"
echo "now unzipping file"
sudo unzip apache-maven-3.8.5-bin.zip
echo "unzipping completed"
echo "removing zipped directory to save space" 
sudo rm -rf apache-maven-3.8.5-bin.zip
echo "directory removed!"
echo "renaming unzipped folder to maven"
sudo mv apache-maven-3.8.5/ maven
echo "renaming completed"

#Step3) Set Environmental Variable  -  For Specific User
#----------------------
echo "setting up Environmental variable for specific user"
sudo vi ~/.bash_profile
echo "export M2_HOME=/opt/maven" >> ~/.bash_profile
echo "export PATH=$PATH:$M2_HOME/bin" >> ~/.bash_profile
echo "ENV setup completed"
#or
#Step3b) Set Environmental Variable  For All Users
---------------------- 
#vi /etc/profile
#export M2_HOME=/opt/maven
#export PATH = $PATH:$M2_HOME/bin

#step4) Activate the maven home and mvn by running the below scripts
echo "sourcing file to implement changes"
source ~/.bash_profile
echo "file sourced!"

#source /etc/profile

#Step5) Check the Maven version
echo "Checking maven installation status and version"
echo "This is maven version installed :"
mvn -version

echo "END OF INSTALLATION"

#cd in to home directory"
cd ~

#make a directory
echo "Please enter your file or directory name, for file remember to include the file extension:"
read filename/directory
echo "Do you want to create a file or a directory?"
read answer

if [ $answer == file ]
then 
touch $filename
echo "You have created a file named $filename"

else
mkdir $filename
echo "You have created a directory named $filename"
echo "Setting up project directory fintech"
cd $filename

#Initialze git in your project directory
echo "Intializing git"
git init
echo "contents of $filename directory are :"
ll -la

#configure git username
echo "enter your prefered username"
read answer
$username=answer
git config --global user.name "$username"

git config user.name $username

#configure git useremail
echo "enter your prefered email"
read answer
$useremail=answer
git config --global user.email "$useremail"


git config user.email $useremail

echo "enter project URL to clone project to local repo"
read URL

projecturl=anwer
git clone $projecturl


ls $filename





