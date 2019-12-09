from pyo import *
import os

s = Server(audio='jack').boot()

# Path of the recorded sound file.
path = os.path.join(os.path.expanduser("~"),"synth.wav")

# Record for 10 seconds a 24-bit wav file.
s.recordOptions(dur=10, filename=path, fileformat=0, sampletype=1)

# Creates an amplitude envelope
amp = Fader(fadein=1, fadeout=1, dur=10, mul=0.3).play()

# A Simple synth
lfo = Sine(freq=[0.15, 0.16]).range(1.25, 1.5)
fm2 = CrossFM(carrier=200, ratio=lfo, ind1=10, ind2=2, mul=amp).out()

# Starts the recording for 10 seconds...
s.recstart()

s.gui(locals())