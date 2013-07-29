function Graph=GenerateRandGraph(size,probOfOccur) 
   Graph = zeros(size);
   for i=1:size
       for j=1:size
           if(rand() < probOfOccur)
               Graph(i,j)=1;
               Graph(j,i)=1;
           end
       end
   end
end
