# The basic group of the tetra, including rotating the whole object
tetra:=Group(
# the top rotation
(1,19,10),
# the middle rotation
(2,20,11)(3,21,12)(4,22,13),
# the bottom rotation
(5,23,14)(6,24,15)(7,25,16)(8,26,17)(9,27,18)(28,32,36)(29,31,34)
(30,35,33),
# flipping the tetra, together with the previous 
# rotations this give every flip of the tetra
(1,36)(2,35)(3,34)(4,33)(5,32)(6,31)(7,30)(8,29)(9,28)(10,27)(11,25)
(12,26)(13,22)(14,23)(15,24)(16,20)(17,21)(18,19));

# The basic group of the tetra, assuming you fix one core element, 
# which means there is only one solved state.
tetraReduced:=Group(
# the top rotation for two different corners
(1,19,10),(9,32,23),
# the bottom rotation
(5,23,14)(6,24,15)(7,25,16)(8,26,17)(9,27,18)(28,32,36)(29,31,34)
(30,35,33),
# a side rotation, needed because this object is assumed fixed in 
# one point
(4,25,30)(8,24,31)(7,20,35));

# The group of the tetra assuming we are allowed to swap stickers in 
# such a way, that the object is allways solved
tetraSolvedStickers:=Group(
# rotating the entire tetra
(1,19,10)(2,20,11)(3,21,12)(4,22,13)(5,23,14)(6,24,15)(7,25,16)
(8,26,17)(9,27,18)(28,32,36)(29,31,34)(30,35,33),
# flipping the tetra, together with the previous
# rotations this give every flip of the tetra
(1,36)(2,35)(3,34)(4,33)(5,32)(6,31)(7,30)(8,29)(9,28)(10,27)(11,25)
(12,26)(13,22)(14,23)(15,24)(16,20)(17,21)(18,19),
# swapping stickers on the same face
(1,3),(1,4),(1,9),
# swapping two entire faces stickers
(1,19)(2,20)(3,21)(4,22)(5,23)(6,24)(7,25)(8,26)(9,27));

# The group of the tetra assuming we can swap parts of the object
tetraCorners:=Group(
# the top rotation
(1,19,10),
# the middle rotation
(2,20,11)(3,21,12)(4,22,13),
# the bottom rotation
(5,23,14)(6,24,15)(7,25,16)(8,26,17)(9,27,18)(28,32,36)(29,31,34)
(30,35,33),
# flipping the tetra, together with the previous
# rotations this give every flip of the tetra
(1,36)(2,35)(3,34)(4,33)(5,32)(6,31)(7,30)(8,29)(9,28)(10,27)(11,25)
(12,26)(13,22)(14,23)(15,24)(16,20)(17,21)(18,19),
# swapping two corner pieces
(1,9)(19,32)(10,23),
# swapping to edge pieces
(4,7)(20,30),
# swapping two body pieces
(3,8)(21,31)(12,24),
# rotating a body piece
(3,21,12),
# rotating an edge piece, we do not need to rotate a corner piece, 
# because we already have that rotation
(4,20));

# The group of the tetra assuming we can swap stickers arbitrarily
tetraStickers:=Group(
# the top rotation
(1,19,10),
# the middle rotation
(2,20,11)(3,21,12)(4,22,13),
# the bottom rotation
(5,23,14)(6,24,15)(7,25,16)(8,26,17)(9,27,18)(28,32,36)(29,31,34)
(30,35,33),
# flipping the tetra, together with the previous
# rotations this give every flip of the tetra
(1,36)(2,35)(3,34)(4,33)(5,32)(6,31)(7,30)(8,29)(9,28)(10,27)(11,25)
(12,26)(13,22)(14,23)(15,24)(16,20)(17,21)(18,19),
# swapping stickers on the same face
(1,3),(1,4),(1,9));

# 4a) The probability that a part swapped tetra is solvable
Print(Size(tetra)/Size(tetraCorners),"\n");

# 4b) The probability that a sticker swapped tetra is solvable, here 
# we make the "assumtpion", that tetraReduced and tetraSolvedStickers 
# are disjoint except for the identity, which gives us a new object that 
# describes alle solvable states within sticker swapping, this object 
# however is not a group, which is why we have to describe it this way.
Print((Size(tetraReduced)*Size(tetraSolvedStickers))/Size(tetraStickers),"\n");