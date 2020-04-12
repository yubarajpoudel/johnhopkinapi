Description
======

This project gives the data in the form of json by converting the csv data provided by (john hopkins)[https://github.com/CSSEGISandData/COVID-19] . The repository is pulled itself everyday 6 oclock at morning. 

Easy Setup
======

Simple way : open the terminal and
==============================
 1. Give execute permission for ``` imagerun.sh ```

    ``` sudo chmod +x ./imagerun.sh ```
 2. Run script file

    ``` ./imagerun.sh ```

Other way (optional) Manually
===============================

 1. install the docker. Please refer to docker site about the installation
 2. create the image ``` docker build -t covidjhuapi:0.0.1 . ```
 3. Run the image ``` docker run -itd -p 8022:8022 covidjhuapi:0.0.1 ```
 4. check if the container is running or not. ``` docker ps ```



If the container is running then go to the browser and type

 ``` http://127.0.0.1:8022/data/?type=global&at=04-09-2020 ```

 > Here the date is in the format of ```MM-DD-YYYY ``` and if date is not given it will give latest data




