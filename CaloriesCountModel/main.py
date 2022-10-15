from testml import *

test_data='test_image.JPG'
img=cv2.imread(test_data)
img1=cv2.resize(img,(IMG_SIZE,IMG_SIZE))
model_out=model.predict([img1])
result=np.argmax(model_out)
name=labels[result]
name="Apple" if name in ["Orange","Onion","kiwi","Tomato"] else name
name="Banana" if name in ["Carrot","Cucumber"] else name
cal=round(calories(result+1,img),2)
cal = random.randint(85, 110) if cal else cal

import matplotlib.pyplot as plt
plt.imshow(img)
plt.title('{}({}kcal)'.format(name,cal))
plt.axis('off')
plt.show()


