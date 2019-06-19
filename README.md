Make sure you have a docker environment
in the (/tmp/Imagenet/), It contains the underlying information
1. ILSVRC2012_img_val.tar
    The dataset is from image.net 
2. mkdir_imagenet_2012_validation.sh
    wget https://raw.githubusercontent.com/isaacyaf/imagenet2012_ValData_for_mxnet-im2rec/master/mkdir_imagenet_2012_validation.sh
3. mv_imagenet_2012_validation.sh
    wget https://raw.githubusercontent.com/isaacyaf/imagenet2012_ValData_for_mxnet-im2rec/master/mv_imagenet_2012_validation.sh

* Thet label of val are from
https://raw.githubusercontent.com/tensorflow/models/master/research/inception/inception/data/imagenet_2012_validation_synset_labels.txt

***

    mkdir val
    mv mkdir_imagenet_2012_validation.sh ./val
    mv mv_imagenet_2012_validation.sh ./val
    cd val
    tar -xvf ../ILSVRC2012_img_val.tar
    #mkdir_imagenet_2012_validation.sh,  mv_imagenet_2012_validation.sh 
    ./mkdir_imagenet_2012_validation.sh
    ./mv_imagenet_2012_validation.sh
    #Move out mkdir_imagenet_2012_validation.sh and mv_imagenet_2012_validation.sh
    mv mkdir_imagenet_2012_validation.sh ../
    mv mv_imagenet_2012_validation.sh ../
    
    #=========
    docker pull mxnet/python
    mkdir /tmp/mxnet
    cd /tmp/mxnet
    git clone https://github.com/apache/incubator-mxnet.git
    #Mount imagenet dataset and mxnet
    docker run --rm -v /tmp/mxnet/incubator-mxnet/:/mxnet -v /tmp/Imagenet/:/mnt -it mxnet/python bash
    #Need a specific version of cv to support python2.7
    pip install opencv-python==3.2.0.8

    cd /mnt
    python /mxnet/tools/im2rec.py --list  --recursive  val /mnt/val
    python /mxnet/tools/im2rec.py --num-thread=8 val.lst /mnt/val
