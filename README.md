# Exctract-DataAPi-Bash
The purpose of this project exam is to extarct sales of graphics cards from an API in the first thime. In the second time extract data from json files using JQ.
## 1- Extract sales of graphics cards
Connect to your machine and run the following command to retrieve the API:
wget --no-cache https://dst-de.s3.eu-west-3.amazonaws.com/bash_fr/api.tar

Unzip the archive using the following command:
```bash
tar -xvf api.tar

The extracted archive reveals the api script.
Run the api script after giving it execution permissions:
```bash
chmod +x api  
./api &

Create a directory
```bash
mkdir exam_bash

Create a file in the directory:
```bash
cd exam_bash  
nano exam.sh

Give the permissions -rwx---r-x:
```bash
chmod 705 exam.sh

Create a cron.text file
```bash
cd exam_bash  
nano cron.text

Create a job using the command crontab
*/1 * * * * [ "$(date +\%m)" -ge 10 -o "$(date +\%m)" -le 6 ] && /bin/bash ~/exam_CHAHET/exam_bash/exam.sh

Launch the job
```bash
crontab cron.txt
crontab ~/exam_CHAHET/exam_bash/cron.txt

## 2- Extract data from people.json file using JQ
Extract people information from people.json file.

