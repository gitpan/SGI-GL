#!/usr/local/bin/perl

# This is a Perl 5 version of the 'zdraw' program from the Graphics Library
# Programming Guide, chapter 8

use SGI::GL @SGI::GL::EXPORT_OK;

$RGB_BLACK = 0x000000;
$RGB_GREEN = 0x00ff00;
$TRUE = 1;
$FALSE = 0;
$HOLESIZE = 32;

$v = [
    [ -1, -1, -1 ],
    [ -1, -1,  1 ],
    [ -1,  1,  1 ],
    [ -1,  1, -1 ],
    [  1, -1, -1 ],
    [  1, -1,  1 ],
    [  1,  1,  1 ],
    [  1,  1, -1 ],
];

$face = [
    [ 0, 1, 2, 3 ],
    [ 3, 2, 6, 7 ],
    [ 7, 6, 5, 4 ],
    [ 4, 5, 1, 0 ],
    [ 1, 2, 6, 5 ],
    [ 0, 4, 7, 3 ],
];

@facecolor = (
    0xff0000,		# blue
    0x0000ff,		# red
    0x00ffff,		# yellow
    0xffff00,		# cyan
    0xff00ff,		# magenta
    0xffffff,		# white
);

sub drawcube {
	my ($i);

	for ($i = 0; $i < 6; ++$i) {
		cpack ($facecolor[$i]);
		bgnpolygon;
		    v3f (@{$v->[$face->[$i][0]]});
		    v3f (@{$v->[$face->[$i][1]]});
		    v3f (@{$v->[$face->[$i][2]]});
		    v3f (@{$v->[$face->[$i][3]]});
		endpolygon;
	}
}

getgdesc (GD_BITS_NORM_DBL_RED) ||
    die "Double buffer RGB not available on this machie\n";

getgdesc (GD_BITS_NORM_ZBUFFER) ||
    die "Z-buffer not available on this machie\n";

getgdesc (GD_ZDRAW_GEOM) || getgdesc (GD_ZDRAW_PIXELS) ||
    die "Z-buffer drawing not available on this machie\n";

foreground;
prefsize (400, 400);
winopen ("Zdraw");
RGBmode;
doublebuffer;
gconfig;
qdevice (ESCKEY);
mmode (MVIEWING);
ortho (-2.0, 2.0, -2.0, 2.0, -2.0, 2.0);
zbuffer ($TRUE);
zclear;

$use_geom = getgdesc (GD_ZDRAW_GEOM);

$use_geom ||
	($holez = (pack ('L', getgdesc (GD_ZMAX))) x ($HOLESIZE * $HOLESIZE));

# draw the green wall once
cpack ($RGB_GREEN);
frontbuffer ($TRUE);
pushmatrix;
    translate (0.0, 0.0, 1.9);
    rectf (-2.0, -2.0, 2.0, 2.0);
popmatrix;
frontbuffer ($FALSE);

$xang = $yang = 0;

while (! (qtest && (($x, $val) = qread)[0] == ESCKEY && $val == 0)) {
	# create the holes in the green wall
	zbuffer ($FALSE);
	zdraw ($TRUE);
	backbuffer ($FALSE);

	if ($use_geom) {
		ortho2 (-0.5, 399.5, -0.5, 399.5);
		cpack (getgdesc (GD_ZMAX));
	}

	for ($i = 100; $i <= 300; $i += 50) {
		for ($j = 100; $j <= 300; $j += 50) {
			if ($use_geom) {
				rectf ($i, $j, $i + $HOLESIZE - 1,
				    $j + $HOLESIZE - 1);
			} else {
				lrectwrite ($i, $j, $i + $HOLESIZE - 1,
				    $j + $HOLESIZE - 1, \$holez);
			}
		}
	}

	$use_geom && ortho (-2.0, 2.0, -2.0, 2.0, -2.0, 2.0);

	zdraw ($FALSE);
	backbuffer ($TRUE);
	zbuffer ($TRUE);

	# z-buffered clear to background color and depth
	cpack ($RGB_BLACK);
	pushmatrix;
	    translate (0.0, 0.0, -1.9);
	    rectf (-2.0, -2.0, 2.0, 2.0);
	popmatrix;

	# draw the outside scene
	pushmatrix;
	    rotate ($xang, 'x');
	    rotate ($yang, 'y');
	    drawcube;
	popmatrix;
	swapbuffers;

	# update the rotation angles for next time through
	$xang += 11;
	$yang += 17;
	($xang > 3600) && ($xang -= 3600);
	($yang > 3600) && ($yang -= 3600);
}

gexit;

exit 0;
