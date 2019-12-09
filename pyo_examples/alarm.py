from pyo import *

s = Server(audio='jack').boot().start()

freq_mod = RCOsc(freq=[.48,.5], sharp=.2, mul=300, add=600)

a = RCOsc(freq=freq_mod, sharp=.1, mul=.2).out()

s.gui(locals())
