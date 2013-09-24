function randomwaypoint(NumNodes,range,waypoints,vrange,time)
%nodes are the coordiante values of the nodes.

nodes = range(1)  + rand(1,NumNodes)*( range(2) - range(1) );
%transition matrix as input.
transMAT = [0.3 0.3 0.4; 0.2 0.4 0.4;0.5 0.3 0.2];
cumtransMAT=zeros(3);
%Creating the cumulative transition matrix
    for i =  1:unique(length(transMAT))
        for j = 1:unique(length(transMAT))
            cumtransMAT(i,j) = sum(transMAT(i,1:j));
        end
    end
%assigning the waypoints for each nodes by using a function
source = neighbourwaypoint(waypoints,nodes);
%find destination according to the transition matrix.
    for i= 1 : length(nodes)
        randomVal = rand();
        for j =length(transMAT):-1:1
            if (randomVal  > cumtransMAT(source(i) ,j))
                destination(i) = j;
            end
        end
    end
%assign speed of each node in vrange.
speed = sign(waypoints(destination)-waypoints(source))*(vrange(1)  + rand(NumNodes)*( vrange(2) - vrange(1) ));

%Simulating movement
    for t = 1:time
        for i = 1 : NumNodes
            if ( position(t-1,i) < sign(waypoints(destination)-waypoints(source))*waypoints(destination(i)))
            move(t,:)=speed(i)*t +  waypoints(source(i));
            position(t,:) = nodes(i) + move(t,:);
            end
        end
    end
end

%calulate distance between node i and j.
function dis=distance(nodes,i,j)
dis=nodes(i)-node(j);
end

%calulate distance from the waypoint and assign the waypoint at that
%instance
function node_Way=neighbourwaypoint(waypoints,nodes)
    for i = 1 : length(nodes)
        temp = inf;
        for j = 1 : length(waypoints)
            if(temp > abs(waypoints(j)-nodes(i)))
                pos=j;
                temp = abs(waypoints(j)-nodes(i));
            end
        end
        node_Way(i) = pos; 
    end
end
%find all neighbours of node i with radius rad.
function neigh = neighbour(nodes,i,rad)
    for j = 1:length(nodes)
        if (distance(nodes,i,j)  < rad &&  i ~= j)
            neigh(j)=1;
        end
    end
end
