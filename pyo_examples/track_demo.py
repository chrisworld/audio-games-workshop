from pyo import *

s = Server(audio="jack").boot().start()

wav = SquareTable()

beat = Metro(time=0.2, poly=1).play()

env = CosTable([(0, 0), (100, 1), (500, 0.3), (8191, 0)])

amp = TrigEnv(beat, table=env, dur=0.25, mul=0.7)

pitch = TrigXnoiseMidi(beat, dist=3, scale=3, mrange=(30, 30))

osc = Osc(table=wav, freq=pitch, mul=amp).mix(2).out()


sig = SawTable(order=12).normalize()

m_synth = Metro(time=0.2, poly=1).play()

lfo = LFO(freq=2.2, sharp=0.2, type=4, mul=110, add=220)

env_synth = TrigEnv(m_synth, table=sig, dur=0.5)

synth = FM(carrier=[200, 201], ratio=[0.2, 0.2], index=env_synth, mul=0.2).out()
synth = FM(carrier=lfo, ratio=[0.2, 0.2], index=env_synth, mul=0.2).out()

lfd = Sine([.4, .2], mul=.2, add=.5)
saw = SuperSaw(freq=300, detune=lfd, bal=0.5, mul=0.2).out()