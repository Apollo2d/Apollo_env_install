Apollo_run(){
    run(){
        local RESULT=`pwd`/result.log
        local OUTPUT_1=`pwd`/1.log
        local OUTPUT_2=`pwd`/2.log
        
        rcssserver > $RESULT 2>&1 &
        local SERVER=$!
        sleep 1

        {
            cd $(dirname $(readlink -f "$1"))
            ./start.sh > $OUTPUT_1 2>&1 &
        }&

        {
            cd $(dirname $(readlink -f "$2"))
            ./start.sh > $OUTPUT_2 2>&1 &
        }&

        trap "kill $SERVER" INT

        echo -e "rcssserver is running in background with PID:$SERVER"
        echo -e "click [ctrl]+c to stop at any time."
        sleep infinity

    }
    if [ $# -ne 2 ]
	then
	    echo -e "\033[31m Need at least 2 arguments!\033[0m "
	    echo -e "Usage:\033[37m Apollo_run /path/to/Team1/start.sh /path/to/Team2/s \033[0m"
        return 1
    fi
    run $1 $2
}