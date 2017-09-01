Install and Run Spark using Docker
==================================

We want to easily run spark locally. No matter which OS (Mac, Windows, Linux, BSD) you are using, running spark on a docker is a reliable way. Below are the steps.

1. Install docker platform in your OS. Visit [this page](https://docs.docker.com/engine/installation/) for detailed installation instructions for your OS. Enterprise Edition is not required.

2. Setup docker.

    Enter your command line, make the directory of this repo as your working directory. Then
    
    ```docker build -t learnspark .```

    It will build the docker image. After the build is done, do

    ```docker run --name learnspark --entrypoint /usr/bin/fish -ti learnspark```

    Now you will enter the command line (fish shell) of the docker image.

3. Download Pre-built spark.
    
    ```wget https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz```

    If the above link is deprecated, you can always go to [this page](http://spark.apache.org/downloads.html) to find the latest build of Spark.

4. Try if your installation is successful.

    First, make the spark directory as your working dir. 

    ```cd /spark-2.2.0-bin-hadoop2.7```

    Enter spark scala shell.

    ```./bin/spark-shell```

    Try a simple spark program.

    ```sc.parallelize(1 to 1000).count()```

    Expect the shell returning something like below:

    ``` res0: Long = 1000 ```

