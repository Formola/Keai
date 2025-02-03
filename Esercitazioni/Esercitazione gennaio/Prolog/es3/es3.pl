build_functor(0,Leaf,Leaf).

build_functor(Depth,Value,Tree) :- 
	Depth>0,
	LeftDepth is Depth-1,
	RightDepth is Depth-1,
	build_functor(LeftDepth,Value,LeftSubtree),
	build_functor(RightDepth,Value,RightSubtree),
	Tree = ..(node,LeftSubtree,RightSubtree).
