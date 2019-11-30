-- hint: shuffle

create table dist(NodeA integer, NodeB integer, Dist integer);
WITH recursive allpaths(Sp , Ep , min() as ShortestDist) as 
    (SELECT NodeA , NodeB , Dist FROM dist)
    UNION
    (SELECT 
    allpaths.Sp , dist.NodeB ,  allpaths.ShortestDist+dist.Dist
    FROM allpaths , dist
    WHERE allpaths.Ep=dist.NodeA)

SELECT * FROM allpaths