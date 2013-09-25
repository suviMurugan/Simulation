function randomwaypoint(NumNodes,range,hotspots,vrange,time)
%transition matrix as input.
transMAT = [0.3 0.3 0.4; 0.2 0.4 0.4;0.5 0.3 0.2];
cumtransMAT=zeros(3);
%Creating the cumulative transition matrix
    for i =  1:unique(length(transMAT))
        for j = 1:unique(length(transMAT))
            cumtransMAT(i,j) = sum(transMAT(i,1:j));
        end
    end
%Distributing the nodes in the corresponding hotspots
source = ceil( rand(1,NumNodes)*(length(hotspots)-1) ) + 1              %Create a random distribution among hotspots
nodes  = hotspots(source);                                    % assign that to the nodes position.
%find destination according to the transition matrix.
    for i= 1 : length(nodes)
        randomVal = rand();
        for j =1:length(transMAT)
            if (randomVal  <= cumtransMAT(source(i) ,j))
                destination(i) = j;
                break
            end
        end
    end
destination
%assign speed of each node in vrange.
speed = sign(hotspots(destination)-hotspots(source)).*(vrange(1)  + rand(1,NumNodes)*( vrange(2) - vrange(1) ))
position(1,:)=nodes;
move(1,:)= zeros(1,length(nodes));
%Simulating movement
    for t = 2:time
        for i = 1 : NumNodes
            if    ((position(t-1,i) < hotspots(destination(i)) )&& (sign(hotspots(destination(i))-hotspots(source(i)))==1 ))
                move(t,i)     = speed(i)*t ;
                position(t,i) = nodes(i) + move(t,i);
            elseif ((position(t-1,i) > hotspots(destination(i)) )&& (sign(hotspots(destination(i))-hotspots(source(i)))== -1 ))
                move(t,i)     = speed(i)*t ;
                position(t,i) = nodes(i) + move(t,i);
            else
                move(t,i)     = move(t-1,i);
                position(t,i) = nodes(i) + move(t,i);
            end
        end
        move(t,:)
    end
    position
end
%calulate distance between node i and j.
function dis=distance(nodes,i,j)
dis=nodes(i)-node(j);
end
%find all neighbours of node i with radius rad.
function neigh = neighbour(nodes,i,rad)
    for j = 1:length(nodes)
        if (distance(nodes,i,j)  < rad &&  i ~= j)
            neigh(j)=1;
        end
    end
end
