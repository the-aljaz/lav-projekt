sez = []
c = 1
file = open("nc.ps1", "w")
note=""
string = open("load.txt", "r").read()

dict = {"A4": 440, "B4": 494, "C4": 262, "D4": 294, "E4": 330, "F4": 349, "G4": 392, "CS4": 277, 
        "FS4": 370, "A5": 880, "B5": 988, "C5": 523, "D5": 587, "E5": 659, "F5": 698, "G5": 784, 
        "CS5": 554, "FS5": 740, "GS5": 831, "DS5": 622, "GS4": 415, "REST": "REST" }

duration_factor = 2  # Adjust this value to increase or decrease the duration

for i in string:
    print(i)


    if i == "-":
        if note == "REST":
            duration = str(int((1000/16)*(16/int(string[c])*1.5*duration_factor))/1000)
            sez.append("Start-Sleep -s " + duration)
        elif note in dict:
            duration = str(dict[note])+","+str(int((1000/16)*(16/int(string[c])*1.5*duration_factor)))
            sez.append("[console]::beep(" + duration + ")")
        note = ""

    elif i.isdigit() == True and string[c].isdigit()==True and string[c] != "6" or string[c]=="-":
        note += i

    elif i.isdigit() == True and string[c].isdigit()==True and string[c] == "6":
        if note in dict and note != "REST":
            sez.append("[console]::beep(" + str(dict[note])+","+str(int(1000/16*duration_factor))+")")
        note = ""

    elif i.isdigit() == True and string[c].isdigit()!=True and string[c] != "-" and note != "":    
        if note in dict and note != "REST":
            sez.append("[console]::beep(" + str(dict[note])+","+str(int((1000/16)*(16/int(i))*duration_factor))+")")
        note = ""

    elif i.isdigit() != True:
        note += i
    
    c += 1
    if c == len(string):
        c = 0

file.write('\n'.join(sez))