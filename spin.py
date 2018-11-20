f = open('spin.log', 'r')

lines = f.readlines()

n = len(lines) // 5

results = [ lines[i * 5 + 2] for i in range(n) ]
results = [ l.split()[1] for l in results ]
results = [ l.split('m')[1] for l in results ]
results = [ float(l[:-1]) for l in results ]

m = len(results) // 10
means = [ sum(results[(i * 10) : ((i + 1) * 10)]) / 10 for i in range(m) ]

for x in means: print(x)
