% Facts about size
is_bigger(elephant, dog).
is_bigger(dog, cat).
is_bigger(cat, mouse).

% Rule to infer transitive relationship
% is_bigger(A, C) :-
% 	is_bigger(A, B),
% 	is_bigger(B, C).
