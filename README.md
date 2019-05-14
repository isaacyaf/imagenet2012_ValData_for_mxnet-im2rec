請確保擁有docker環境
與 同目錄(/tmp/Imagenet/)下包含的資料
1. ILSVRC2012_img_val.tar
2. mkdir_imagenet_2012_validation.sh
3. mv_imagenet_2012_validation.sh
2與3是由
https://raw.githubusercontent.com/tensorflow/models/master/research/inception/inception/data/imagenet_2012_validation_synset_labels.txt
標籤檔轉換而來

***
mkdir val
mv mkdir_imagenet_2012_validation.sh ./val
mv mv_imagenet_2012_validation.sh ./val
cd val
tar -xvf ../ILSVRC2012_img_val.tar
#mkdir_imagenet_2012_validation.sh,  mv_imagenet_2012_validation.sh 
./mkdir_imagenet_2012_validation.sh
./mv_imagenet_2012_validation.sh
#移出 mkdir_imagenet_2012_validation.sh,  mv_imagenet_2012_validation.sh
    mv mkdir_imagenet_2012_validation.sh ../
    mv mv_imagenet_2012_validation.sh ../
    #=========
    docker pull mxnet/python
    mkdir /tmp/mxnet
    cd /tmp/mxnet
    git clone https://github.com/apache/incubator-mxnet.git
    #同時掛載資料集與git mxnet資料 
    docker run --rm -v /tmp/mxnet/incubator-mxnet/:/mxnet -v /tmp/Imagenet/:/mnt -it mxnet/python bash
    #需要特定版本的cv來支援python2.7
    pip install opencv-python==3.2.0.8

    cd /mnt
    python /mxnet/tools/im2rec.py --list  --recursive  train /mnt/train
    python /mxnet/tools/im2rec.py --num-thread=8 train.lst /mnt/train
    python /mxnet/tools/im2rec.py --list  --recursive  val /mnt/val
    python /mxnet/tools/im2rec.py --num-thread=8 val.lst /mnt/val
