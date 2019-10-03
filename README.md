# Image-Steganography-with-improved-undetectability-of-Histogram-Distortion
IMAGE STEAGNOGRAPHY

There are many different uses of steganography, including embedding sensitive information into
file types, one of the most common techniques is to embed a text file into an image file. When this is
done, anyone viewing the image file should not be able to see a difference between the original image
file and the encrypted file; this is accomplished by storing the message with less significant bites in the
data file. This process can be completed manually or with the use of a steganography tool.
The main challenge of high capacity data embedding schemes is to reduce the image distortion as well
as to keep the data secure by making use of alternate mechanisms such as secret keys. In this project, we
propose a novel data hiding scheme. Data security will be ensured by making use of a Hamiltonian path
to generate a secret key for accessing data embedding patterns. Due to the complexity of Hamiltonian
path generation, the embedding patterns become almost impossible to guess, even if the presence of
secret data is observed using steganographic attacks. The strategy that we have implemented improves
histogram distortion.


1. First, we imported the image in which embedding has to be done and then we import the text to
be embedded.
2. Then we converted the text in binary form so that it can be embedded.
3. The image was then divided into 8 bit-planes to analyse the impact of each bit-plane on the
original image.
4. The embedding has been done in the 3 least significant bit-planes of the image. So, we took the
following steps to embed the image: -
  4.1 Message bits were picked up in groups of nine and arranged in 2-D arrays of size 3x3.
  4.2 A histogram of the original image is created. 
  4.3 2 groups of 9 bits each and one group of 7 bits was picked up from the message to
  embed in the image as first 2 bits to be embedded represent the rotation done.
  4.4 For rotation bits, 00 represents no rotation of the 2-D message arrays, 01 represents 90°
  rotation anticlockwise, 10 represents 180° rotation anticlockwise and 11 represents 270°
  rotation anticlockwise.
  4.5 Then these 27 bits were inserted into and array and then the absolute difference of this
  array with the original image’s 3x3x3=27 bits of the 3 bit-planes was taken.
  4.6 The minimum absolute difference out of the 4 calculated was considered for
  embedding.
  4.7 The 3 bit-planes of least significance in the image were then replaced by the above-
  mentioned bits.
  4.8 A histogram of this embedded image is created
  4.9 Now, the 2 histograms were compared for differences.

  0° Rotation 90° Rotation

  180° Rotation 270° Rotation

5. The second greedy algorithm that we implemented utilises queues as a data structure.

10

5.1 A queue of size 256 is initialised with all 0s with each index representing change in
pixel intensity that occurs during the embedding of the secret message.
5.2 For each 3x3 matrix with 9 pixel intensities and 3 planes, 4 arrays are generated for
each of the matrices representing 0°, 90°, 180°, 270° respectively.
5.3 First, we pick up the 0° matrix’s array for first 3x3 block and then the changes that
occur as compared to the original image’s pixel intensities are stored in the queue.
5.4 Now, for the remaining blocks we consider change in queue caused by all the rotated
blocks i.e. 0°, 90°, 180°, 270° and store these changes in separate queues of the same
size.
5.5 For example, for the 2 nd block, the 4 queues are created namely Q0, Q1, Q2, Q3,
initialised as the queue obtained by the first block embedding.
5.6 Now we find out the absolute sum of each of the queues and the minimum of these 4
queues is chosen as the initialising queue for the next block.
5.7 Through this, we choose the best out of the 4 rotations that can be used for embedding
and this process is carried out for all the blocks of the image.
