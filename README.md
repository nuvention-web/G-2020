# G-2020

# Contact:
Irinel Bandas
irinelbandas2020@u.northwestern.edu

NOTE: READ THIS!
For our current code of the demo for the pitch that we are submitting on March 16th, 2020, it is on the branch "pitch". There is currently two xcode projects up, the old one (WeFit) and the new one (twotableviews-master). This is due to many issues we had from using git, git histories, and xcode from the beginning. We are hoping we can potentially create a new repo to solve the whole issue of "conflicting histories". But, I repeat, to grade us on code, it is on the branch "pitch"! I will detail instructions below.

# Prerequisites
1. Xcode (11.3.1)
2. Cocoapods (a dependency package maanager similar to pip, we used this for firebase SDK)
3. Firebase SDK
4. Mac laptop is needed to run this code! (Or potentially a VirtualMachine (VM))

# Instructions
1. Git Checkout the "pitch" branch
2. Make sure you have cocoapods installed (follow this instruction on their webpage: https://cocoapods.org/)
3. Open up the directory of "twotableviews-master"
3. In the root of the directory that contains "Podfile", make sure to do a pod install. This will install all the dependencies/pods (firebase SDK).
4. Open up the "twotableviews-master.xcWORKSPACE". This is very important in order to have the environment properly set with firebase. If you use xcodeproject, it will not work with firebase.
5. From there, you can press the play button at the top left to run the program. Make sure it's on the iPhone 11 Pro Max for the simulator. You can run on other phones but we primarily optimized it for that phone.

Pitch branch consists of Slice 1 where it is a status feed of those who accomplished challenges. Slice2-New branch consists the Slice 2 where it shows a leaderboard for a specific challenge.

Architecture is in the Wiki. 

