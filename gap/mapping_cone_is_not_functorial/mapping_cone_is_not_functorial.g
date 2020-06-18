LoadPackage( "DerivedCategories" );
ENABLE_COLORS := true;;
SizeScreen([1000, 1000]);;

k := HomalgFieldOfRationals( );

vertices := [ "A", "B", "C", "D" ];

arrows := [ "r", "s", "f_0", "f_1", "g_0", "g_1", "u", "v" ];
sources := [ 1, 2, 1, 3, 1, 3, 3, 3 ];;
targets  := [ 3, 4, 2, 4, 2, 4, 2, 2 ];;

Q := RightQuiver( "quiver", vertices, arrows, sources, targets );;
ViewObj( Q );

kQ := PathAlgebra( k, Q );;
ViewObj( kQ );

I := [
      kQ.r * kQ.f_1 - kQ.f_0 * kQ.s,
      kQ.r * kQ.g_1 - kQ.g_0 * kQ.s,
      kQ.f_1 - kQ.g_1- kQ.v * kQ.s,
      kQ.f_0 - kQ.g_0 - kQ.r * kQ.u
    ];

kQ_mod_I := kQ / I;;
SetName( kQ_mod_I, "kQ/I" );
ViewObj( kQ_mod_I );

Dimension( kQ_mod_I );

KnownAttributesOfObject( kQ_mod_I );

oid := Algebroid( kQ_mod_I );

objs := SetOfObjects( oid );;
Size( objs );

objs[ 1 ];

ViewObj( objs[ 1 ] );

objs[ 1 ] = oid.( "A" );

mors := SetOfGeneratingMorphisms( oid );;
Size( mors );

mors[ 1 ];

ViewObj( mors[ 1 ] );

mors[ 1 ] = oid.( "r" );

r_f1 := PreCompose( oid.( "r" ), oid.( "f_1" ) );

ViewObj( r_f1 );

PreCompose( oid.( "r" ), oid.( "f_1" ) ) = PreCompose( oid.( "f_0" ), oid.( "s" ) );

oplus := AdditiveClosure( oid );

Co := CochainComplexCategory( oplus );

Ho := HomotopyCategory( oplus, true );

A := oid.( "A" ) / oplus / Co / Ho;

Display( A );

B := oid.( "B" ) / oplus / Co / Ho;;
C := oid.( "C" ) / oplus / Co / Ho;;
D := oid.( "D" ) / oplus / Co / Ho;;

r := oid.( "r" ) / oplus / Co / Ho;

Display( r );

s := oid.( "s" ) / oplus / Co / Ho;;
u := oid.( "u" ) / oplus / Co / Ho;;
v := oid.( "v" ) / oplus / Co / Ho;;
f_0 := oid.( "f_0" ) / oplus / Co / Ho;;
f_1 := oid.( "f_1" ) / oplus / Co / Ho;;
g_0 := oid.( "g_0" ) / oplus / Co / Ho;;
g_1 := oid.( "g_1" ) / oplus / Co / Ho;;

IsTriangulatedCategory( Ho );

st_r := StandardExactTriangle( r );
st_s := StandardExactTriangle( s );

Display( st_r );

m_b_st_cones := MorphismBetweenStandardConeObjects( r, f_0, f_1, s );

Display( m_b_st_cones );

f := MorphismOfExactTriangles( st_r, f_0, f_1, st_s );

Display( f );

g01 := HomotopyCategoryMorphism( 
            st_r[ 2 ],
            st_s[ 2 ],
            [ oid.( "g_0" ) / oplus, oid.( "g_1" ) / oplus ],
            -1
        );

IsWellDefined( g01 );

g := MorphismOfExactTriangles(
            st_r,
            f[ 0 ],
            f[ 1 ],
            g01,
            st_s
        );

IsWellDefined( g );
