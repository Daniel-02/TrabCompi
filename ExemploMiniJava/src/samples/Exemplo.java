a = 312;
b = 111;
def mdc(a,b) =
 if mod(a,b)= 0
 then b
 else mdc(b,mod(a,b));
def mod(a,b) =
 if a< b
 then a
 else mod(a-b,b)