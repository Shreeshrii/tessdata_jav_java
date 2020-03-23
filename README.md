# tessdata_jav_java
Tesseract 4.0.0 training data for Javanese Script (Aksara Jawa)

Built in response to [this issue](https://github.com/tesseract-ocr/langdata/issues/126)

## Traineddata files

* [jav1.traineddata](https://github.com/Shreeshrii/tessdata_jav_java/blob/master/tessdata_best/jav1.traineddata)
* [jav2.traineddata](https://github.com/Shreeshrii/tessdata_jav_java/blob/master/tessdata_best/jav2.traineddata)

## To run training for Javanese script

* Clone this repo
* To further continue training with existing data, run `./plustrain.sh`
* To customize for your own training, update training text in langdata and fonts lists in `makedata.sh`
* Training text needs to be in utf-8 encoding.
* Unicode fonts supporting the Javanese code-range need to be used.
* Source code changes will be needed in tesseract, additions will be similar to Khmer/Mynamar or Thai.

## Custom bash scripts - run in following order

./makeeval.sh

./makedata.sh

./mergedata.sh

./plustrain.sh
