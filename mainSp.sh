taskNumber=$1
SERVER_USER="d.semenov4"  # "daniil"
SERVER_IP="84.237.51.129"  # "192.168.1.49"
SERVER_FILE_PATH="~/home/task$taskNumber/task$taskNumber.txt"
LOCAL_DESTINATION="receive_tasks"
portNumber=10023 #2222
serverPath="~/home/task$taskNumber"

# send task folder filess to server
scp -P $portNumber tasks/task$taskNumber/Makefile $SERVER_USER@$SERVER_IP:~/home/task$taskNumber
scp -P $portNumber tasks/task$taskNumber/task$taskNumber.cpp $SERVER_USER@$SERVER_IP:~/home/task$taskNumber
scp -P $portNumber tasks/task$taskNumber/task$taskNumber.sh $SERVER_USER@$SERVER_IP:~/home/task$taskNumber

# launch script
ssh -p $portNumber $SERVER_USER@$SERVER_IP "cd $serverPath; chmod +x task$taskNumber.sh; ./task$taskNumber.sh"

# sleep 3
# copy responce
scp -P $portNumber $SERVER_USER@$SERVER_IP:$SERVER_FILE_PATH $LOCAL_DESTINATION

