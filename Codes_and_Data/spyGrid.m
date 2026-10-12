 function spyGrid(A, ptr)
 %%   function spyGrid(A, ptr)
 spy(A);
 hold on;
 n = size(A,1);
 for blk=2:length(ptr)-1                       
   plot([ptr(blk), ptr(blk)],[1 n],'r');
   plot([1 n], [ptr(blk), ptr(blk)],'r');
 end
 hold off





