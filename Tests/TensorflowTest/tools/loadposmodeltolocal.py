import os
import requests
from urllib.request import urlretrieve
import time
import socket
import sys
import json

pathlist=["https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/manifest.json","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_0_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_0_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_10_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_10_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_10_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_10_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_11_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_11_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_11_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_11_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_12_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_12_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_12_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_12_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_13_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_13_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_13_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_13_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_1_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_1_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_1_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_1_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_2_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_2_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_2_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_2_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_3_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_3_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_3_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_3_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_4_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_4_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_4_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_4_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_5_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_5_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_5_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_5_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_6_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_6_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_6_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_6_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_7_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_7_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_7_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_7_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_8_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_8_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_8_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_8_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_9_depthwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_9_depthwise_depthwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_9_pointwise_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_Conv2d_9_pointwise_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_bwd_1_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_bwd_1_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_bwd_2_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_bwd_2_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_fwd_1_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_fwd_1_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_fwd_2_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_displacement_fwd_2_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_heatmap_1_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_heatmap_1_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_heatmap_2_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_heatmap_2_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_offset_1_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_offset_1_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_offset_2_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_offset_2_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partheat_1_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partheat_1_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partheat_2_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partheat_2_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partoff_1_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partoff_1_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partoff_2_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_partoff_2_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_segment_1_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_segment_1_weights","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_segment_2_biases","https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/MobilenetV1_segment_2_weights"]
socket.setdefaulttimeout(30)
myPath=os.getcwd().replace("\\","/")
print(myPath)

localfolder="posenet/"
def download2(url,file_name):
    # 使用流下载大型文件
    r = requests.get(url, stream=True)
    with open(file_name, mode='wb+') as f:
        for chunk in r.iter_content(chunk_size=32):
            f.write(chunk)
        f.close()
            
def loadOne(remotePath):
    localPath=remotePath.replace("https://storage.googleapis.com/tfjs-models/weights/posenet/mobilenet_v1_101/",localfolder)
    fname=os.path.basename(os.path.realpath(remotePath))
    print("name:",fname)
    localPath=localfolder+fname;
    #urlretrieve(remotePath,myPath+"/"+localPath)
    print("load:",remotePath);
    if os.path.exists(localPath):
        print("file exists")
        return None;
    try:
        #download2(remotePath,myPath+"/"+localPath)
        urlretrieve(remotePath,myPath+"/"+localPath)
        return None
    except Exception as e:
        print("fail to load:",remotePath,e);
        if os.path.exists(localPath):
            os.remove(localPath)
        time.sleep(2);
        return remotePath
    

def loadList(pathlist):
    
    failList=[]
    for filepath in pathlist:
        
        rst=loadOne(filepath)
        if rst!=None:
            failList.append(rst)
    if len(failList)>0:
        print("try load fail files",len(failList))
        time.sleep(2);
        loadList(failList)

def readJsonFile(file):
    f=open(file,"r")
    jsonStr=f.read()
    f.close()
    param=json.loads(jsonStr)
    return param

def initParamFromConfig(configPath):
    global localfolder
    paramO=readJsonFile(configPath)
    print(paramO)
    localfolder=paramO["out"]+"/"
    if not os.path.exists(localfolder):
        os.makedirs(localfolder)
    loadList(paramO["files"]);
    

#loadOne(pathlist[0])
#loadList(pathlist);

if __name__ == "__main__":
   params=sys.argv
   print(len(params),params)
   if len(params)==2:
       initParamFromConfig(params[1])
   else:
       loadList(pathlist);
