# Pompi | Pompy


## 💡 Inspiration💡

Our team is saddened by the fact that so many people think that COVID-19 is obsolete when the virus is still very much relevant and impactful to us. We recognize that there are still a lot of people around the world that are quarantining—which can be a very depressing situation to be in. We wanted to create some way for people in quarantine, now or in the future, to help them stay healthy both physically and mentally; and to do so in a fun way!

## ⚙️ What it does ⚙️

We have a full-range of features. Users are welcomed by our virtual avatar, Pompy! Pompy is meant to be a virtual friend for users during quarantine. Users can view Pompy in 3D to see it with them in real-time and interact with Pompy. Users can also view a live recent data map that shows the relevance of COVID-19 even at this time. Users can also take a photo of their food to see the number of calories they eat to stay healthy during quarantine. Users can also escape their reality by entering a different landscape in 3D. Lastly, users can view a roadmap of next steps in their journey to get through their quarantine, and to speak to Pompy. 

## 🏗️ How we built it 🏗️

### 🟣 Echo3D 🟣
We used Echo3D to store the 3D models we render. Each rendering of Pompy in 3D and each landscape is a different animation that our team created in a 3D rendering software, Cinema 4D. We realized that, as the app progresses, we can find difficulty in storing all the 3D models locally. By using Echo3D, we download only the 3D models that we need, thus optimizing memory and smooth runtime. We can see Echo3D being much more useful as the animations that we create increase. 

### 🔴 An Augmented Metaverse in Swift 🔴
We used Swift as the main component of our app, and used it to power our Augmented Reality views (ARViewControllers), our photo views (UIPickerControllers), and our speech recognition models (AVFoundation). To bring our 3D models to Augmented Reality, we used ARKit and RealityKit in code to create entities in the 3D space, as well as listeners that allow us to interact with 3D models, like with Pompy. 

### ⚫ Data, ML, and Visualizations ⚫
There are two main components of our app that use data in a meaningful way. The first and most important is using data to train ML algorithms that are able to identify a type of food from an image and to predict the number of calories of that food. We used OpenCV and TensorFlow to create the algorithms, which are called in a Python Flask server. We also used data to show a choropleth map that shows the active COVID-19 cases by region, which helps people in quarantine to see how relevant COVID-19 still is (which it is still very much so)!

## 🚩 Challenges we ran into
We wanted a way for users to communicate with Pompy through words and not just tap gestures. We planned to use voice recognition in AssemblyAI to receive the main point of the user and create a response to the user, but found a challenge when dabbling in audio files with the AssemblyAI API in Swift. Instead, we overcame this challenge by using a Swift-native Speech library, namely AVFoundation and AVAudioPlayer, to get responses to the user!


## 🥇 Accomplishments that we're proud of
We have a functioning app of an AR buddy that we have grown heavily attached to. We feel that we have created a virtual avatar that many people really can fall for while interacting with it, virtually traveling places, talking with it, and getting through quarantine happily and healthily. 

## 📚 What we learned
For the last 36 hours, we not only learned new things 

## ⏳ What's next for ?
We can use Pompy to help diagnose the user’s conditions in the future; asking users questions about their symptoms and their inner thoughts which they would otherwise be uncomfortable sharing can be more easily shared with a character like Pompy. While our team has set out for Pompy to be used in a Quarantine situation, we envision many other relevant use cases where Pompy will be able to better support one's companionship in hard times for factors such as anxiety and loneliness. Furthermore, we envisage the Pompy application being a resource hub for users to improve their overall wellness. Through providing valuable sleep hygiene, exercise tips and even lifestyle advice, Pompy will be the one-stop, holistic companion for users experiencing mental health difficulties to turn to as they take their steps towards recovery. 

