outfile=open("progrem.mem","w") #mem file
with open("progrem.asm", "r") as file:# Open the assembly program
    instructions = file.readlines()
opcode = {
    "ADD": "0001",
    "SUB": "0010",
    "AND": "0011",
    "OR": "0100",
    "XOR": "0101",
    "NOT": "0110",
    "LOAD": "0111",
    "HALT": "1111"
}
register={
    "R0":"000",
    "R1":"001",
    "R2":"010",
    "R3":"011",
    "R4":"100",
    "R5":"101",
    "R6":"110",
    "R7":"111"
}
i=1
for line in instructions:
    print("instruction -",i)
    line.strip()
    parts=line.replace(","," ").split()
    op=parts[0]
    
    if op=="LOAD":
        print("Assembly     = ",line)
        print("opcode       = ",opcode[op])
        print("Rd           = ",register[parts[1]])
        print("insert value = ",parts[2])
        value=format(int(parts[2]),"09b")

        binaryinstruction=opcode[op]+register[parts[1]]+value
        print("Machine      = ",binaryinstruction)
        outfile.write(binaryinstruction+"\n")
        
    elif op=="NOT" or op=="OR" or op == "NOR" :
        print("Assembly     =",line)
        print("Rd           =",register[parts[1]])
        print("Rs           =",register[parts[2]])

        binaryinstruction=opcode[op]+register[parts[1]]+register[parts[2]]+"000000"
        print("Machine      =",binaryinstruction)
        outfile.write(binaryinstruction+"\n")
        
    elif op!="HALT":
        print("Assembly     =",line)
        print("Rd           =",register[parts[1]])
        print("Rs1          =",register[parts[2]])
        print("Rs2          =",register[parts[3]])
        
        binaryinstruction=opcode[op]+register[parts[1]]+register[parts[2]]+register[parts[3]]+"000"
        print("Machine      =",binaryinstruction)
        
        outfile.write(binaryinstruction+"\n")
        
    elif op == "HALT":
        print("Assembly     =",line)
        binaryinstruction = opcode[op] + "000000000000"
        print("Machine      =",binaryinstruction)
        outfile.write(binaryinstruction + "\n")
    
    print("-"*35)
    i=i+1
outfile.close()
    