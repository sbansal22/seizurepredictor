base = 'Z'

size = 101
filenames = [''] * (size - 1)
for i in range(1,size):
    if len(str(i)) == 1:
        number = "00" + str(i)
    if len(str(i)) == 2:
        number = "0" + str(i)
    if len(str(i)) == 3:
        number = str(i)
    filenames[i-1] = base + number + '.txt'

with open('.\\' + base + '.txt', 'w') as outfile:
    for fname in filenames:
        with open('.\\' + base + '\\' + fname) as infile:
            for line in infile:
                outfile.write(line)
