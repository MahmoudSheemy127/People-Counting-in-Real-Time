FROM python:3.8

#setup the directory
WORKDIR /usr/src/app

#copy all files to the container
COPY . .

#install dependencies
#install cmake first
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get -y install cmake
RUN cmake --version
RUN pip install --no-cache-dir -r requirements.txt

# CMD ["python","./people_counter.py --prototxt detector/MobileNetSSD_deploy.prototxt --model detector/MobileNetSSD_deploy.caffemodel --input utils/data/tests/test_1.mp4"]
CMD python ./people_counter.py --prototxt detector/MobileNetSSD_deploy.prototxt --model detector/MobileNetSSD_deploy.caffemodel --input utils/data/tests/test_1.mp4