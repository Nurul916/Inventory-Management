bi=zeros(5);
dmn=zeros(5);
ei=zeros(5);
shrt=0;
oq=8;
bi(1,1)=3;
do=2;
sc=0;
r1=0;
flag=1;

for i=1:5
for j=1:5
   r=randi([1 100])
   if r>=0 && r<=10
       dmn(i,j)=0

   elseif r>=11 && r<=35
       dmn(i,j)=1
   
   elseif r>=36 && r<=70
       dmn(i,j)=2
       
   elseif r>=71 && r<=91
       dmn(i,j)=3
       
   elseif r>=92 && r<=100
       dmn(i,j)=4
   end
   if flag==0   
      c=bi(i,j)-dmn(i,j)-shrt
      shrt=0
      flag=1
   else
       c=bi(i,j)-dmn(i,j)
   end
   
   if c<0
       shrt=shrt+abs(c)
       sc=sc+1
       ei(i,j)=0
   else
       ei(i,j)=c
   end
   
   
   if j==5
       oq=11-ei(i,j)
       r1=randi([0 9])
       
       if r1>=1 && r1<=6
       do=1
       
       elseif r1>=7 && r1<=9
       do=2
       
       elseif r1==0
       do=3
       end
   end
   
   if j~=5 && do>0
       do=do-1
   end
   
fprintf('cycle : %d\n',i)
fprintf('day : %d\n',j)
fprintf('Begining Inventory  : %d\n',bi(i,j))
fprintf('random digit for demand : %d\n',r)
fprintf('demand : %d\n',dmn(i,j))
fprintf('Ending Inventory : %d\n',ei(i,j))
fprintf('shortage : %d\n',shrt)
if j==5
    fprintf('Order of quantity : %d\n',oq)
    fprintf('Random digit for lead time : %d\n',r1)
else
    fprintf('Order of quantity : 0\n')
    fprintf('Random digit for lead time : Nothing\n')
end   

if do<0
    fprintf('Days until order arrive : nothing\n')
else
    fprintf('Days until order arrive : %d\n',do)
end

   if do==0
      bi(i,j+1)=oq+ei(i,j)
      do=do-1
      flag=0
   elseif j==5 && do~=0
       bi(i+1,1)=ei(i,j)
   else
       bi(i,j+1)=ei(i,j)
       
   end
   
end
end

s=sum(ei(:))
s=s/25
fprintf('Average ending units in inventory : %.4f\n',s)
sc=sc/25
fprintf('Average number of days when a shortage condition occurs : %.4f\n',sc)
