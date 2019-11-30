-- hint: shuffle

create table dist(NodeA integer, NodeB integer);
WITH recursive allpaths(Sp , min() as Ep) as
    (SELECT NodeA , NodeA FROM dist)
    UNION
    (SELECT
    dist.NodeB, allpaths.Ep
    FROM allpaths , dist
    WHERE allpaths.Sp=dist.NodeA and allpaths.Ep!=dist.NodeB)

SELECT * FROM allpaths