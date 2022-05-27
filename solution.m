function [stepcount, sequ] = solution(n)
map = cell(3,n);
for i=1:n
map{1,i} = zeros(1,1);
map{2,i} = zeros(1,5);
map{3,i} = zeros(1,1);
i=i+1;

end
[stepcount, operationtype, previous, map]  = sequence(n, map);
sequ = [];
sequ = operationtype;
while operationtype(1) ~= 99
    sequ = [sequ operationtype];
 [stepcount, operationtype, previous, map] = sequence(previous, map);
end

function [stepcount, operationtype, previous, map] = sequence(n, map)
if n == 1
   stepcount=0;
   operationtype = 99;
   previous=-1;
   return
end
%% 
if map{1,n}(1,1) ~= 0
    stepcount = map{1,n}; operationtype= map{2,n}; previous= map{3,n};
    return
end

[stepcount1st, operationtype1st, previous, map] = sequence(n-1, map);
stepcount1st =stepcount1st+1;
operationtype1st = [operationtype1st, 1];
previous = n-1;
stepcount2nd = [];
 if rem(n, 2) == 0
       [stepcount2nd, operationtype2nd, previous, map] = sequence(n/2, map);
          if stepcount2nd <  stepcount1st
            stepcount = stepcount2nd+1;
            operationtype =[operationtype2nd 2];
            previous = n/2;
          end
else
    operationtype = operationtype1st;
    stepcount = stepcount1st;

 end

 if rem(n, 3) == 0
       [stepcount3rd, operationtype3rd, previous, map] = sequence(n/3, map);
          if stepcount3rd <  stepcount1st
            stepcount = stepcount3rd+1;
            operationtype = [operationtype3rd 3];
            previous = n/3;
        
          end
 else
     if stepcount2nd <  stepcount1st
        else
               operationtype = operationtype1st;
               stepcount = stepcount1st;
     end
 end

map{1,n}= stepcount;
map{2,n}= operationtype;
map{3,n}= previous;

end
end
